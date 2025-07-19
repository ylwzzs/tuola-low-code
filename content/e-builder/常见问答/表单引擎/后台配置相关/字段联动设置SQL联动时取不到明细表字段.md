---
aliases: ["1969691023645750674"]
title: 字段联动设置SQL联动时取不到明细表字段
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

表单中进行字段联动配置，在选择SQL联动时，只能找到主表字段，取不到明细表字段？![](f125a16b4f3f2db0ffd849d238c2680e.jpg)

**解决方式：**

需要先在触发动作值改变时选择明细表字段，之后才能在sql中取到明细表：

![](fadaa5b81c94c718e1f2bb8f0d269829.jpg)