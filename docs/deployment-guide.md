# 部署指南 - 阿里云 OSS

本指南将帮助您配置 GitHub Actions 自动部署到阿里云 OSS 静态托管。

## 前置条件

1. **阿里云账号**：需要有一个阿里云账号
2. **OSS Bucket**：已创建并配置为静态网站托管
3. **GitHub 仓库**：代码已推送到 GitHub

## 阿里云 OSS 配置

### 1. 创建 OSS Bucket

1. 登录阿里云控制台
2. 进入对象存储 OSS 服务
3. 创建新的 Bucket
4. 配置为静态网站托管：
   - 进入 Bucket 管理
   - 选择"基础设置" > "静态页面"
   - 设置默认首页为 `index.html`
   - 设置默认 404 页面为 `404.html`

### 2. 配置访问权限

1. 进入 Bucket 的"权限管理"
2. 设置读写权限为"公共读"
3. 如果需要自定义域名，配置 CNAME 记录

### 3. 创建 Access Key

1. 进入阿里云控制台
2. 点击右上角头像 > "AccessKey 管理"
3. 创建 AccessKey（建议创建子账号的 AccessKey）
4. 记录 AccessKey ID 和 AccessKey Secret

## GitHub Secrets 配置

在您的 GitHub 仓库中，进入 Settings > Secrets and variables > Actions，添加以下 Secrets：

### 必需的 Secrets

| Secret 名称 | 描述 | 示例值 |
|------------|------|--------|
| `ALIBABA_CLOUD_ACCESS_KEY_ID` | 阿里云 AccessKey ID | `LTAI5txxxxxxxxxxxxxxx` |
| `ALIBABA_CLOUD_ACCESS_KEY_SECRET` | 阿里云 AccessKey Secret | `xxxxxxxxxxxxxxxxxxxxxxxxxxxx` |
| `ALIBABA_CLOUD_REGION_ID` | 阿里云地域 ID | `cn-hangzhou` |
| `OSS_BUCKET_NAME` | OSS Bucket 名称 | `my-quartz-site` |
| `OSS_ENDPOINT` | OSS 访问域名 | `oss-cn-hangzhou.aliyuncs.com` |

### 可选的 Secrets

| Secret 名称 | 描述 | 示例值 |
|------------|------|--------|
| `SITE_URL` | 自定义域名（如果有） | `https://help.tuo-la.com` |

## 地域 ID 参考

常用的阿里云地域 ID：

- `cn-hangzhou` - 华东1（杭州）
- `cn-shanghai` - 华东2（上海）
- `cn-beijing` - 华北1（北京）
- `cn-shenzhen` - 华南1（深圳）
- `cn-hongkong` - 香港

## OSS Endpoint 参考

根据您选择的地域，对应的 Endpoint：

- 杭州：`oss-cn-hangzhou.aliyuncs.com`
- 上海：`oss-cn-shanghai.aliyuncs.com`
- 北京：`oss-cn-beijing.aliyuncs.com`
- 深圳：`oss-cn-shenzhen.aliyuncs.com`
- 香港：`oss-cn-hongkong.aliyuncs.com`

## 部署流程

配置完成后，每次推送到 `main` 或 `master` 分支时，GitHub Actions 将自动：

1. 检出代码
2. 安装 Node.js 依赖
3. 构建静态网站
4. 安装 ossutil 工具
5. 配置阿里云凭证
6. 完全同步文件到 OSS（删除旧文件，上传新文件）

## 完全同步说明

本配置使用 `ossutil sync` 命令实现完全同步：

- **删除**：OSS 上存在但本地不存在的文件会被删除
- **更新**：本地文件与 OSS 文件不同的会被更新
- **新增**：本地新增的文件会被上传

这确保了 OSS 上的文件与构建结果完全一致。

## 故障排除

### 常见问题

1. **权限错误**：检查 AccessKey 权限是否正确
2. **Bucket 不存在**：确认 Bucket 名称拼写正确
3. **地域错误**：确认地域 ID 和 Endpoint 匹配

### 查看部署日志

在 GitHub 仓库的 Actions 页面可以查看详细的部署日志，帮助诊断问题。

## 自定义域名配置

如果需要使用自定义域名：

1. 在阿里云 DNS 中添加 CNAME 记录
2. 在 OSS Bucket 中配置自定义域名
3. 在 GitHub Secrets 中设置 `SITE_URL`

## 安全建议

1. 使用子账号的 AccessKey，而不是主账号
2. 为 AccessKey 设置最小权限原则
3. 定期轮换 AccessKey
4. 不要在代码中硬编码敏感信息 