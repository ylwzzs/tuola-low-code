---
aliases: ["1970676582707312628"]
title: SPLIT
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的ISNUMBER函数，将字符以指定字符为依据分割字符为一组字符。

说明：

字符分割函数，将字符以指定字符为依据分割字符为一组字符

语法：

SPLIT(String1, String2)

参数：

String1表示被分割的字符，String2表示分割符

示例：

SPLIT('ABC#DEF','#'); 返回[ABC,DEF]