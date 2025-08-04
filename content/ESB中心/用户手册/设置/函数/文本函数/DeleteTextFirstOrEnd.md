---
aliases: ["1973132208745242522"]
title: DeleteTextFirstOrEnd
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择文本函数中的DeleteTextFirstOrEnd函数

去除字符串首或者尾部指定字符,直到遇到不相同的字符。

说明：

去除字符串首或者尾部指定字符,直到遇到不相同的字符。

语法：

DeleteTextFirstOrEnd(context,removeText,contextPart)

参数：

context 必需 待处理文本

removeText 必需 指定替换的字符

contextPart 必需 去除的字符串位置

示例：

DeleteTextFirstOrEnd(aaabbbccc,a,首) 返回值bbbccc

DeleteTextFirstOrEnd(aaabbbccc,c,尾) 返回值aaabbb