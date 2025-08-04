---
aliases: ["1970234789000457446"]
title: SAML认证
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

安全断言标记语言（Security Assertion Markup Language，简称SAML），是一个基于XML的开源标准数据格式认证协议。SAML认证主要提供SAML协议的认证服务，允许业务系统通过SAML接入E10。

功能入口：登录E10系统，点击进入后台管理中心【集成中心】--【统一认证中心】-【认证协议管理】-【SAML2】

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/68219745172c4f002c0e1a2e311f040c.jpg)

配置说明：

|  |  |
| --- | --- |
| **配置项** | **说明** |
| **开关** | 决定SAML2是否启用。  若开启，业务系统可通过SAML2认证进行接入；  若禁用，业务系统将不能通过SAML2认证进行接入。 |
| **IDP元数据** | 只读显示“当前系统访问地址+/papi/sso/saml2/idp/metadata”，可直接访问获取IDP元数据文件，目前需要手动保存下 |
| **SSO地址** | 只读显示“当前系统访问地址+/papi/sso/saml2/idp/authorize”，业务系统可通过此接口向E10系统发起SAML2登录请求，用户输入用户名密码认证成功后，E10系统将重定向到第三方应用系统，并且带上SAMLResponse报文、RelayState |
