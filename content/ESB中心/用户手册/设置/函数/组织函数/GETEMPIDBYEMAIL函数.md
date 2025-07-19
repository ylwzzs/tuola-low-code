---
aliases: ["1970704049873407367"]
title: GETEMPIDBYEMAIL函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETEMPIDBYEMAIL函数，通过人员邮箱获取人员ID。

说明：  
人员邮箱获取人员ID

语法：  
GETEMPIDBYEMAIL(String)

参数：

String为人员邮箱，必填

示例：

GETEMPIDBYEMAIL('zhangsan@xx.com')；返回'1560052731319352218'