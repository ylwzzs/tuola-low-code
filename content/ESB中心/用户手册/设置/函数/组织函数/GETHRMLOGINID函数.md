---
aliases: ["1970703295227107336"]
title: GETHRMLOGINID函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETHRMLOGINID函数，获取指定人员系统账号。

说明：  
获取指定人员系统账号。

语法：  
GETHRMLOGINID(String)

参数：

String为人员，填写人员ID，也可以是值为人员ID的人员类型变量，必填

示例：

GETHRMLOGINID({表单.张三})；返回'zhangsan@qq.com'