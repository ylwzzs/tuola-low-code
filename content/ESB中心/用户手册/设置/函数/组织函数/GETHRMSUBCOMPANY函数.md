---
aliases: ["1970703552235207349"]
title: GETHRMSUBCOMPANY函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETHRMSUBCOMPANY函数，取指定人员分部。

说明：  
取指定人员分部，返回值为分部ID。

语法：  
GETHRMSUBCOMPANY(String)

参数：

String为人员，填写人员ID，也可以是值为人员ID的人员类型变量，必填

示例：

GETHRMSUBCOMPANY({表单.张三})；返回'1560052731319352218'