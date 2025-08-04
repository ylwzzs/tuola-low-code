---
aliases: ["1970704145386607378"]
title: GTLSDEP函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GTLSDEP函数，获取一级分部。

说明：  
获取分部所在的一级分部

语法：  
GTLSDEP(String)

参数：

String为分部，可以是分部ID，也可以是值为分部ID的分部类型字段，必填

示例：

GTLSDEP({分部C})；返回'分部A'