---
aliases: ["1970684433372606024"]
title: AGGREGATION
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择数学函数中的AGGREGATION函数，将一组数据进行统计计算。

说明：  
将一组数据进行统计计算，支持最大值（MAX）、最小值（MIN）、平均值（AVG）。

语法：  
AGGREGATION(Number1, Number2..., String)  

参数：

多个Number参数表示需要计算的数字，必填；String表示计算的类型，必填

示例：

AGGREGATION(1 , 2,3,'AVG')；返回2