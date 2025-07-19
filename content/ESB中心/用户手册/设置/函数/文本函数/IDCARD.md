---
aliases: ["1970675637080112350"]
title: IDCARD
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的IDCARD函数，从身份证号码中获取相关信息。

说明：

从身份证号码中获取相关信息，比如：生日（BD）、年龄（AGE）、籍贯（NA）、性别（GENDER）。

语法：

IDCARD(String1, String2)

参数：

String1表示身份证号码，必填；String2表示查找的信息类型，必填，可选项有'BD', 'AGE', 'NA', 'GENDER'

示例：

IDCARD( ‘43070319980706334X’ , ‘BD’ ); 返回'1998-07-06'