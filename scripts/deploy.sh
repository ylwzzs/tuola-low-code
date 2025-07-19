#!/bin/bash

# 部署脚本 - 完全同步到阿里云 OSS
set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 配置变量
BUCKET_NAME="${OSS_BUCKET_NAME}"
ENDPOINT="${OSS_ENDPOINT}"
REGION="${ALIBABA_CLOUD_REGION_ID}"

echo -e "${GREEN}🚀 开始部署到阿里云 OSS...${NC}"

# 检查必要的环境变量
if [ -z "$BUCKET_NAME" ]; then
    echo -e "${RED}❌ 错误: OSS_BUCKET_NAME 环境变量未设置${NC}"
    exit 1
fi

if [ -z "$ENDPOINT" ]; then
    echo -e "${RED}❌ 错误: OSS_ENDPOINT 环境变量未设置${NC}"
    exit 1
fi

# 检查 public 目录是否存在
if [ ! -d "public" ]; then
    echo -e "${RED}❌ 错误: public 目录不存在，请先运行构建命令${NC}"
    exit 1
fi

echo -e "${YELLOW}📦 构建目录: public/${NC}"
echo -e "${YELLOW}🪣 OSS Bucket: $BUCKET_NAME${NC}"
echo -e "${YELLOW}🌐 Endpoint: $ENDPOINT${NC}"

# 使用 ossutil 进行完全同步
echo -e "${YELLOW}🔄 开始同步文件...${NC}"

# 方法1: 使用 ossutil sync 命令（推荐）
if command -v ossutil &> /dev/null; then
    echo -e "${GREEN}✅ 使用 ossutil 进行同步${NC}"
    
    # 配置 ossutil
    ossutil config -e "$ENDPOINT" -i "$ALIBABA_CLOUD_ACCESS_KEY_ID" -k "$ALIBABA_CLOUD_ACCESS_KEY_SECRET"
    
    # 完全同步（删除目标端多余文件，上传本地文件）
    ossutil sync public/ oss://$BUCKET_NAME/ --delete --force
    
    echo -e "${GREEN}✅ 同步完成！${NC}"
    
# 方法2: 使用阿里云 CLI
elif command -v aliyun &> /dev/null; then
    echo -e "${GREEN}✅ 使用阿里云 CLI 进行同步${NC}"
    
    # 先列出 OSS 上的所有文件
    echo -e "${YELLOW}📋 获取 OSS 现有文件列表...${NC}"
    aliyun oss list-objects --bucket-name "$BUCKET_NAME" --output table > /tmp/oss_files.txt
    
    # 删除 OSS 上的所有文件
    echo -e "${YELLOW}🗑️  删除 OSS 上的现有文件...${NC}"
    aliyun oss delete-objects --bucket-name "$BUCKET_NAME" --objects file:///tmp/oss_files.txt
    
    # 上传新文件
    echo -e "${YELLOW}📤 上传新文件...${NC}"
    aliyun oss put-object --bucket-name "$BUCKET_NAME" --object-name "/" --file-path "public/"
    
    echo -e "${GREEN}✅ 同步完成！${NC}"
    
else
    echo -e "${RED}❌ 错误: 未找到 ossutil 或 aliyun CLI 工具${NC}"
    echo -e "${YELLOW}💡 请安装阿里云 CLI 工具:${NC}"
    echo -e "   - ossutil: https://help.aliyun.com/document_detail/120075.html"
    echo -e "   - aliyun CLI: https://help.aliyun.com/document_detail/121541.html"
    exit 1
fi

# 验证部署
echo -e "${YELLOW}🔍 验证部署结果...${NC}"
if command -v ossutil &> /dev/null; then
    ossutil ls oss://$BUCKET_NAME/ --recursive | head -10
elif command -v aliyun &> /dev/null; then
    aliyun oss list-objects --bucket-name "$BUCKET_NAME" --output table | head -10
fi

echo -e "${GREEN}🎉 部署成功完成！${NC}"
echo -e "${GREEN}🌐 网站地址: https://$BUCKET_NAME.$ENDPOINT${NC}"

# 如果有自定义域名，也显示
if [ ! -z "$SITE_URL" ]; then
    echo -e "${GREEN}🌐 自定义域名: $SITE_URL${NC}"
fi 