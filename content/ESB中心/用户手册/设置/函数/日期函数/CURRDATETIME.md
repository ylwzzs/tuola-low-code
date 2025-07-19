---
aliases: ["1970686570102906869"]
title: CURRDATETIME
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择日期函数中的CURRDATETIME函数，获取当前日期时间。

说明：  
获取当前日期时间，日期格式有如下几种： ''''yyyy-MM-dd HH:mm:ss''''（年月日 时分秒） ''''yyyy-MM-dd HH:mm''''（年月日 时分） ''''yyyy-MM-dd HH''''（年月日 时） ''''yyyy-MM-dd''''（年月日） ''''yyyy-MM''''（年月） ''''yyyy''''（完整年份） ''''yy''''（简写年份） ''''MM-dd''''（月份日期） ''''dd''''（当月第几天） ''''HH:mm''''（时分） ''''HH''''（小时） ''''mm''''（分钟） ''''ss''''（秒）

语法：  
CURRDATETIME(format)  

参数：

format 可选 日期格式 默认yyyy-MM-dd HH:mm:ss

示例：

CURRDATETIME('YYYY-MM-DD HH:mm:SS')；返回2023-09-09 12:23:23