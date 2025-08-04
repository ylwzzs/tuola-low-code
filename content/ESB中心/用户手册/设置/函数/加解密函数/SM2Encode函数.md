---
aliases: ["1975264862935648061"]
title: SM2Encode函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的SM2Encode函数，然后对输入的字符串进行SM2Encode加密

说明：

对字符串进行SM2Encode加密

字符集：UTF-8

公钥类型：Hex、Base64

密文的拼接顺序：C1C3C2 或者 C1C2C3

输出方式：公钥类型伟Hex输出就是Hex 、公钥方式是Base64的输出就是Base64

语法： SM2Encode(context ,publicKey ,secretKeyType ,ciphertextSort )

参数：

context 必需 文本

publicKey 必需 公钥

secretKeyType 必需 公钥类型

ciphertextSort 必需 密文的拼接顺序

示例：

context ：2024-01-17

publicKey ：BC2PUlwxBnb6V6/SDIOuN5qIca/+gpzEPJzkH7ixsaaf9ErUTHpWcHrGs5UXeTHYOxxShsAD65d29TnK16Hj4jY=

secretKeyType ：Base64

ciphertextSort ：C1C3C2

SM2Encode(2024-01-17,BC2PUlwxBnb6V6/SDIOuN5qIca/+gpzEPJzkH7ixsaaf9ErUTHpWcHrGs5UXeTHYOxxShsAD65d29TnK16Hj4jY=,Base64,C1C3C2)

加密后内容：BKnwtY+xUNk5JYY1ZM/eI4+MWz5WEsISoAr+8XGvCRmLP3lPiYIqMkC9byge35imU/nGaxZ0kJk158405/wfeB9WqUl9at7AlsdVSGKdp80G8mEOJAJpbiEt7Cy93ypQ0pzSd4RYCf9jTNo=

备注：加密每次生成的都不一样，按照上述的方式加密输出的可能和给出的加密内容不一样属于正常现象，按照私钥进行解密可以还原出原本加密信息