---
aliases: ["1964265894934214179"]
title: HmacSHA256函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的HmacSHA256函数，然后通过指定密钥对字符串进行HmacSHA256加密

说明：

通过指定密钥对字符串进行HmacSHA256加密

语法：

HmacSHA256(Text,SecretKey)

参数：

Text 文本 必需。需要进行HmacSHA256加密的文本

SecretKey 文本 必需。需要进行HmacSHA256加密的密钥

示例：

HmacSHA256(“111111”,“222222”) 返回 eb5dec832cc3e89019efd5bdc8e4c7cbf7a4458f5746cad59a66009ab835e1fa