---
aliases: ["1970686676322106871"]
title: COMPAREWORKDATE
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择日期函数中的COMPAREWORKDATE函数，返回指定成员所选时间段内包含的工作日天数

说明：  
返回指定成员所选时间段内包含的工作日天数

语法：  
COMPAREWORKDATE(date1, date2, String, type, format)

参数：

date1 开始时间 必填

date2 结束时间 必填

String 人员 必填

type 工作日计算类型 非必填 考勤制度A、法定S，默认A

format 单位 非必填 日D、时H、分I，默认D

示例：

想知道李四在2021-11-07和2021-11-12之间的工作日天数

COMPAREWORKDATE('2021-11-07', '2021-11-12',{U:李四}, 'A','D')

返回：

5