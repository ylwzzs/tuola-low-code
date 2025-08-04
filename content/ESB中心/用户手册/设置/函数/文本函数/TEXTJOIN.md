---
aliases: ["1970676722233112644"]
title: TEXTJOIN
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的TEXTJOIN函数，将分隔符文本化后插入到字符中。

说明：

分隔符文本化并插入到字符中，支持排除空值

语法：

TEXTJOIN(String1, Boolean, String2，String3...)

参数：

String1表示分隔符，必填；Boolean表示是否过滤空格，非必填，TRUE()为忽略空格，FALSE()为去除空格；String2及以后的字符表示被连接的字符

示例：

TEXTJOIN('-',TRUE(),'abc','cde'); 返回abc-cde