---
aliases: ["1970676649755812634"]
title: NVL
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的NVL函数，在所有参数中返回第一个不是null的值。

说明：

在所有参数中返回第一个不是null的值

语法：

NVL(String, String, String...)

参数：

至少必填一个参数

示例：

NVL('abc','',''); 返回abc