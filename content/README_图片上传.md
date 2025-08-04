# 图片上传和图床链接替换工具

这个工具可以帮助您将 `attachments` 文件夹中的图片上传到阿里云图床，并批量替换 markdown 文档中的图片链接。

## 功能特性

- ✅ 批量上传图片到阿里云 OSS 图床
- ✅ 自动替换 markdown 文件中的图片链接
- ✅ 处理重名文件，支持覆盖确认
- ✅ 详细的日志记录和统计信息
- ✅ 支持多种图片格式 (jpg, jpeg, png, gif, webp)

## 前置要求

### 1. 安装依赖

```bash
# 安装 PicGo
npm install -g picgo

# 安装 jq (可选，用于 JSON 处理)
brew install jq  # macOS
# 或
apt-get install jq  # Ubuntu
```

### 2. 阿里云 OSS 配置

您需要准备以下阿里云 OSS 信息：

- **AccessKey ID**: 阿里云访问密钥 ID
- **AccessKey Secret**: 阿里云访问密钥 Secret
- **Bucket 名称**: OSS 存储桶名称
- **区域**: OSS 存储桶所在区域 (如 cn-hangzhou)
- **自定义域名**: OSS 访问域名（可选，留空则使用官方域名）

## 使用步骤

### 1. 配置 PicGo

运行脚本后，它会自动创建 PicGo 配置文件。您需要编辑 `~/.picgo/config.json` 文件：

```bash
# 编辑配置文件
nano ~/.picgo/config.json
```

将以下内容替换为您的实际配置：

```json
{
  "picBed": {
    "current": "aliyun",
    "aliyun": {
      "accessKeyId": "您的AccessKey ID",
      "accessKeySecret": "您的AccessKey Secret",
      "bucket": "您的Bucket名称",
      "area": "cn-hangzhou",
      "path": "images/",
      "customUrl": "",
      "options": ""
    }
  },
  "picgoPlugins": {}
}
```

### 2. 运行脚本

```bash
# 给脚本执行权限
chmod +x upload_and_replace_images.sh

# 运行脚本
./upload_and_replace_images.sh
```

### 3. 脚本执行流程

1. **检查依赖**: 验证 PicGo 是否已安装
2. **配置检查**: 检查 PicGo 配置文件
3. **重名检查**: 检查 attachments 文件夹中的重名文件
4. **批量上传**: 上传所有图片到阿里云图床
5. **链接替换**: 替换 markdown 文件中的图片链接
6. **统计信息**: 显示操作结果统计

## 输出文件

脚本运行后会生成以下文件：

- `upload_log.txt`: 详细的操作日志
- `replace_log.txt`: 图片链接替换记录
- `upload_results.txt`: 文件名到图床URL的映射

## 示例

### 上传前
```markdown
![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9a295bcb76b43cde854278d96debfa55.jpg)
```

### 上传后
```markdown
![示例图片](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9a295bcb76b43cde854278d96debfa55.jpg)
```

## 注意事项

1. **备份重要文件**: 运行脚本前请备份您的 markdown 文件
2. **重名处理**: 如果发现重名文件，脚本会提示您是否继续
3. **网络连接**: 确保网络连接稳定，上传大量图片需要时间
4. **权限设置**: 确保阿里云 OSS 的访问权限配置正确

## 故障排除

### 常见问题

1. **PicGo 未安装**
   ```bash
   npm install -g picgo
   ```

2. **配置错误**
   - 检查 AccessKey 是否正确
   - 确认 Bucket 名称和区域
   - 验证自定义域名格式

3. **上传失败**
   - 检查网络连接
   - 确认 OSS 权限设置
   - 查看详细错误日志

4. **链接替换失败**
   - 确认图片文件名匹配
   - 检查 markdown 文件格式
   - 查看替换日志

## 高级配置

### 自定义图片路径

您可以在 PicGo 配置中修改 `path` 字段来设置图片在 OSS 中的存储路径：

```json
"path": "your-custom-path/"
```

### 批量处理特定文件

如果您只想处理特定的 markdown 文件，可以修改脚本中的查找命令：

```bash
# 只处理特定目录
find ./your-directory -name "*.md" -type f

# 只处理特定文件
find . -name "specific-file.md" -type f
```

## 支持

如果遇到问题，请查看：

1. `upload_log.txt` - 详细的操作日志
2. `replace_log.txt` - 替换操作记录
3. PicGo 官方文档: https://picgo.github.io/PicGo-Doc/

## 许可证

