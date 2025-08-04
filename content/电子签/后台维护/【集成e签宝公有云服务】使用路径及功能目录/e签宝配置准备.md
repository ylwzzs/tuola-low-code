---
aliases: ["1971645060615703407"]
title: e签宝配置准备
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 电子签
---

如需在电子签中集成使用e签宝服务，需要先在e签宝中进行部分设置，并将一些参数配置到电子签中、进行服务绑定，这样才能在系统中使用电子签服务时、对应到指定的e签宝服务。

**在e签宝中新建应用，并完成配置**

1.登录e签宝开发者控制台

<https://open.esign.cn/sandbox>

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1fdfc1562cf753a2fc9c78271098c230.jpg)

2.进入沙箱服务

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9249b06997c92c58b3511cb2c6b261ea.jpg)

3.新建第三方平台应用

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9d13867204680766be9057739e9e7f11.jpg)

4.获取应用id和应用secret

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/57d3c974161c25a835de59fee422b9e7.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4e06523559dc24867a8f466e206b5467.jpg)

注：应用id和应用secret将用于在电子签中、绑定e签宝服务时粘贴填写。

5.配置OA地址

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/05481c7c3da02ffb1b9f9b535868f444.jpg)

需将“OA地址”进行替换

6.设置订阅事件

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/602826b83e427400b9a6f1982f30dfdc.jpg)

勾选V3版签署服务的所有选项

