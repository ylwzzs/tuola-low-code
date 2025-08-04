---
aliases: ["1970703570984107351"]
title: GETDEPARTMENTCODE函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETDEPARTMENTCODE函数，获取指定部门编号。

说明：  
获取指定部门编号。

语法：  
GETDEPARTMENTCODE(String)

参数：

String为部门，填写部门ID，也可以是值为部门ID的部门类型变量，必填

示例：

GETDEPARTMENTCODE({表单.A部门})；返回'A001'