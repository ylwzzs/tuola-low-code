---
aliases: ["1968800317779748602"]
title: 虚拟表引用数仓sql每页显示一条数据
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

表单使用虚拟表引用数仓sql数据源，表单每页仅显示一条数据

![](https://www.e-cology.com.cn/api/file/preview?type=redirect&fileId=100500139030881682)![](749fed07ac08ee0e52ae80c61926e1a8.jpg)

![](a96d6f11b96286d9955463eb8b242c46.jpg)

**解决方式：**

主要通过以下三种方式进行排查

1、自查下有没有id列 必须要有id列

2、id不能重复

3、数据库列名不能用中文