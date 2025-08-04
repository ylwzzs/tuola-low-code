#!/bin/bash

# 简化的批量上传脚本

# 颜色输出
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   简化的批量图片上传工具      ${NC}"
echo -e "${BLUE}================================${NC}"
echo

# 检查 attachments 文件夹
if [ ! -d "./attachments" ]; then
    echo -e "${RED}❌ 未找到 attachments 文件夹${NC}"
    exit 1
fi

echo -e "${GREEN}✅ 找到 attachments 文件夹${NC}"
echo

# 统计图片文件
img_count=$(find ./attachments -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | wc -l | tr -d ' ')
echo "图片文件总数: $img_count"
echo

# 确认操作
echo -e "${YELLOW}⚠️  重要提醒:${NC}"
echo "  1. 此操作将上传所有图片到阿里云图床"
echo "  2. 上传过程可能需要较长时间"
echo "  3. 请确保网络连接稳定"
echo

read -p "是否开始上传？(y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}操作已取消${NC}"
    exit 0
fi

# 创建结果文件
RESULT_FILE="upload_results.txt"
> "$RESULT_FILE"

echo -e "${GREEN}开始批量上传...${NC}"
echo

# 计数器
total_count=0
success_count=0
fail_count=0

# 批量上传
while IFS= read -r -d '' file; do
    total_count=$((total_count + 1))
    filename=$(basename "$file")
    
    echo -n "[$total_count/$img_count] 上传: $filename ... "
    
    # 上传图片
    result=$(picgo upload "$file" 2>&1)
    exit_code=$?
    
    if [ $exit_code -eq 0 ]; then
        # 提取URL
        url=$(echo "$result" | grep -o 'https://[^[:space:]]*' | head -1)
        if [ -n "$url" ]; then
            echo -e "${GREEN}✅${NC}"
            echo "$filename|$url" >> "$RESULT_FILE"
            success_count=$((success_count + 1))
        else
            echo -e "${RED}❌ (无法提取URL)${NC}"
            fail_count=$((fail_count + 1))
        fi
    else
        echo -e "${RED}❌${NC}"
        fail_count=$((fail_count + 1))
    fi
    
    # 每上传10个文件显示一次进度
    if [ $((total_count % 10)) -eq 0 ]; then
        echo "进度: $total_count/$img_count (成功: $success_count, 失败: $fail_count)"
    fi
    
done < <(find ./attachments -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) -print0)

echo
echo -e "${GREEN}=== 上传完成 ===${NC}"
echo "总文件数: $total_count"
echo "成功: $success_count"
echo "失败: $fail_count"
echo "结果文件: $RESULT_FILE"
echo

if [ $success_count -gt 0 ]; then
    echo -e "${GREEN}✅ 上传成功！可以继续运行链接替换脚本${NC}"
else
    echo -e "${RED}❌ 没有成功上传任何文件${NC}"
fi 