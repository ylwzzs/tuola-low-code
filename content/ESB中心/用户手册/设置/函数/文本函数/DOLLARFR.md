---
aliases: ["1970677918286012719"]
title: DOLLARFR
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的DOLLARFR函数，将小数，转换成分数表示的金额数字。

说明：

DOLLARFR函数可以将小数，转换成分数表示的金额数字，如证券价格

语法：

DOLLARFR(Number1, Number2)

参数：

Number1为需要黄钻换的小数，必填；Number2用作分数中的分母的整数，必填

示例：

DOLLARFR(1.125,16)； 返回1.02