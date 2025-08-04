---
aliases: ["1970686229190906839"]
title: TIMESTAMPTODATE
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择日期函数中的TIMESTAMPTODATE函数，将时间戳按指定格式转换成日期。

说明：  
将时间戳按指定格式转换成日期。

语法：  
TIMESTAMPTODATE(timestamp,format)  

参数：

timestamp 必需 时间戳

format 可选 日期格式 默认yyyy-MM-dd HH:mm:ss

示例：

TIMESTAMPTODATE('1671172579', 'yyyy-MM-dd HH:mm:ss')；返回2022-12-16 14:36:19