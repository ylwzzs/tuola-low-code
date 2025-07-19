---
aliases: ["1969442662961143750"]
title: eb应用构建发布到前台不显示
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

EB应用已经构建并发布到前台，但是前台搜不到。

**解决方式：**

可能有以下两点原因：

1.系统版本过低，若用户是私有部署，请注意查看weaver-cusapp、weaver-basic-web、base-server的版本，请获取最新版本并进行更新。

2.应用发布到前台需要注意所属机构，如果账号不在对应的组织架构下，也无法使用该应用：

![](b2cce930fe61e5503333ce2e10770560.jpg)