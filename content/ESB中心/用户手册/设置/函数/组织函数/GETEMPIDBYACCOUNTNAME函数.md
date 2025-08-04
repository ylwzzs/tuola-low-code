---
aliases: ["1970704069386207369"]
title: GETEMPIDBYACCOUNTNAME函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETEMPIDBYACCOUNTNAME函数，通过登录名获取人员ID。

说明：  
登录名获取人员ID。

语法：  
GETEMPIDBYACCOUNTNAME(String)

参数：

String为登录名，必填

示例：

GETEMPIDBYACCOUNTNAME('zhangsan@xx.com')；返回'1560052731319352218'