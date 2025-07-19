---
aliases: ["1970703173426407327"]
title: SWITCH函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择逻辑函数中的SWITCH函数，判断变量对应的条件执行的结果并返回对应结果

说明：  
条件选择。

语法：  
SWITCH(变量, rule1, result1, rule2, result2...result)

参数：

变量 必填

rule与result每一组均表示变量值以及对应的返回结果，至少必填一组

result为默认返回结果，当所有条件均不满足时返回，必填

示例：

SWITCH({字段1},1,'A',2,'B','C')；

返回：

假设字段1为2，结果：'B'