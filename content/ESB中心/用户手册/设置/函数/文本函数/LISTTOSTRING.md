---
aliases: ["1970556311770202341"]
title: LISTTOSTRING
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择文本函数中的LISTTOSTRING函数，将数组转为字符串处理

说明：

数组转字符串

语法：

LISTTOSTRING(List, List, List...)

参数：

每个参数都为数组，可以添加多个数组

示例：

LISTTOSTRING(["a", "b", "c"], ["d", "e", "f"]);

返回'a','b','c','d','e','f'