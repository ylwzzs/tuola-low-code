---
aliases: ["1970703623676607358"]
title: GETHRMNAME函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETHRMNAME函数，获取指定人员的姓名。

说明：  
获取指定人员的姓名。

语法：  
GETHRMNAME(String)

参数：

String为人员，填写人员ID，也可以是值为人员ID的人员类型变量，必填

示例：

GETHRMNAME({U:张三})；返回'张三'