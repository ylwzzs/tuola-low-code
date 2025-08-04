---
aliases: ["1970703616455907357"]
title: GETALLSUPERSUBCOMPANY函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETALLSUPERSUBCOMPANY函数，获取指定分部所有上级分部。

说明：  
获取指定分部所有上级分部。存在多个上级分部时，返回所有上级分部形成的数组。

语法：  
GETALLSUPERSUBCOMPANY(String)

参数：

String为分部，填写分部ID，也可以是值为分部ID的分部类型变量，必填

示例：

GETALLSUPERSUBCOMPANY({表单.A分部})；返回A分部的所有上级分部形成的数组