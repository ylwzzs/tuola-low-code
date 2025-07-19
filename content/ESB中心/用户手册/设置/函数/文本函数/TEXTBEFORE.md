---
aliases: ["1970676613718512631"]
title: TEXTBEFORE
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的TEXTBEFORE函数，截取N个分割符之前的字符。

说明：

截取N个分割符之前的字符

语法：

TEXTBEFORE(String1, String2, Number)

参数：

String1表示目标文本，必填；String2表示分隔符，必填；Number表示索引下标，即N，必填

示例：

TEXTBEFORE('abc-12','-',1); 返回abc