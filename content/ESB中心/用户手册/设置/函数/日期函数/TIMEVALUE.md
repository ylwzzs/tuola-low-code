---
aliases: ["1970686829120806878"]
title: TIMEVALUE
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

﻿后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择日期函数中的TIMEVALUE函数，将时间文本字符串转换为时间序列值

说明：  
TIMEVALUE 函数将时间文本字符串转换为时间序列值。

语法：  
TIMEVALUE(time)

参数：

time为时间字符串，必填

示例：

TIMEVALUE('08:00')；返回0.333333333