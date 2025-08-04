---
aliases: ["1975264902358648119"]
title: SM2Decode函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的SM2Decode函数，然后对输入的字符串进行SM2Decode加密

说明：

对字符串进行SM2Decode加密

私钥类型：Hex、Base64

密文的拼接顺序：C1C3C2 或者 C1C2C3

输出方式：公钥类型伟Hex输出就是Hex 、公钥方式是Base64的输出就是Base64

语法： SM2Encode(context ,publicKey ,secretKeyType ,ciphertextSort )

参数：

context 必需 加密文本

privateKey 必需 私钥

secretKeyType 必需 私钥类型

ciphertextSort 必需 密文的拼接顺序

示例：

context ：BKnwtY+xUNk5JYY1ZM/eI4+MWz5WEsISoAr+8XGvCRmLP3lPiYIqMkC9byge35imU/nGaxZ0kJk158405/wfeB9WqUl9at7AlsdVSGKdp80G8mEOJAJpbiEt7Cy93ypQ0pzSd4RYCf9jTNo=

privateKey ：yUbHKGuqzjSQ9z+OTZdxnv6d/tXMYEtUs9Wr3xqPRBA=

secretKeyType ：Base64

ciphertextSort ：C1C3C2

SM2Decode(BKnwtY+xUNk5JYY1ZM/eI4+MWz5WEsISoAr+8XGvCRmLP3lPiYIqMkC9byge35imU/nGaxZ0kJk158405/wfeB9WqUl9at7AlsdVSGKdp80G8mEOJAJpbiEt7Cy93ypQ0pzSd4RYCf9jTNo=,yUbHKGuqzjSQ9z+OTZdxnv6d/tXMYEtUs9Wr3xqPRBA=,Base64,C1C3C2)

解密后内容：2024-01-17