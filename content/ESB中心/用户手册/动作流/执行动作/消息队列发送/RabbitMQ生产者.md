---
aliases: ["1966451588664517359"]
title: RabbitMQ生产者
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

一、**新建连接信息**：在连接器页面建立rabbitmq相关的连接器，配置对应的连接信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/297d5a1fe537140245563b48d1ee154f.jpg)

**连接信息参数：**

IP地址：RabbitMQ的服务器地址

端口号：RabbitMQ监听端口号，默认为5672

用户名：RabbitMQ的用户名

密码：RabbitMQ用户对应的密码

虚拟主机：用户可以访问的虚拟主机

超时时间：连接RabbitMQ的超时时间，默认60s

是否使用TLS安全传输：开启后可以上传密钥文件和证书文件；需要输入密钥、证书密码

消息编码格式：发送或监听的RabbitMQ的消息编码方式，默认为UTF-8

二、**新建RabbitMQ生产方**：在已新建连接信息的连接器中创建RabbitMQ生产者

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/cda9d25ec5249591d39e6accc7b33b27.jpg)

**1、基础信息配置**

交换机类型：RabbitMQ中交换机的类型：基本模式、Direct、Topic、Fanout

交换机名称：填写发送消息到交换机的名称

路由标识：发送消息时携带的Routing Key，交换机类型是Direct或Topic时需要填写

是否持久化:

配置Exchange持久化 则在Exchange tab列表中会有对应的D标识,作用和队列持久化意思相同，表示交换机在重启后还会存在

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ba2cd7dcc2e064c87cdaa8a309b55dad.jpg)

是否自动删除：配置Exchange持久化 则在Exchange tab列表中会有对应的AD标识,表示断开连接会自动删除

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b9c3dbf439b4f3507b0021f4e360b193.jpg)

交换机类型：

基本消息模式—使用场景大多数是一个生产者多个消费者，生产者发送了消息，消费者随机分配其中一个接收消息，消息配置参数只有队列名称 根据队列名称去匹配对应的消费者

Direct模式—队列和交换机绑定时会设置一个Routing Key，发送消息时会把消息发送到Routing Key与交换机绑定的Routing Key相同的队列中

Topic模式—交换机会根据通配符对Routing Key进行匹配，只要满足某个通配符的条件，就会把消息发送到对应的队列上

Fanout模式—不处理Routing Key，把消息发送到所有与它绑定的队列上

通配符的匹配规则如下：

● Routing key必须是一串字符串，每个单词用“.”分隔；

● 符号“#”表示匹配一个或多个单词；

● 符号“\*”表示匹配一个单词。

例如：“\*.123” 能够匹配到 “abc.123”，但匹配不到 “abc.def.123”；“#.123” 既能够匹配到 “abc.123”，也能匹配到 “abc.def.123”

**2、消息配置**

发送参数：根据需要的参数格式配置发送消息的参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3411b0112adcb68ae0222931cbf97c2f.jpg)

消息参数：具体参数见附件的消息参数说明

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9f11522c27dee4d53794f90bead9bffc.jpg)

**三、动作流配置：**新建触发动作流，发送消息到MQ，如新建e-builder，将e-builder表单数据发送到MQ中

1、添加按钮触发和发送接口

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2db0dc3fefaf5cdf6a2ace8f1232da08.jpg)

2、配置发送mq消息组件的参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9228dc26b0d33737e043e1c924799323.jpg)

3、保存后新建e-builder触发此动作流，发送消息到MQ，日志中可以看到发送组件的执行结果和消息内容

