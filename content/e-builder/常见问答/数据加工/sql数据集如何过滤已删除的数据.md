---
aliases: ["1970262750442157628"]
title: sql数据集如何过滤已删除的数据
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

数据库不参与业务删除，系统里删除的数据在数据库中依然可以查到，如何在查询数据时过滤掉已删除的数据

**解决方式：**

共享表在设置sql时，可以通过设置where条件过滤data\_status=0过滤，

物理表在查询时可以通过设置where条件is\_delete字段过滤，具体需要看各模块对应is\_delete的状态字段设定，有些以0和1区分，有些以true和false区分