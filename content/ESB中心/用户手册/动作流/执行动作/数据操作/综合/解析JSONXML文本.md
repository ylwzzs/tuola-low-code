---
aliases: ["1974012524215694562"]
title: 解析JSON/XML文本
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

**一、使用背景**

1：有些第三方接口返回的json是一个序列化后的json字符串而非对象，此时在动作流中需要通过该组件将字符串转换成json或者jsonarray对象供后续组件获取其中任意json节点的实际数据

2：有些第三方接口返回的xml是一个序列化后的xml字符串而非对象，此时在动作流中需要通过该组件将字符串转换为xml对象后供后续组件获取其中任意xml节点的实际数据

**二、组件介绍**

1：将json/xml字符串映射到被解析数据字段上作为数据来源

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f5943c3a7c6b7c57b52340371a92052d.jpg)

2：在数据解析结果中设置json/xml的实际结构，点击设置按钮

