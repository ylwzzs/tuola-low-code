---
aliases: ["1964301270258814226"]
title: Object_Key函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加解密函数中的Object\_Key函数，返回对象集合的第num个元素名称

说明：

返回对象集合的第num个元素名称。

语法：

Object\_Key(JSON,index)

参数：

第一个参数index,Map类型的数组 List

示例：

Object\_Key({"a":123,"b":456,"c":789},2); 返回c