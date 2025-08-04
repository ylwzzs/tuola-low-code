#!/bin/bash

# 从Git历史中完全移除attachments文件
set -e

echo "🚀 开始清理Git历史中的attachments文件..."

# 1. 检查当前状态
echo "📊 检查Git历史中的attachments文件..."
attachments_in_history=$(git log --name-only --pretty=format: | grep attachments | wc -l)
echo "Git历史中的attachments文件数量: $attachments_in_history"

if [ $attachments_in_history -eq 0 ]; then
    echo "✅ Git历史中已经没有attachments文件"
    exit 0
fi

# 2. 使用git filter-branch移除attachments文件
echo "🗑️ 从Git历史中移除attachments文件..."
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch -r content/attachments/' \
  --prune-empty --tag-name-filter cat -- --all

# 3. 清理和压缩仓库
echo "🧹 清理和压缩仓库..."
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo "✅ 完成！attachments文件已从Git历史中完全移除"
echo "📁 本地文件仍然保留"
echo "🔒 未来attachments文件夹将被.gitignore忽略" 