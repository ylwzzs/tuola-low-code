---
aliases: ["1970848115562809401"]
title: hdfs存储配置
created: 2025-07-14
modified: 2025-07-14
tags: ['基础模块']
theme: 知识文档
---

# **hdfs存储**

## 1. **nacos配置（eteams-storage-service.properties）**

l 若配置已存在，则进行修改，若配置不存在，则需要进行新增

# 存储策略

storage.server=hdfs

# 必填：HDFS存储配置namenode 如果开启了HA模式这里需要配置成ha的nameservce，例如 nameservice1

hadoop.hdfs.ip=

# 必填：HDFS存储配置namenode 开启了HA模式后端口号置为空值

hadoop.hdfs.port=

# 必填：HDFS存储配置用户名

hadoop.hdfs.userName=

# 选填：HDFS文件存储路径

# 选填：custom.rootPath=

# 选填：HDFS 是否开启HA模式

hadoop.hdfs.ha=false

# 选填：HDFS HA模式 nameservice名称 如 nameservice1

hadoop.hdfs.ha.nameservice=

# 选填：HDFS HA模式 namenode节点名称(英文逗号分隔) 例如 nn1,nn2

hadoop.hdfs.ha.nameservice.nodeName=

# 选填：HDFS HA模式 NameNode节点ip:NameNode（namenode rpc.address端口配置）英文逗号分隔 例如：nn1:8020,nn2:8020

hadoop.hdfs.ha.nameservice.node=

eg.

hadoop.hdfs.ip=10.12.102.22

hadoop.hdfs.userName=root

hadoop.hdfs.port=8020

## 2. **静态资源nginx配置**

l 若配置已存在，则进行修改，若配置不存在，则需要进行新增

l 修改好配置文件后，需要重启nginx

2.1. **国际化模块静态文件访问**

location /static/public/resource/i18n {

proxy\_pass  
oa系统访问地址域名/papi/file/static/hdfs/download/static/public/resource/i18n;

}

2.2. **云商店模块文件访问**

location /ecodestatic/ {

proxy\_pass oa系统访问地址域名/papi/file/static/hdfs/download/ecodestatic/;

}

2.3. **通用静态文件访问**

location /visitstatic {

#云端：

proxy\_pass oa系统访问地址域名/papi/file/static/hdfs/download/visitstatic;

}

# 必须在网关的 location 之前

location /api/file/visitstatic/ {

proxy\_pass oa系统访问地址域名/papi/file/static/hdfs/download/visitstatic;

}