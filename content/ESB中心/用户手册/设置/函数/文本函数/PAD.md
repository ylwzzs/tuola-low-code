---
aliases: ["1970675550834012342"]
title: PAD
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的PAD函数，将原文本填充到指定长度。

说明：

将原文本填充到指定长度，如果文本长度大于设置的长度，则不做任何操作。填充位置可用参数：'LEFT'、'RIGHT'。

语法：

PAD(String1, Number, String2, String3)

参数：

String1表示原文本，必填；Number表示长度，必填；String2表示填充用的文本，必填；String3表示填充位置，非必填，可用参数为'LEFT'、'RIGHT'

示例：

PAD('你好', 4, '你', 'LEFT'); 返回'你你你好'