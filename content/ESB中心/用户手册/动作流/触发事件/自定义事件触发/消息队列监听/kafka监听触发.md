---
aliases: ["1966615727078276155"]
title: kafka监听触发
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

消息队列触发组件、连接器执行组件支持kafka连接器

**一.**新建连接信息：**在连接器页面建立kafka相关的连接器，配置对应的连接信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/dd0009211a708a01755c19eaebe1a3ee.jpg)

完善连接器配置的“连接地址”、“认证模式”、“用户名”、“密码”信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/89a904c16c9a7b30167956e14d54b3f8.jpg)

**二.**新增kafka消费方：**在已新建连接信息的连接器中创建kafka消费者

**![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7c1d0831dbe885c4c29740029bacaa47.jpg)**

配置基础信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/66acb22aff2e64eb91fd6093b86852a9.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f0e5a9b9b355ae0e2b6dad6c8b0337bc.jpg)

配置消息消息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e27647ef69a9cda562857cb47451274d.jpg)

**三.完善请求参数：**可选择动态赋值kafka组件进行参数配置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8093962694f90b2a6be6f8fc7c147e68.jpg)

**四.**动作流配置：**新建触发动作流，发送消息到kafka

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/05735896c0c9c9f3cd243448777a813c.jpg)

