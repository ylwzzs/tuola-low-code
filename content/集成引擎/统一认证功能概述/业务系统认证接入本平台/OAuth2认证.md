---
aliases: ["1965966308390579883"]
title: OAuth2认证
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

OAuth2.0是行业标准的授权协议。OAuth2认证主要提供OAuth2协议的认证服务，允许业务系统通过OAuth授权模式接入E10。

功能入口：登录E10系统，点击进入后台管理中心【集成中心】--【统一认证中心】-【认证协议管理】-【OAuth2认证】

![](4330e9d5d0dd2195e26a4145dd303d1d.jpg)

配置说明：

|  |  |
| --- | --- |
| **配置项** | **说明** |
| 启用 | 决定OAuth2应用是否启用。  若开启，业务系统可通过OAuth2进行接入；  若禁用，业务系统将不能通过OAuth2进行接入。 |
| 请求用户授权接口地址 | 只读显示“当前系统访问地址+/papi/sso/oauth2.0/authorize”，业务系统请求用户授权接口，E10认证登录后，会回调业务系统，并携带code参数。 |
| 获取授权Token接口地址 | 只读显示“当前系统访问地址+/papi/sso/oauth2.0/accessToken”，业务系统通过code请求授权Token接口可换取到access\_token |
| 获取用户信息接口地址 | 只读显示“当前系统访问地址+/papi/sso/oauth2.0/profile”，业务系统通过access\_token请问用户信息接口可获取到人员信息 |
| 统一退出接口地址 | 只读显示“当前系统访问地址+/sp/integration/oauth2.0/logout”，业务系统请求退出接口可注销E10认证登录会话 |