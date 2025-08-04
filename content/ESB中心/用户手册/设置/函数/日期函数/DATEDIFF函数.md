---
aliases: ["1964267392491814201"]
title: DATEDIFF函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择日期函数中的DATEDIFF函数，返回两个日期之间的时间

说明：  
返回两个日期之间的时间  

语法：  
dateDiff(startdate,enddate,datepart)  

参数：

startdate 必需 起始时间

enddate 必需 终止时间

datepart 必需 日期类型

示例：

dateDiff(2021-01-13 18:58:00:000,2020-06-13 18:58:00:000,yyyy). 返回值 -0.59

dateDiff(2020-06-06 10:02:02,2022-01-29 12:08:12,HH)。返回值 14450.10

dateDiff(2020-06-06 10:02:02,2022-01-29 12:08:12,HH) 返回值 867006.60