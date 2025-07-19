#!/bin/bash

# 本地测试部署脚本
set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🧪 本地部署测试${NC}"

# 检查环境变量
echo -e "${YELLOW}📋 检查环境变量...${NC}"

REQUIRED_VARS=(
    "OSS_BUCKET_NAME"
    "OSS_ENDPOINT"
    "ALIBABA_CLOUD_ACCESS_KEY_ID"
    "ALIBABA_CLOUD_ACCESS_KEY_SECRET"
    "ALIBABA_CLOUD_REGION_ID"
)

for var in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!var}" ]; then
        echo -e "${RED}❌ 缺少环境变量: $var${NC}"
        echo -e "${YELLOW}💡 请设置环境变量或创建 .env 文件${NC}"
        exit 1
    else
        echo -e "${GREEN}✅ $var: ${!var}${NC}"
    fi
done

# 检查构建目录
if [ ! -d "public" ]; then
    echo -e "${YELLOW}📦 构建目录不存在，正在构建...${NC}"
    npm run quartz build
fi

# 检查 ossutil
if ! command -v ossutil &> /dev/null; then
    echo -e "${YELLOW}📥 安装 ossutil...${NC}"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        brew install ossutil
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        wget http://gosspublic.alicdn.com/ossutil/1.7.7/ossutil64
        chmod 755 ossutil64
        sudo mv ossutil64 /usr/local/bin/ossutil
    else
        echo -e "${RED}❌ 不支持的操作系统: $OSTYPE${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}✅ 所有检查通过！${NC}"
echo -e "${YELLOW}🚀 开始部署测试...${NC}"

# 运行部署脚本
./scripts/deploy.sh

echo -e "${GREEN}🎉 测试完成！${NC}" 