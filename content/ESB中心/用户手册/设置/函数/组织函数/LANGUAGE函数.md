---
aliases: ["1970704018289307364"]
title: LANGUAGE函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的LANGUAGE函数，获取当前语言。

说明：  
获取指定人员的当前语言。

语法：  
LANGUAGE(String)

参数：

String为人员，填写人员ID，也可以是值为人员ID的人员类型变量，必填

示例：

LANGUAGE({U:张三})；返回简体中文