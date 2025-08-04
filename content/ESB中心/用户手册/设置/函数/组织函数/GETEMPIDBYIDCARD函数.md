---
aliases: ["1970704063890607368"]
title: GETEMPIDBYIDCARD函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETEMPIDBYIDCARD函数，通过人员身份证获取人员ID。

说明：  
人员身份证获取人员ID

语法：  
GETEMPIDBYIDCARD(String)

参数：

String为人员身份证号，必填

示例：

GETEMPIDBYIDCARD('43070319980706334X')；返回'1560052731319352218'