---
aliases: ["1970704129191207376"]
title: GETSUBBRANCHSBYPID函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETSUBBRANCHSBYPID函数，获取所有下级分部。

说明：  
获取所有下级分部

语法：  
GETSUBBRANCHSBYPID(String)

参数：

String为分部，可以是分部ID，也可以是值为分部ID的分部类型字段，必填

示例：

GETSUBBRANCHSBYPID({D:分部A})；返回'分部B,分部C'