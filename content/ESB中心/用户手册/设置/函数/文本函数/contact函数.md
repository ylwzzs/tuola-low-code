---
aliases: ["1964817136257279212"]
title: contact函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的contact函数，对多个字符串进行拼接。

说明：

对字符串进行拼接

语法：

contact(String,String,String...)

参数：

String文本字段非必填

示例：

contact(“a”，“-”，“b”); 返回a-b