---
aliases: ["1970260388667857575"]
title: TXT文件格式如何配置ETL
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

TXT格式的文件如何配置etl作为数据源输入

**解决方式：**

**列分割符**

指定TXT文件中，每一列数据之间的分隔符。如上图所示的分割符是 ![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3d3b5073d81bbba3318a497ee9978b5a.jpg)

**字段设置**

设置每一列的字段名称。字段命名须符合命名规范，见附录->字段命名规范

**预览**

预览当前节点输出的数据。按照设置的4个字段，将文本中每一行数据拆分成4列：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/963c1b25822aa06a950340a25d996e65.jpg)

