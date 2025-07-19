---
aliases: ["1970703709399607363"]
title: GETCRMCODE函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETCRMCODE函数，获取指定客户编号。

说明：  
获取指定客户编号。

语法：  
GETCRMCODE(String)

参数：

String为客户，填写客户ID，也可以是值为客户ID的关联客户类型变量，必填

示例：

假设关联客户=客户A，客户A编号为：2838383，GETCRMCODE({关联客户})；返回'2838383'