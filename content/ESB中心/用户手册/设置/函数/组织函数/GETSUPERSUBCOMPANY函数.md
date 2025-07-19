---
aliases: ["1970703610609507356"]
title: GETSUPERSUBCOMPANY函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETSUPERSUBCOMPANY函数，获取指定分部直接上级分部。

说明：  
获取指定分部直接上级分部。返回值为对应部门直接上级分部的ID。

语法：  
GETSUPERSUBCOMPANY(String)

参数：

String为分部，填写分部ID，也可以是值为分部ID的分部类型变量，必填

示例：

GETSUPERSUBCOMPANY({表单.A分部})；返回'1559563038252396705'