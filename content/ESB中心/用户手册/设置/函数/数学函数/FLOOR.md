---
aliases: ["1970685497592506239"]
title: FLOOR
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择数学函数中的FLOOR函数，将参数 Number 沿绝对值减小的方向向下舍入，使其等于最接近Significance的倍数。

说明：  
将参数 Number 沿绝对值减小的方向向下舍入，使其等于最接近Significance的倍数

语法：  
FLOOR(Number1，Number2)  

参数：

Number1表示要舍入的数值，必填；Number2为Significance，表示要舍入到的倍数，必填。

示例：

FLOOR(23.445,1)；返回23