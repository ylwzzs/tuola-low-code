---
aliases: ["1970704137884607377"]
title: GTLDEP函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GTLDEP函数，获取一级部门。

说明：  
获取指定部门所在的一级部门

语法：  
GTLDEP(String)

参数：

String为部门，可以是部门ID，也可以是值为部门ID的部门类型字段，必填

示例：

GTLDEP({D:部门B})；返回'部门A'