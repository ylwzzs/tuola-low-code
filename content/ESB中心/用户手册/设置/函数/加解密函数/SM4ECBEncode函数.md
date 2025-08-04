---
aliases: ["1974977703902398510"]
title: SM4ECBEncode函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的SM4ECBEncode函数，然后对输入的字符串进行SM4ECBEncode加密

说明：

对字符串进行AES加密

字符集：UTF-8

加密模式：ECB

填充模式：PKCS#5、PKCS#7

输出方式：Hex、Base64

语法：

SM4ECBEncode(context,secretkey,fillStyle,outputFormat)

参数：

context必需 加密文本

SecretKey 必需 密钥

fillStyle 必需 填充方式

outputFormat 必须输出方式

示例：context：5i3oukzrqw7ys5lv

secretkey：CpRBzb6ojoTHQ2Bz

fillStyle： PKCS#7

outputFormat：Hex

加密后内容：d4b5aba6512b77965477184c138599800856941b032075be1e7f55d7cf03475e