---
aliases: ["1970703586691107353"]
title: GETALLSUPERDEPARTMENT函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETALLSUPERDEPARTMENT函数，获取指定部门所有上级部门。

说明：  
获取指定部门所有上级部门。存在多个上级部门时，返回所有上级部门形成的数组。

语法：  
GETALLSUPERDEPARTMENT(String)

参数：

String为部门，填写部门ID，也可以是值为部门ID的部门类型变量，必填

示例：

GETALLSUPERDEPARTMENT({表单.A部门})；返回A部门的所有上级部门形成的数组