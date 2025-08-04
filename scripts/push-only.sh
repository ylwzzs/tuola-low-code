#!/bin/bash

# 只推送代码到GitHub，不进行本地构建
set -e

echo "🚀 开始推送代码到GitHub..."

# 1. 清理构建文件（如果存在）
echo "🧹 清理本地构建文件..."
rm -rf public/
rm -rf .quartz-cache/

# 2. 检查Git状态
echo "📊 检查Git状态..."
git status --short

# 3. 添加所有更改（除了被忽略的文件）
echo "📝 添加文件到Git..."
git add .

# 4. 提交更改
echo "💾 提交更改..."
git commit -m "更新文档内容 $(date '+%Y-%m-%d %H:%M:%S')"

# 5. 推送到GitHub
echo "📤 推送到GitHub..."
git push origin main

echo "✅ 推送完成！"
echo "🔄 GitHub Actions将自动构建并部署到阿里云OSS"
echo "🌐 网站地址：https://help.tuo-la.com" 