---
aliases: ["1972014909965536080"]
title: IM文件消息支持密级
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 工作消息
---

## 功能介绍

密级功能是公司提供的一个安全特性，用于对信息进行分级保护。该功能允许用户根据信息的重要性和敏感程度，将其标记为不同的密级，从而实现对信息的分类管理和保护。

## 操作流程

### 一、如何开启

密级功能在【后台管理中心】-【数据安全】中进行配置  
注：新的团队会让选择等级保护和分级保护两种，逻辑是等级保护可以进行密级的自定义配置  
![](https://im.weaver.com.cn/server/index.php?s=/api/attachment/visitFile&sign=b7d2f24f68ee434d587deb55c2f0f6ff)

### 二、逻辑介绍

【分级保护】：  
分级保护适用于涉密信息系统，此功能启用后将影响系统中的所有数据，一旦启用将无法关闭，非涉密系统请慎重开启。  
将严格遵循涉密信息系统分级保护方案，人员密级固定四个等级：核心、重要、一般、非密；资源密级也固定四个等级：机密、秘密、内部、公开，只能修改名称，不可新建或禁用。  
![](https://im.weaver.com.cn/server/index.php?s=/api/attachment/visitFile&sign=45143a4b743f49242840d5f120c9b372)

【等级保护】：  
将在分级保护模式基础上，支持自定义资源密级、人员密级和两种密级的对应关系，支持根据自定义的资源密级和人员密级初始化数据。需要注意的是，在产生标密数据后将禁用密级调整操作。  
![](https://im.weaver.com.cn/server/index.php?s=/api/attachment/visitFile&sign=1c575bc5c9619d64579847a3abea8a91)

#### 2.1 PC客户端

pc端在聊天会话节点，点击聊天工具栏中文件功能，选择文件进行发送，或直接拖拽文件至聊天会话  
![](https://im.weaver.com.cn/server/index.php?s=/api/attachment/visitFile&sign=967c07dc79afe678a5ece599401a1334)  
选择文件后，页面会弹框提示，选择密级等级  
![](https://im.weaver.com.cn/server/index.php?s=/api/attachment/visitFile&sign=3674f8f887acb3c9884ab3c6c5f12754)

注：密级的选择依赖于人员密级，例如：在分级保护中人员等级为核心，可选择【机密】【秘密】【内部】【公开】等级密级进行发送，内容对应下方图示，等级保护则根据自定义内容来判定  
![](https://im.weaver.com.cn/server/index.php?s=/api/attachment/visitFile&sign=25c145b65f2030d642fc6edadc3fc700)

低密级无查看高密集权限

2.2移动端  
移动端在聊天会话界面，打开聊天工具栏，选择文件上传，图示所示，选择密级后进行发送  
![](https://im.weaver.com.cn/server/index.php?s=/api/attachment/visitFile&sign=10a0dc4b9132a50e12a16c101c020cdf)