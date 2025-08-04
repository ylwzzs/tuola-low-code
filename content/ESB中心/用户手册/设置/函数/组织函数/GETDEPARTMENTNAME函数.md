---
aliases: ["1970703561379107350"]
title: GETDEPARTMENTNAME函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETDEPARTMENTNAME函数，获取指定部门名称。

说明：  
获取指定部门名称。

语法：  
GETDEPARTMENTNAME(String)

参数：

String为部门，填写部门ID，也可以是值为部门ID的部门类型变量，必填

示例：

GETDEPARTMENTNAME({表单.A部门})；返回'A部门'