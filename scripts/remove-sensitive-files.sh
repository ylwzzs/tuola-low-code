#!/bin/bash

# 从Git历史中移除包含敏感信息的文件
set -e

echo "🚨 开始移除包含敏感信息的文件..."

# 1. 从Git索引中移除敏感文件
echo "🗑️ 从Git索引中移除敏感文件..."
git rm --cached content/picgo_config.json

# 2. 提交这个更改
echo "💾 提交移除敏感文件的更改..."
git commit -m "移除包含敏感信息的配置文件"

# 3. 从Git历史中完全移除这个文件
echo "🧹 从Git历史中完全移除敏感文件..."
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch content/picgo_config.json' \
  --prune-empty --tag-name-filter cat -- --all

# 4. 清理和压缩仓库
echo "🧹 清理和压缩仓库..."
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo "✅ 完成！敏感文件已从Git历史中完全移除"
echo "🔒 请确保更新GitHub Secrets中的密钥" 