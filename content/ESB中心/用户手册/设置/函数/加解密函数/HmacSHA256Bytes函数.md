---
aliases: ["1973076954322664559"]
title: HmacSHA256Bytes函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的HmacSHA256Bytes函数，

然后通过指定密钥对字符串进行HmacSHA256Bytes加密返回字节数组

说明：

通过指定密钥对字符串进行HmacSHA256Bytes加密返回字节数组

语法：

HmacSHA256Bytes(Text,SecretKey)

参数：

Text 文本 必需。需要进行HmacSHA256Bytes加密的文本

SecretKey 文本 必需。需要进行HmacSHA256Bytes加密的密钥

示例：

HmacSHA256Bytes(111111,222222)