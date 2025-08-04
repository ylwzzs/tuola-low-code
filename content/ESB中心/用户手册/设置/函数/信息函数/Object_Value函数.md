---
aliases: ["1964301283926114227"]
title: Object_Value函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的Object\_Value函数函数，返回对象集合的第num个元素值

说明：

返回对象集合的第num个元素值。

语法：

Object\_Value(JSON,index)

参数：

第一个参数JSON对象,JSON的第几个值

示例：

Object\_Value({"a":123,"b":456,"c":789},2); 返回789