#!/bin/bash

# 构建并部署到阿里云OSS脚本
set -e

echo "🚀 开始构建和部署流程..."

# 1. 清理之前的构建
echo "📁 清理之前的构建文件..."
rm -rf public/

# 2. 本地构建
echo "🔨 开始本地构建..."
npm run quartz build

# 3. 检查构建结果
if [ ! -d "public" ]; then
    echo "❌ 构建失败：public 目录不存在"
    exit 1
fi

echo "✅ 构建完成！构建文件大小："
du -sh public/

# 4. 部署到OSS
echo "☁️ 开始部署到阿里云OSS..."
./scripts/deploy.sh

echo "🎉 部署完成！"
echo "🌐 网站地址：https://help.tuo-la.com" 