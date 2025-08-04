---
aliases: ["1967099610102854063"]
title: SPNEGO认证(仅私有化单租户支持)
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

SPNEGO(SPNEGO: Simple and Protected GSS-API Negotiation)是微软提供的一种使用GSS-API认证机制的安全协议。SPNEGO认证是基于CAS认证和OAuth2认证的自动登录，必须先开启CAS认证或OAuth2认证：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c2e1f418c7dfc3a43c3238c38de90016.jpg)

功能入口：**私有化单租户环境**，点击进入后台管理中心【集成中心】--【统一认证中心】-【认证协议管理】-【SPNEGO认证】

1、开启SPNEGO认证后，由于直接和AD域交互认证，认证过程不走HTTP和HTTPS协议，APP的应用授权将不受控；

2、SPNEGO认证是一种自动登录机制，一旦登录是无法注销的；

3、SPNEGO认证没有登录界面，各个浏览器兼容性原因，认证时的效果会有所差异；

4、SPNEGO认证只支持Windows操作系统的终端使用。

配置说明：

|  |  |
| --- | --- |
| **配置项** | **说明** |
| 启用 | 决定是否启用SPNEGO认证。  若开启，业务系统调用CAS认证地址或OAuth授权地址，会进入SPNEGO的逻辑；  若禁用，业务系统调用CAS认证地址或OAuth授权地址保持原有的CAS或OAuth2逻辑。 |
| 域IP地址 | 域服务地址 |
| 域名 | 域名 |
| 域管理员账号 | 域服务的管理员账号 |
