---
aliases: ["1964267044108814181"]
title: AESEncode函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的AESEncode函数，然后对输入的字符串进行AES加密

说明：

对字符串进行AES加密

字符集：UTF-8

加密模式：ECB

填充模式：PKCS5Padding

语法：

AESEncode (Text,SecretKey)

参数：

Text 必需 加密文本

SecretKey 必需 密钥 16位

示例：Text：我是AES加密

SecretKey：1111111111111111

加密后内容：rBuGfuwL//NKhiftWHwdLw==