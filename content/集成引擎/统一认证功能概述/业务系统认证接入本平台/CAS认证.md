---
aliases: ["1965966282148479882"]
title: CAS认证
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

CAS是Central Authentication Service的缩写，中央认证服务，一种独立开放指令协议。CAS认证主要提供基于CAS2.0协议的认证服务，允许业务系统通过CAS接入E10。

功能入口：登录E10系统，点击进入后台管理中心【集成中心】--【统一认证中心】-【认证协议管理】-【CAS认证】

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d56439c52527ad7f97666b5931ddb22d.jpg)

配置说明：

|  |  |
| --- | --- |
| **配置项** | **说明** |
| **启用** | 决定OAuth2应用是否启用。  若开启，业务系统可通过OAuth2进行接入；  若禁用，业务系统将不能通过OAuth2进行接入。 |
| **服务地址** | 只读显示“当前系统访问地址+/papi/sso/cas” |
| **登录地址** | 只读显示“当前系统访问地址+/papi/sso/cas/login”。业务系统请求登录地址，E10认证登录后，会回调业务系统，并携带ticket |
