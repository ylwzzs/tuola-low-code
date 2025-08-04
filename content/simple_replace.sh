#!/bin/bash

# 简化的链接替换脚本

# 颜色输出
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   简化的链接替换工具          ${NC}"
echo -e "${BLUE}================================${NC}"
echo

# 检查上传结果文件
if [ ! -f "upload_results.txt" ]; then
    echo -e "${RED}❌ 未找到上传结果文件 upload_results.txt${NC}"
    echo "请先运行图片上传脚本"
    exit 1
fi

echo -e "${GREEN}✅ 找到上传结果文件${NC}"
echo

# 统计信息
upload_count=$(wc -l < upload_results.txt)
echo "已上传图片数: $upload_count"

# 查找包含图片链接的文件
echo "正在查找包含图片链接的文件..."
files_with_images=0

while IFS= read -r -d '' file; do
    if grep -q '!\[.*\](.*\.jpg)' "$file" 2>/dev/null; then
        files_with_images=$((files_with_images + 1))
        if [ $files_with_images -le 10 ]; then
            echo "  - $file"
        fi
    fi
done < <(find . -name "*.md" -type f -print0)

if [ $files_with_images -gt 10 ]; then
    echo "  ... 还有 $((files_with_images - 10)) 个文件"
fi

echo
echo "包含图片链接的文件数: $files_with_images"
echo

if [ $files_with_images -eq 0 ]; then
    echo -e "${YELLOW}⚠️  未找到包含图片链接的文件${NC}"
    exit 0
fi

# 确认操作
echo -e "${YELLOW}⚠️  重要提醒:${NC}"
echo "  1. 请确保已备份重要的 markdown 文件"
echo "  2. 此操作将修改所有包含图片链接的 markdown 文件"
echo "  3. 操作不可逆，请谨慎操作"
echo

read -p "是否开始替换？(y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}操作已取消${NC}"
    exit 0
fi

# 创建文件名到URL的映射（使用临时文件避免关联数组兼容性问题）
TEMP_MAP_FILE=$(mktemp)
while IFS='|' read -r filename url; do
    echo "$filename|$url" >> "$TEMP_MAP_FILE"
done < upload_results.txt

echo -e "${GREEN}开始替换链接...${NC}"
echo

# 创建替换日志
REPLACE_LOG="replace_log.txt"
> "$REPLACE_LOG"

# 计数器
total_processed=0
total_replaced=0

# 处理每个 markdown 文件
while IFS= read -r -d '' md_file; do
    if grep -q '!\[.*\](.*\.jpg)' "$md_file" 2>/dev/null; then
        total_processed=$((total_processed + 1))
        echo -n "[$total_processed/$files_with_images] 处理: $(basename "$md_file") ... "
        
        # 创建临时文件
        temp_file=$(mktemp)
        file_modified=false
        file_replace_count=0
        
        # 逐行处理
        while IFS= read -r line; do
            new_line="$line"
            
            # 检查是否包含图片链接
            if echo "$line" | grep -q '!\[.*\](.*\.jpg)'; then
                # 提取文件名
                image_name=$(echo "$line" | sed -n 's/.*!\[.*\](\([^)]*\.jpg\)).*/\1/p')
                if [ -n "$image_name" ]; then
                    # 查找对应的URL
                    new_url=$(grep "^$image_name|" "$TEMP_MAP_FILE" | cut -d'|' -f2)
                    if [ -n "$new_url" ]; then
                        # 替换图片链接
                        new_line=$(echo "$line" | sed "s|!\[.*\](.*\.jpg)|![]($new_url)|g")
                        echo "替换: $image_name -> $new_url" >> "$REPLACE_LOG"
                        file_modified=true
                        file_replace_count=$((file_replace_count + 1))
                        total_replaced=$((total_replaced + 1))
                    fi
                fi
            fi
            
            echo "$new_line" >> "$temp_file"
        done < "$md_file"
        
        # 如果文件有修改，替换原文件
        if [ "$file_modified" = true ]; then
            mv "$temp_file" "$md_file"
            echo -e "${GREEN}✅ (替换 $file_replace_count 个)${NC}"
        else
            rm "$temp_file"
            echo -e "${YELLOW}⚠️  (无替换)${NC}"
        fi
    fi
done < <(find . -name "*.md" -type f -print0)

# 清理临时文件
rm "$TEMP_MAP_FILE"

echo
echo -e "${GREEN}=== 替换完成 ===${NC}"
echo "处理文件数: $total_processed"
echo "替换链接数: $total_replaced"
echo "替换日志: $REPLACE_LOG"
echo

echo -e "${GREEN}✅ 链接替换完成！${NC}" 