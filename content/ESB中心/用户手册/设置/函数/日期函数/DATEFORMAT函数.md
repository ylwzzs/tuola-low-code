---
aliases: ["1964267360220814197"]
title: DATEFORMAT函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择日期函数中的DATE\_FORMAT函数，然后对输入数据返回指定格式的日期/时间数据

说明：  
返回指定格式的日期/时间数据  

语法：  
dateFormat(datetime,format)  

参数：

datetime 必需 日期

format 必需 格式化格式

示例：

dateFormat("2022-01-21","yyyy:MM") 返回 2022:01

dateFormat("2022/01/21","2022-01-21,yyyy:MM:dd HH") 返回 2022:01:21 00