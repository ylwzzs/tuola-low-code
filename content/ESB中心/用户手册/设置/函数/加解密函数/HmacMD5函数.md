---
aliases: ["1964265885632614177"]
title: HmacMD5函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的HmacMD5函数，然后通过指定密钥对字符串进行HmacMD5加密

说明：

通过指定密钥对字符串进行HmacMD5加密

语法：

HmacMD5(Text,SecretKey)

参数：

Text 文本 必需。需要进行HmacMD5加密的文本

SecretKey 文本 必需。需要进行HmacMD5加密的密钥

示例：

HmacMD5(“111111”,“222222”) 返回 5c4155084d027ee9097358eb776c2e24