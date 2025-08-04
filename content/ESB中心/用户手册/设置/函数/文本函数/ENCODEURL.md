---
aliases: ["1970677831264712707"]
title: ENCODEURL
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的ENCODEURL函数，将文本字符串中的特殊字符编码为 URL 编码格式。

说明：

ENCODEURL 函数用于将文本字符串中的特殊字符编码为 URL 编码格式。

语法：

ENCODEURL(String)

参数：

参数必填

示例：

ENCODEURL('A B C')； 返回'A%20B%20C'