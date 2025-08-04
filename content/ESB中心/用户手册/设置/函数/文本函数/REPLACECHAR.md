---
aliases: ["1970556641692202367"]
title: REPLACECHAR
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择文本函数中的REPLACECHAR函数，返回将指定字符替换为新字符后的字符串

说明：

替换指定字符为新的字符

语法：

REPLACECHAR(String, String, String)

参数：

三个参数分别为需要处理的字符串，需要替换的字符(串)，替换后的字符(串)

示例：

REPLACECHAR("abcbcdd", "bc", "mn"); 返回"amnmndd"