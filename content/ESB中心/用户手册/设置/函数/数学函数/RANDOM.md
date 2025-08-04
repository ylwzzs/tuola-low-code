---
aliases: ["1970685335655906220"]
title: RANDOM
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择数学函数中的RANDOM函数，生成随机数

说明：  
随机数生成

语法：  
RANDOM(Number, String)  

参数：

Number表示随机数长度，必填；String表示随机数类型，必填，可选项有NUM（数字）、CHAR（字符）、FIX（字符与数字混合）

示例：

RANDOM(5,'NUM')；返回26489