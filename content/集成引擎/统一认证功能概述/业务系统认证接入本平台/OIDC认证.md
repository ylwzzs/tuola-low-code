---
aliases: ["1968782875282748587"]
title: OIDC认证
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

OIDC 的全称是 OpenID Connect，是一套基于 OAuth 2.0 的认证 授权协议。OIDC认证主要提供OIDC协议的认证服务，允许业务系统通过OIDC授权模式接入E10。

功能入口：登录E10系统，点击进入后台管理中心【集成中心】--【统一认证中心】-【认证协议管理】-【OIDC认证】

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fbf8e463d0c78f991f39626e9fb64f8a.jpg)

配置说明：

|  |  |
| --- | --- |
| **配置项** | **说明** |
| 启用 | 决定OIDC是否启用。  若开启，业务系统可通过OIDC认证进行接入；  若禁用，业务系统将不能通过OIDC认证进行接入。 |
| 请求用户授权接口地址 | 只读显示“当前系统访问地址+/papi/sso/oidc/authorize”，业务系统请求用户授权接口，E10认证登录后，会回调业务系统，并携带code参数。 |
| 获取授权Token接口地址 | 只读显示“当前系统访问地址+/papi/sso/oidc/accessToken”，业务系统通过code请求授权Token接口可换取到access\_token以及id\_token |
| 获取用户信息接口地址 | 只读显示“当前系统访问地址+/papi/sso/oidc/profile”，业务系统通过access\_token请问用户信息接口可获取到人员信息 |
