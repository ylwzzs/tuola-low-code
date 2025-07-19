---
aliases: ["1970685672669606612"]
title: CURRENTTIMEMILLIS
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择日期函数中的CURRENTTIMEMILLIS函数，获取当前时间戳

说明：  
获取当前时间戳，支持

语法：  
CURRENTTIMEMILLIS(type)  

参数：

type表示返回的时间戳类型，可选项为Seconds和millis，Seconds表示秒，millis表示毫秒

示例：

CURRENTTIMEMILLIS(Seconds)，返回值1706856506

CURRENTTIMEMILLIS(millis)，返回值1706856506000