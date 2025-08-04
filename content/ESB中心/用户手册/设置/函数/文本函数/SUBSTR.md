---
aliases: ["1970676750324712647"]
title: SUBSTR
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的SUBSTR函数，将指定字符串按指定位数进行截取。

说明：

将指定字符串按指定位数进行截取

语法：

SUBSTR(String, Number1, Number2)

参数：

String参数为被截取的字符串，必填；Number1表示截取的起始位置，必填；Number2表示截取的长度，即位数，必填

示例：

SUBSTR('abcdcf',1,3)； 返回'abc'