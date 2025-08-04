---
aliases: ["1970677845136512708"]
title: NUMBERSTRING
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的NUMBERSTRING函数，将数字转化为汉字表示的文本。

说明：

NUMBERSTRING 函数用于将数字转化为汉字表示的文本，支持不同的表示类型。表示类型可选参数如下： 1（汉字小写） 2（汉字大写） 3（汉字读写）

语法：

NUMBERSTRING(Number1, Number2)

参数：

Number1为需要转换的数字，必填；Number2为转换汉字的表示类型，必填，表示类型可选参数如下： 1（汉字小写） 2（汉字大写） 3（汉字读写）

示例：

NUMBERSTRING(123456,3)； 返回'一二三四五六'