---
aliases: ["1970848122568109403"]
title: fastdfs存储配置
created: 2025-07-14
modified: 2025-07-14
tags: ['基础模块']
theme: 知识文档
---

# **fastdfs存储**

## 1. **nacos配置（eteams-storage-service.properties）**

l 若配置已存在，则进行修改，若配置不存在，则需要进行新增

# 存储策略

storage.server=fastdfs

# 必填：fastdfs nginx访问地址

fast.download.host=

# 必填：fastdfs存储配置-文件组

fastdfs.group=

# 必填：fastdfs存储配置-tracker服务节点

fastdfs.tracker\_servers=

# 选填：fastdfs存储配置-最大线程池数量

fastdfs.connection\_pool.max\_count\_per\_entry=

# 选填：fastdfs存储配置-tracker服务节点

fast.download.host=

# 选填：fastdfs存储配置-防盗链密钥

fastdfs.http\_secret\_key=

# 选填：fastdfs存储配置-线程池开关

fastdfs.connection\_pool.enabled=

# 选填：fastdfs存储配置-链接超时时间

fastdfs.connect\_timeout\_in\_seconds=

# 选填：fastdfs存储配置-tracker服务端口

fastdfs.http\_tracker\_http\_port=

# 选填：fastdfs存储配置-线程最大等待时间

fastdfs.connection\_pool.max\_wait\_time\_in\_ms=

# 选填：fastdfs存储配置-防盗链开关

fastdfs.http\_anti\_steal\_token=

# 选填：fastdfs存储配置-线程最大存活时间

fastdfs.connection\_pool.max\_idle\_time=

# 选填：fastdfs存储配置-连接超时时间

fastdfs.network\_timeout\_in\_seconds=

# 选填：fastdfs存储配置-编码方式

fastdfs.charset=

eg.

fastdfs.download.host=http://10.12.108.51:8888

fastdfs.group=group1

fastdfs.tracker\_servers=10.12.108.51:22122

fastdfs.connection\_pool.max\_count\_per\_entry=500

fastdfs.http\_secret\_key=FastDFS1234567890

fastdfs.connection\_pool.enabled=true

fastdfs.connect\_timeout\_in\_seconds=60

fastdfs.http\_tracker\_http\_port=80

fastdfs.connection\_pool.max\_wait\_time\_in\_ms=60000

fastdfs.http\_anti\_steal\_token=false

fastdfs.connection\_pool.max\_idle\_time=3600

fastdfs.network\_timeout\_in\_seconds=60

fastdfs.charset=UTF-8

## 2. **静态资源nginx配置**

l 若配置已存在，则进行修改，若配置不存在，则需要进行新增

l 修改好配置文件后，需要重启nginx

2.1. **国际化模块静态文件访问**

location /static/public/resource/i18n {

proxy\_pass  
OA访问地址域名/papi/file/static/fastdfs/download/static/public/resource/i18n;

}

2.2. **云商店模块文件访问**

location /ecodestatic/ {

proxy\_pass  
OA访问地址域名/papi/file/static/fastdfs/download/ecodestatic/;

}

2.3. **通用静态文件访问**

location /visitstatic {

#云端：

proxy\_pass OA访问地址域名/papi/file/static/fastdfs/download/visitstatic;

}

# 必须在网关的 location 之前

location /api/file/visitstatic/ {

proxy\_pass OA访问地址域名/papi/file/static/fastdfs/download/visitstatic;

}