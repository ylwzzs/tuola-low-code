---
aliases: ["1970486710787556458"]
title: WebSEAL集成配置示例（仅私有化环境支持）
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

本文档为WebSEAL集成配置示例

**获取参数方法：请求头**

根据WebSEAL服务器请求头中参数进行相关配置：（由于我们没有WebSEAL服务，所以模拟请求头进行测试）

![](3f5bb1a5b58509053bf6ec22016da613.jpg)

请求头模拟参数：

![](a07e8d00462d78033468be506681a700.jpg)

参数值 15511110001 根据转换规则（手机号码）转换后对应系统人员为 zora ：

![](33a37c072863f1f072a2a3ac6b874da4.jpg)

**①单点登录方式：访问个性化地址进行单点登录**

个性化地址页面：

![](ede3cddacd4c76484cf394363282804f.jpg)

复制个性化地址，进行单点登录：

![](d363408ef7fa52e59fa327fa8f439449.jpg)

![](2e445e6324b65beccb8384b90e923aa9.jpg)

单点登录成功，认证成功的人员信息正确。

**②单点登录方式：直接访问回调地址进行单点登录**

在统一认证接入管理页面，复制回调地址，直接访问进行单点登录：

![](761973767fd348e3780eda7d16225f9f.jpg)

![](5a668697f57bfb16f754782043b1cd9a.jpg)

单点登录成功，认证成功的人员信息正确。

**获取参数方法：请求参数**

根据WebSEAL服务器参数进行相关配置：

![](93c157f847d5564676292464b4aebc03.jpg)

人员信息：

![](bb8803cb2d3e20541f0a6aff036fa7dc.jpg)

参数 iv-user=15522220003 根据转换规则（手机号码）对应的人员信息为 二代Two 。

**单点登录方式：访问回调地址拼接参数的方式**

由于个性化地址不支持传参，所以当获取参数方法为请求参数时，使用 回调地址拼接参数的方式 进行单点登录。

单点登录地址格式：回调地址&参数名称=参数值

示例：

https://weapp.yunteams.cn/papi/iaauthclient/webseal/login?tk=0be93a0b92f1b172b82eea797675618a&iv-user=15522220003

浏览器访问单点登录地址进行认证：

![](f4fbf4018b2b9629b2a74b299fb3f804.jpg)

单点登录成功，认证成功的人员信息正确。

**跳转到指定页面（gopage）**

在回调地址上拼接gopage参数及需要跳转的指定页面。

注：gopage后的地址最好使用encode编码处理一下。

**①请求头方式**

单点登录地址格式：回调地址&gopage=指定的页面

示例：

https://weapp.mulinquan.cn/papi/iaauthclient/webseal/login?tk=1c23721d71f375141699f250f4ba0cd1&gopage=https://weapp.mulinquan.cn/info/authclient

访问gopage地址进行单点登录：

![](5bc375399358c178b2fca67921603982.jpg)

![](8e39e7a0ccf6972f1260f18f2e007c1c.jpg)

单点登录成功并跳转到指定页面了。

**② 请求参数方式**

单点登录地址格式：回调地址&请求参数=请求参数值&gopage=指定的页面

示例：

https://weapp.mulinquan.cn/papi/iaauthclient/webseal/login?tk=1c23721d71f375141699f250f4ba0cd1&iv-user=15511110001&gopage=https%3A%2F%2Fweapp.mulinquan.cn%2Finfo%2Fauthclient

访问gopage地址进行单点登录：

![](c3d24b9be16a0ceb627ee4c6c1320a9d.jpg)

单点登录成功并跳转到指定页面了。