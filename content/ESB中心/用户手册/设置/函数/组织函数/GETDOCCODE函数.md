---
aliases: ["1970703689434607361"]
title: GETDOCCODE函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETDOCCODE函数，获取指定文档编号。

说明：  
获取指定文档编号。

语法：  
GETDOCCODE(String)

参数：

String为文档，填写文档ID，也可以是值为文档ID的关联文档类型变量，必填

示例：

假设关联文档=文档A，文档A编号为：234567，GETDOCCODE({关联文档})；返回'234567'