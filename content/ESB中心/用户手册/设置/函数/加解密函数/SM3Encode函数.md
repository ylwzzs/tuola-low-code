---
aliases: ["1975254935255647108"]
title: SM3Encode函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的SM3Encode函数，然后对输入的字符串进行SM3Encode加密

说明：

对字符串进行SM3Encode

字符集：UTF-8

语法：

SM3Encode(context,outputFormat)

参数：

context 必需 加密文本

outputFormat 必需 输出方式（Base64、Hex）

示例：context：apple

originalformat : Hex

加密后内容：8f185300d28f4a6cbe212cfc2370d7f2a5c994e837ce67e3a6d1b63217fab5ed