#!/bin/bash

# 从Git历史中移除attachments文件夹
set -e

echo "🚀 开始从Git历史中移除attachments文件夹..."

# 1. 检查当前状态
echo "📊 检查当前Git状态..."
attachments_count=$(git ls-files | grep "attachments" | wc -l)
echo "当前被跟踪的attachments文件数量: $attachments_count"

if [ $attachments_count -eq 0 ]; then
    echo "✅ attachments文件夹已经被忽略，无需处理"
    exit 0
fi

# 2. 从Git索引中移除attachments文件（但保留本地文件）
echo "🗑️ 从Git索引中移除attachments文件..."
git rm --cached -r content/attachments/

# 3. 提交这个更改
echo "💾 提交移除attachments文件的更改..."
git commit -m "从Git跟踪中移除attachments文件夹"

echo "✅ 完成！attachments文件夹已从Git跟踪中移除"
echo "📁 本地文件仍然保留"
echo "🔒 未来attachments文件夹将被.gitignore忽略" 