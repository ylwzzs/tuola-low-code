---
aliases: ["1970703595382207354"]
title: GETSUBCOMPANYNAME函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETSUBCOMPANYNAME函数，获取指定分部名称。

说明：  
获取指定分部名称。

语法：  
GETSUBCOMPANYNAME(String)

参数：

String为分部，填写分部ID，也可以是值为分部ID的分部类型变量，必填

示例：

GETSUBCOMPANYNAME({表单.A分部})；返回'A分部'