---
aliases: ["1968915940015641023"]
title: eb流程产生的数据如何删除
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

为什么表单关联了流程之后，产生的流程数据无法删除？点击批量删除没有对应的流程数据。

**解决方式：**

1.对于已归档的流程，我们需要在后台管理-表单-权限-流程归档权限中添加相应的权限，之后就可以在前台批量删除已归档的流程。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ef1611f08f76148d4ffd29bdf812053b.jpg)

2.对于未归档的流程，我们需要添加流程监控，之后可以在中删除流程数据

首先在后台添加流程监控：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/897b66bb677dd44e77a1b564bc05ef44.jpg)

之后在前台新建菜单，关联流程监控，即可看到未归档的流程，并进行删除

