---
aliases: ["1970703699728207362"]
title: GETPRJCODE函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETPRJCODE函数，获取指定项目编号。

说明：  
获取指定项目编号。

语法：  
GETPRJCODE(String)

参数：

String为项目，填写项目ID，也可以是值为项目ID的关联项目类型变量，必填

示例：

假设关联项目=项目A，项目A编号为：2838383，GETPRJCODE({关联项目})；返回'2838383'