---
aliases: ["1970704111823207374"]
title: GETSUBDEPARTMENTS函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETSUBDEPARTMENTS函数，获取所有下级部门。

说明：  
获取所有下级部门

语法：  
GETSUBDEPARTMENTS(String)

参数：

String为部门，可以是部门ID，也可以是值为部门ID的部门类型字段，必填

示例：

GETSUBDEPARTMENTS({D:部门A})；返回'部门B,部门C'