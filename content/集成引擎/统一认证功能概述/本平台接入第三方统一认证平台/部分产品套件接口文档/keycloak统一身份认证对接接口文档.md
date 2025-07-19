---
aliases: ["1969508639391143866"]
title: keycloak统一身份认证对接接口文档
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

认证中⼼是基于keycloak实现的IAM解决⽅案。分成测试和⽣产两个环境。

Keycloak是⼀个开源软件产品，旨在为现代的应⽤程序和服务，提供包含身份管理和访问管理（英语：Access Management）功能的单点登录⼯具。截⾄2018年3⽉，红帽公司负责管理这⼀JBoss社区项⽬，并将其作为他们RH-SSO产品的上游项⽬。[1]从概念的⻆度上来说，该⼯具的⽬的是，只⽤少量编码甚⾄不⽤编码，就能很容易地使应⽤程序和服务更安全。

-- 维基百科

**Keycloak的相关网站**

GitHub：<https://github.com/keycloak/keycloak>

官⽅⽂档：<https://www.keycloak.org/documentation>

OIDC 适配器： <https://github.com/keycloak/keycloak/tree/master/adapters/oidc>

**接口文档**

1、获取授权码接⼝

接⼝描述：

|  |  |  |  |
| --- | --- | --- | --- |
| **接口名** | **auth** |  |  |
| **URL Path** | https://account.sgmwit.com:6443/auth/realms/demo/protocol/openid-connect/auth |  |  |
| **请求类型** | GET |  |  |
| **请求示例** | https://account.sgmwit.com:6443/auth/realms/demo/protocol/openid-connect/auth?response\_type=code&scope=openid&redirect\_uri=认证成功之后的返回地址&state=&client\_id=test-front |  |  |
| **请求参数** | **参数名** | **中⽂说明** | **描述** |
| client\_id | 应⽤标识 | 客户端应⽤注册ID，从认证中⼼获取 |  |
| response\_type | 响应类型 | code，固定值 |  |
| redirect\_uri | 跳转地址 | 成功授权后的回调地址 |  |
| **返回值** | 认证成功之后的返回地址/?state=&session\_state=05e1093c-3dd7-40e2-b0ed-dce547145841&code=5e0c8bc0-5369-45f6-acf9-34a7b229bb8b.05e1093c-3dd7-40e2-b0ed-dce547145841.1d5fec53-a970-4820-8447-0ef3f333f821 |  |  |
| 描述 | 跳转回redirect\_uri并携带授权码 |  |  |

2、获取Access Token接⼝

接⼝描述：

|  |  |  |  |
| --- | --- | --- | --- |
| **接口名** | **Token** |  |  |
| **URL Path** | https://account.sgmwit.com:6443/auth/realms/demo/protocol/openi  d-connect/token |  |  |
| **请求类型** | POST |  |  |
| **请求参数示例** |  |  |  |
| **Headers:** |  |  |  |
| Content-Type | application/x-www-form-urlencoded |  |  |
| **Body参数** | **参数名** | **中文说明** | **描述** |
| client\_id | 应⽤标识 | 客户端应⽤注册ID，从认证中⼼获取 |  |
| client\_secret | 密钥 | 客户端应⽤注册密钥,从认证中⼼获取 |  |
| code | 临时授权码 | 调⽤认证接⼝（auth）获得 |  |
| grant\_type | 认证⽅式 | 请求类型，默认authorization\_code |  |
| redirect\_uri | 跳转地址 | 且必须与调⽤authorize中的该参数值保持⼀致 |  |
| **返回值示例** | {  "access\_token": "token信息",  "expires\_in": 3600,  "refresh\_expires\_in": 1800,  "refresh\_token": "refresh token信息",  "token\_type": "Bearer",  "id\_token": "id\_token",  "not-before-policy": 0,  "session\_state": "da82f323-ef8f-42f2-98a1-5ff2d13b6e40",  "scope": "openid profile email"  } | Json |  |
| **返回参数** | **参数名** | **中文说明** | **描述** |
| access\_token | 获取的access token值 | 访问token |  |
| refresh\_token | 获取的refresh\_token值 | 刷新access token |  |
| refresh\_expires\_in | refresh\_token有效时间（秒） | 授权服务器返回给应⽤的刷新票据的有效期。注意：有效期以秒为单位。 |  |
| expires\_in | refresh\_token有效时间（秒） | 授权服务器返回给应⽤的访问票据的有效期。注意：有效期以秒为单位。 |  |
| 描述 | 根据认证code获取access\_token |  |  |

3、获取⽤户信息接⼝

接⼝⽤途：

通过Token获取⽤户信息。

接⼝描述：

|  |  |  |  |
| --- | --- | --- | --- |
| **接⼝名** | **UserInfo** |  |  |
| **URL Path** | https://account.sgmwit.com:6443/auth/realms/demo/protocol/openid-connect/userinfo |  |  |
| **请求类型** | GET |  |  |
| **请求示例** |  |  |  |
| **Headers** | **参数名** | **中文说明** | **描述** |
| Authorization | Bearer {{access token}} | Headers，通过Bearer + AccessToken请求获取⽤户信息 |  |
| **返回值示例** | {  "sub": "9cdee841-f60b-4315-9e4c-19f384131090",  "email\_verified": false,  "name": "⼭伯",  "preferred\_username": "test001",  "given\_name": "⼭伯",  "family\_name": "梁",  "email": "test001@sgmw.com.cn"  } | Json |  |
| **返回参数** | **参数名** | **中文说明** | **描述** |
| preferred\_username | ⽤户名username | ⽤户名 |  |
| email | 邮箱email | 邮箱 |  |
| 描述 | 获取⽤户信息 |  |  |

4、登出

登出有以下⼏种⽅式：

1、通过访问登出端点实现登出

https://account.sgmwit.com:6443/auth/realms/demo/protocol/openid-connect/logout

2、通过JS SDK实现登出

Vue.prototype.$keycloak.logout()

3、通过Rest API 登出

|  |  |  |  |
| --- | --- | --- | --- |
| **接口名** | **Token** |  |  |
| **URL Path** | https://account.sgmwit.com:6443/auth/realms/demo/protocol/openid-connect/logout |  |  |
| **请求类型** | POST |  |  |
| **请求参数示例** |  |  |  |
| **Headers:** |  |  |  |
| Content-Type | application/x-www-form-urlencoded |  |  |
| **Body参数** | **参数名** | **中⽂说明** | **描述** |
| client\_id | 应⽤标识 | 客户端应⽤注册ID，从认证中⼼获取 |  |
| client\_secret | 密钥 | 客户端应⽤注册密钥,从认证中⼼获取 |  |
| refresh\_token | refresh\_token | 调⽤获取AccessToken接⼝（Token）获得 |  |
| **返回值示例** | 空 |  |  |
| **返回状态码** | 204 |  |  |
| 描述 | 通过Rest API 登出 |  |  |