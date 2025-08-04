#!/bin/bash

# 快速开始脚本

# 颜色输出
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   图片上传和图床链接替换工具   ${NC}"
echo -e "${BLUE}================================${NC}"
echo

# 检查是否在正确的目录
if [ ! -d "./attachments" ]; then
    echo -e "${RED}❌ 未找到 attachments 文件夹${NC}"
    echo "请确保在正确的目录中运行此脚本"
    exit 1
fi

echo -e "${GREEN}✅ 找到 attachments 文件夹${NC}"
echo

# 步骤1: 检查依赖
echo -e "${YELLOW}步骤 1: 检查依赖${NC}"
if ! command -v picgo &> /dev/null; then
    echo -e "${RED}❌ PicGo 未安装${NC}"
    echo "正在安装 PicGo..."
    npm install -g picgo
    if [ $? -ne 0 ]; then
        echo -e "${RED}安装失败，请手动安装: npm install -g picgo${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✅ PicGo 已安装${NC}"
fi
echo

# 步骤2: 配置 PicGo
echo -e "${YELLOW}步骤 2: 配置 PicGo${NC}"
CONFIG_FILE="$HOME/.picgo/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${YELLOW}⚠️  未找到 PicGo 配置文件，正在创建...${NC}"
    mkdir -p "$HOME/.picgo"
    
    # 创建默认配置
    cat > "$CONFIG_FILE" << 'EOF'
{
  "picBed": {
    "current": "aliyun",
    "aliyun": {
      "accessKeyId": "YOUR_ACCESS_KEY_ID",
      "accessKeySecret": "YOUR_ACCESS_KEY_SECRET",
      "bucket": "your-bucket-name",
      "area": "cn-hangzhou",
      "path": "images/",
      "customUrl": "",
      "options": ""
    }
  },
  "picgoPlugins": {}
}
EOF
    
    echo -e "${GREEN}✅ 配置文件已创建: $CONFIG_FILE${NC}"
    echo
    echo -e "${YELLOW}请编辑配置文件并填入您的阿里云 OSS 信息:${NC}"
    echo "  1. accessKeyId: 您的阿里云 AccessKey ID"
    echo "  2. accessKeySecret: 您的阿里云 AccessKey Secret"
    echo "  3. bucket: 您的 OSS 存储桶名称"
    echo "  4. area: 存储桶所在区域 (如 cn-hangzhou)"
    echo "  5. customUrl: 您的 OSS 访问域名（可选，留空则使用官方域名）"
    echo
    
    read -p "配置完成后按回车继续..."
else
    echo -e "${GREEN}✅ 找到现有配置文件${NC}"
fi
echo

# 步骤3: 测试配置
echo -e "${YELLOW}步骤 3: 测试配置${NC}"
read -p "是否运行配置测试？(Y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    ./test_picgo.sh
    echo
fi

# 步骤4: 显示统计信息
echo -e "${YELLOW}步骤 4: 显示文件统计${NC}"
echo "attachments 文件夹中的图片文件:"
find ./attachments -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | wc -l | xargs echo "  总数:"
echo

echo "包含图片链接的 markdown 文件:"
find . -name "*.md" -type f -exec grep -l "!\[.*\](.*\.(jpg|jpeg|png|gif|webp))" {} \; | wc -l | xargs echo "  总数:"
echo

# 步骤5: 确认开始
echo -e "${YELLOW}步骤 5: 开始处理${NC}"
echo -e "${RED}⚠️  重要提醒:${NC}"
echo "  1. 请确保已备份重要的 markdown 文件"
echo "  2. 确保网络连接稳定"
echo "  3. 上传大量图片可能需要较长时间"
echo

read -p "是否开始上传图片和替换链接？(y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}开始执行主脚本...${NC}"
    echo
    ./upload_and_replace_images.sh
else
    echo -e "${YELLOW}已取消操作${NC}"
    echo
    echo "您可以稍后手动运行:"
    echo "  ./upload_and_replace_images.sh"
fi

echo
echo -e "${GREEN}快速开始脚本执行完成！${NC}" 