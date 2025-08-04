---
aliases: ["1970703639629207360"]
title: GETREQUESTMARK函数
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETREQUESTMARK函数，获取指定流程编号。

说明：  
获取指定流程编号。

语法：  
GETREQUESTMARK(String)

参数：

String为流程，填写流程ID，也可以是值为流程ID的关联流程类型变量，必填

示例：

假设关联流程=流程数据A，编号为：2332323，GETREQUESTMARK({关联流程})；返回'2332323'