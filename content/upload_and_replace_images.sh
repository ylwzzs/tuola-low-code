#!/bin/bash

# 配置变量
ASSETS_DIR="./attachments"
PICGO_CONFIG="$HOME/.picgo/config.json"
LOG_FILE="./upload_log.txt"
REPLACE_LOG="./replace_log.txt"
UPLOAD_RESULTS="upload_results.txt"

# 处理目录配置（默认为当前目录，包含所有子文件夹）
PROCESS_DIR="."

# 阿里云图床配置（需要根据实际情况修改）
ALIYUN_ENDPOINT="https://your-bucket.oss-cn-region.aliyuncs.com"
ALIYUN_BUCKET="your-bucket-name"
ALIYUN_REGION="cn-region"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log() {
    echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $1${NC}" | tee -a "$LOG_FILE"
}

warn() {
    echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] WARNING: $1${NC}" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1${NC}" | tee -a "$LOG_FILE"
}

# 检查依赖
check_dependencies() {
    log "检查依赖..."
    
    if ! command -v picgo &> /dev/null; then
        error "picgo 未安装，请先安装 picgo"
        echo "安装命令: npm install -g picgo"
        exit 1
    fi
    
    log "依赖检查完成"
}

# 配置 PicGo
setup_picgo() {
    log "配置 PicGo..."
    
    # 创建 PicGo 配置目录
    mkdir -p "$HOME/.picgo"
    
    # 检查是否已有配置
    if [ -f "$PICGO_CONFIG" ]; then
        log "发现现有 PicGo 配置"
        return 0
    fi
    
    # 创建阿里云 OSS 配置
    cat > "$PICGO_CONFIG" << EOF
{
  "picBed": {
    "current": "aliyun",
    "aliyun": {
      "accessKeyId": "YOUR_ACCESS_KEY_ID",
      "accessKeySecret": "YOUR_ACCESS_KEY_SECRET",
      "bucket": "$ALIYUN_BUCKET",
      "area": "$ALIYUN_REGION",
      "path": "images/",
      "customUrl": "$ALIYUN_ENDPOINT",
      "options": ""
    }
  },
  "picgoPlugins": {}
}
EOF
    
    warn "请编辑 $PICGO_CONFIG 文件，填入您的阿里云 OSS 配置信息"
    warn "需要配置: accessKeyId, accessKeySecret, bucket, area, customUrl"
    read -p "配置完成后按回车继续..."
}

# 检查重名文件
check_duplicates() {
    log "检查重名文件..."
    
    local duplicates_found=false
    
    # 获取所有图片文件的基本名
    find "$ASSETS_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | \
    while read -r file; do
        local filename=$(basename "$file")
        local count=$(find "$ASSETS_DIR" -name "$filename" | wc -l)
        
        if [ "$count" -gt 1 ]; then
            duplicates_found=true
            warn "发现重名文件: $filename (共 $count 个)"
            
            # 显示所有重名文件
            find "$ASSETS_DIR" -name "$filename" | while read -r dup_file; do
                echo "  - $dup_file"
            done
        fi
    done
    
    if [ "$duplicates_found" = false ]; then
        log "未发现重名文件"
    else
        warn "发现重名文件，上传时可能会覆盖"
        read -p "是否继续？(y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log "用户取消操作"
            exit 0
        fi
    fi
}

# 上传单个图片
upload_image() {
    local file_path="$1"
    local file_name=$(basename "$file_path")
    
    log "上传图片: $file_name"
    
    # 使用 picgo 上传
    local result=$(picgo upload "$file_path" 2>&1)
    
    if [ $? -eq 0 ]; then
        # 提取上传后的URL
        local url=$(echo "$result" | grep -o 'https://[^[:space:]]*' | head -1)
        if [ -n "$url" ]; then
            echo "$file_name|$url" >> "$UPLOAD_RESULTS"
            log "上传成功: $file_name -> $url"
            return 0
        else
            error "无法提取上传URL: $result"
            return 1
        fi
    else
        error "上传失败: $result"
        return 1
    fi
}

# 批量上传图片
upload_all_images() {
    log "开始批量上传图片..."
    
    # 清空结果文件
    > "$UPLOAD_RESULTS"
    
    local upload_count=0
    local success_count=0
    local fail_count=0
    
    # 查找所有图片文件并上传
    while IFS= read -r -d '' file; do
        upload_count=$((upload_count + 1))
        log "处理第 $upload_count 个文件: $(basename "$file")"
        
        if upload_image "$file"; then
            success_count=$((success_count + 1))
        else
            fail_count=$((fail_count + 1))
        fi
    done < <(find "$ASSETS_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) -print0)
    
    log "上传完成: 成功 $success_count 个，失败 $fail_count 个"
}

# 替换 markdown 文件中的图片链接
replace_image_links() {
    log "开始替换 markdown 文件中的图片链接..."
    
    # 清空替换日志
    > "$REPLACE_LOG"
    
    # 检查上传结果文件
    if [ ! -f "$UPLOAD_RESULTS" ]; then
        error "未找到上传结果文件: $UPLOAD_RESULTS"
        return 1
    fi
    
    # 创建文件名到URL的映射
    declare -A file_url_map
    while IFS='|' read -r filename url; do
        file_url_map["$filename"]="$url"
    done < "$UPLOAD_RESULTS"
    
    local replace_count=0
    
    # 查找所有 markdown 文件（递归查找子文件夹）
    while IFS= read -r -d '' md_file; do
        local file_modified=false
        
        # 检查文件是否包含图片链接
        if grep -q '!\[.*\](.*\.jpg)' "$md_file"; then
            log "处理文件: $md_file"
            
            # 创建临时文件
            local temp_file=$(mktemp)
            
            # 逐行处理
            while IFS= read -r line; do
                local new_line="$line"
                
                # 使用 sed 来匹配和替换图片链接
                if echo "$line" | grep -q '!\[.*\](.*\.jpg)'; then
                    # 提取文件名
                    local image_name=$(echo "$line" | sed -n 's/.*!\[.*\](\([^)]*\.jpg\)).*/\1/p')
                    if [ -n "$image_name" ]; then
                        # 检查是否有对应的上传URL
                        if [ -n "${file_url_map[$image_name]}" ]; then
                            local new_url="${file_url_map[$image_name]}"
                            # 替换图片链接
                            new_line=$(echo "$line" | sed "s|!\[.*\](.*\.jpg)|![]($new_url)|g")
                            echo "替换: $image_name -> $new_url" >> "$REPLACE_LOG"
                            file_modified=true
                            replace_count=$((replace_count + 1))
                            log "替换图片链接: $image_name -> $new_url"
                        else
                            warn "未找到图片 $image_name 的上传URL"
                        fi
                    fi
                fi
                
                echo "$new_line" >> "$temp_file"
            done < "$md_file"
            
            # 如果文件有修改，替换原文件
            if [ "$file_modified" = true ]; then
                mv "$temp_file" "$md_file"
                log "已更新文件: $md_file"
            else
                rm "$temp_file"
            fi
        fi
    done < <(find "$PROCESS_DIR" -name "*.md" -type f -print0)
    
    log "替换完成，共替换 $replace_count 个图片链接"
}

# 显示统计信息
show_statistics() {
    log "=== 操作统计 ==="
    
    if [ -f "$UPLOAD_RESULTS" ]; then
        local upload_count=$(wc -l < "$UPLOAD_RESULTS")
        log "成功上传图片: $upload_count 个"
    fi
    
    if [ -f "$REPLACE_LOG" ]; then
        local replace_count=$(wc -l < "$REPLACE_LOG")
        log "替换图片链接: $replace_count 个"
    fi
    
    # 显示处理的文件统计
    local total_md_files=$(find "$PROCESS_DIR" -name "*.md" -type f | wc -l)
    local processed_md_files=$(find "$PROCESS_DIR" -name "*.md" -type f -exec grep -l '!\[.*\](.*\.jpg)' {} \; 2>/dev/null | wc -l)
    log "总 markdown 文件数: $total_md_files"
    log "包含图片链接的文件数: $processed_md_files"
    
    log "详细日志: $LOG_FILE"
    log "替换日志: $REPLACE_LOG"
    log "上传结果: $UPLOAD_RESULTS"
}

# 显示帮助信息
show_help() {
    echo "用法: $0 [选项] [目录]"
    echo
    echo "选项:"
    echo "  -h, --help        显示此帮助信息"
    echo "  -d, --dir DIR     指定要处理的目录 (默认: 当前目录)"
    echo "  -a, --assets DIR  指定图片文件夹路径 (默认: ./attachments)"
    echo "  --upload-only     只上传图片，不替换链接"
    echo "  --replace-only    只替换链接，不上传图片"
    echo
    echo "示例:"
    echo "  $0                    # 完整流程：上传图片 + 替换链接"
    echo "  $0 --upload-only      # 只上传图片到图床"
    echo "  $0 --replace-only     # 只替换 markdown 中的图片链接"
    echo "  $0 /path/to/docs      # 处理指定目录及其所有子文件夹"
    echo "  $0 -d /path/to/docs   # 同上"
    echo "  $0 -a /path/to/images # 指定图片文件夹路径"
    echo
}

# 解析命令行参数
parse_arguments() {
    local UPLOAD_ONLY=false
    local REPLACE_ONLY=false
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -d|--dir)
                PROCESS_DIR="$2"
                shift 2
                ;;
            -a|--assets)
                ASSETS_DIR="$2"
                shift 2
                ;;
            --upload-only)
                UPLOAD_ONLY=true
                shift
                ;;
            --replace-only)
                REPLACE_ONLY=true
                shift
                ;;
            -*)
                error "未知选项: $1"
                show_help
                exit 1
                ;;
            *)
                if [ -z "$PROCESS_DIR" ] || [ "$PROCESS_DIR" = "." ]; then
                    PROCESS_DIR="$1"
                else
                    error "只能指定一个目录"
                    show_help
                    exit 1
                fi
                shift
                ;;
        esac
    done
    
    # 验证目录是否存在
    if [ ! -d "$PROCESS_DIR" ]; then
        error "指定的目录不存在: $PROCESS_DIR"
        exit 1
    fi
    
    if [ ! -d "$ASSETS_DIR" ]; then
        error "指定的图片文件夹不存在: $ASSETS_DIR"
        exit 1
    fi
    
    log "处理目录: $PROCESS_DIR"
    log "图片文件夹: $ASSETS_DIR"
}

# 主函数
main() {
    log "开始图片上传和链接替换流程..."
    
    # 解析命令行参数
    parse_arguments "$@"
    
    # 检查依赖
    check_dependencies
    
    # 配置 PicGo
    setup_picgo
    
    if [ "$UPLOAD_ONLY" = true ]; then
        log "只执行上传操作..."
        
        # 检查重名文件
        check_duplicates
        
        # 只上传图片
        upload_all_images
        
        log "上传操作完成！"
        return 0
    fi
    
    if [ "$REPLACE_ONLY" = true ]; then
        log "只执行替换操作..."
        
        # 只替换链接
        replace_image_links
        
        # 显示统计信息
        show_statistics
        
        log "替换操作完成！"
        return 0
    fi
    
    # 完整流程
    # 检查重名文件
    check_duplicates
    
    # 上传图片
    upload_all_images
    
    # 替换链接
    replace_image_links
    
    # 显示统计信息
    show_statistics
    
    log "所有操作完成！"
}

# 运行主函数
main "$@" 