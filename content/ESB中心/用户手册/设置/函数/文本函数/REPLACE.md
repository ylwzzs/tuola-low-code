---
aliases: ["1970670189922212273"]
title: REPLACE
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的REPLACE函数，在原文本中，从替换位置开始，往后数指定的替换字符数，将这段文本替换为新文本。

说明：

在原文本中，从替换位置开始，往后数指定的替换字符数，将这段文本替换为新文本。

语法：

REPLACE(String1, Number1, Number2，String2)

参数：

全部参数必填，String1为被替换的原文本，Number1为替换开始位置，Number2为被替换的字符数，String2为替换的字符

示例：

REPLACE('大家好大家好', 2, 3, 'dajia'); 返回'大dajia家好'