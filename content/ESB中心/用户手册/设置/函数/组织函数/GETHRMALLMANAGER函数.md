---
aliases: ["1970703382338407341"]
title: GETHRMALLMANAGER函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETHRMALLMANAGER函数，获取指定人员所有上级。

说明：  
获取指定人员所有上级。存在多个上级时，返回所有上级形成的数组。

语法：  
GETHRMALLMANAGER(String)

参数：

String为人员，填写人员ID，也可以是值为人员ID的人员类型变量，必填

示例：

GETHRMALLMANAGER({表单.张三})；返回张三的所有上级形成的数组