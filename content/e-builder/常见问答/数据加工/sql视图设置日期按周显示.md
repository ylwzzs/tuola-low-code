---
aliases: ["1970173995171657079"]
title: sql视图设置日期按周显示
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

通过sql视图如何设置日期字段按照自然周显示

**解决方式：**

第一步：设置函数语法

CEILING(

(

DAY(字段名称) + WEEKDAY(字段名称 - INTERVAL DAY(字段名称) -1 DAY)

) / 7

) as 周

第二步；运行查看结果

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d57f1e7d72f181c104b7e10de3b2f648.jpg)