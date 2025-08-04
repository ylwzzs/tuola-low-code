---
aliases: ["1974522195113194344"]
title: 标签与ESB进行交互
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 标签
---

# **一、功能背景及价值用途**

在业务流程中，当标签发生变化时（删除、更新以及给事项打标签），三方模块无法自动感知，导致标签与三方模块之间缺乏有效的联动。为解决这一问题，同时降低标签模块与三方模块的耦合度，标签支持 ESB 通知三方功能应运而生。通过该功能，三方模块无需与标签模块直接耦合，借助 ESB 即可接收标签变化信息，如标签删除、更新、添加关联关系等。这不仅提升了系统间信息交互的效率，还增强了系统的灵活性和可扩展性。

# **二、功能概述及使用说明**

## **1、业务流程图/配置过程图**

1、**新建 ESB 动作流：**操作路径为 “后台管理中心/ESB 中心/新建动作流”，选择触发类型为 “系统应用事件触发”，操作对象为 “标签”，操作类型选择 “标记标签/标签操作事件”，完成设置后点击 “保存”。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/346b63a1f93cf3e510263fc34e70a374.jpg)

新增ESB动作流

2. **ESB 动作流关联标签：**有设置权限的用户在标签模块“设置/系统设置”里，进入 “ESB 设置”，分别针对 “标签添加 / 移除时”、“标签删除时”、“标签修改时” 配置刚才在 ESB 中心建立好的动作流，最后点击 “保存”。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/afa3ad4fed23fe1854314100a6bd9652.jpg)

ESB动作流关联标签

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/46c90db7c0b6f3c808002bf6a53d4d2b.jpg)

ESB动作流关联标签完整流程图

## **2、具体功能说明**

1、标签ESB配置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7c300ead6afd933bcdca0c3188a20ab9.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/90591c0549de05bb4b066679872edde8.jpg)

配置好后在标签模块中进行关联如图：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b835ea68382832c8a22af8e29f515c49.jpg)

选择对应的动作流进行关联，关联后保存。

3、在标签模块配置后，标签做对应操作就会触发ESB，比如当配置了标签删除的时候触发动作流，那么在删除标签时就会触发对应的esb动作流。

# **三、延伸用法**

配置了当删除标签的时候触发消息提醒配置如下：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e7389ba63c2996ec42229ac75311265f.jpg)

当删除标签的时候收到IM提醒，效果如下：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4ef23d626cb1be19883b4725aa666023.jpg)

# **四、使用注意点**

1、配置ESB的时候必须选择标签才能在标签模块选择到。

2、配置完ESB后必须启用，启用后才能在标签模块配置的时候选择到。

