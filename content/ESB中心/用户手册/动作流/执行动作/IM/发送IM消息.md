---
aliases: ["1965312263868033376"]
title: 发送IM消息
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

1、【发送IM消息】组件可以实现给系统人员发送IM消息，如可通过简单定时器触发组件，每天早上8点30发送IM消息给用户提醒签到。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/658fda661c539d8e4d31771b7d6edfa3.jpg)

2、在动作流设计器中，选择简单定时器触发组件以及发送IM消息的执行动作组件进行配置，配置如下：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a82bd2eef132f9984813d24f85716228.jpg)

3、动作流配置完成后，当触发事件执行时，会给对应的用户发送IM消息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6fa803ebb2b73847c1ff31e4fd105ccb.jpg)

4、发送IM消息组件介绍：

发送人：指发送该IM消息的人员；当前人员是指添加该组件的用户为当前人员。

接收人：IM消息接收人员

消息类型：支持发送文本类型与卡片类型的消息

**文本消息字段**

消息内容：给群组发送的文本消息内容

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7f189375bf91bb61ef8569611ecae9ce.jpg)

**卡片消息字段**

事项来源：卡片的内容来自于标准应用还是自定义

所属模块：当卡片内容来自于标准应用时，需指定所属模块

数据ID：标准应用事项的数据ID，系统支持自动解析为链接

消息标题：卡片消息的标题

PC端链接：PC端打开消息卡片时跳转的地址，标准事项无需指定

移动端链接：移动端打开消息卡片时跳转的地址，标准事项无需指定

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/95834bbef4051ddd2a29cdf40208ad1a.jpg)

发送效果如下：

