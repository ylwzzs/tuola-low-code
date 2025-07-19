---
aliases: ["1970704024003807365"]
title: GETREQUESTSTATUS函数
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择组织函数中的GETREQUESTSTATUS函数，获取流程状态。

说明：  
获取流程状态。

语法：  
GETREQUESTSTATUS(String)

参数：

String为流程，填写流程ID，也可以是值为流程ID的关联流程类型变量，必填

示例：

假设关联流程所选中的数据正在审批中；GETREQUESTSTATUS({表单.关联流程}) ；返回'审批中'