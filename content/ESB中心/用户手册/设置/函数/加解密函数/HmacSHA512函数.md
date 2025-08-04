---
aliases: ["1964265900671514180"]
title: HmacSHA512函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的HmacSHA512函数，然后通过指定密钥对字符串进行HmacSHA512加密

说明：

通过指定密钥对字符串进行HmacSHA512加密

语法：

HmacSHA512(Text,SecretKey)

参数：

Text 文本 必需。需要进行HmacSHA512加密的文本

SecretKey 文本 必需。需要进行HmacSHA512加密的密钥

示例：

HmacSHA512(“111111”,“222222”) 返回1018e97f5e52f1f3456772e37416440a80ecedfc0c1275a9f513ee7b845300b3c8e7249bb9710a3a8be17eaf41f082c05220632a7eb9bd9908706a80a4a86c69