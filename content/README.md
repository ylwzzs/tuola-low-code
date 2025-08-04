# 图片上传和链接替换工具

## 核心脚本

### 1. `simple_upload.sh` - 批量上传图片
- 功能：将 `attachments` 文件夹中的所有图片上传到阿里云OSS
- 生成：`upload_results.txt` (上传结果记录)
- 用法：`./simple_upload.sh`

### 2. `simple_replace.sh` - 批量替换链接
- 功能：将markdown文件中的本地图片链接替换为OSS链接
- 依赖：`upload_results.txt` (需要先运行上传脚本)
- 生成：`replace_log.txt` (替换日志)
- 用法：`./simple_replace.sh`

### 3. `upload_and_replace_images.sh` - 完整流程
- 功能：上传图片 + 替换链接的完整流程
- 支持：命令行参数，可选择只上传或只替换
- 用法：`./upload_and_replace_images.sh [选项]`

### 4. `quick_start.sh` - 快速开始
- 功能：引导用户完成依赖安装和配置
- 用法：`./quick_start.sh`

## 核心日志文件

- `upload_results.txt` - 上传结果记录 (文件名|OSS_URL)
- `replace_log.txt` - 链接替换日志
- `upload_log.txt` - 上传过程日志

## 配置文件

- `picgo_config.json` - PicGo配置文件
- `picgo_config_template.json` - 配置模板

## 使用流程

1. **配置PicGo**: 编辑 `picgo_config.json` 填入阿里云OSS信息
2. **上传图片**: `./simple_upload.sh`
3. **替换链接**: `./simple_replace.sh`

或者直接运行完整流程：`./upload_and_replace_images.sh` 