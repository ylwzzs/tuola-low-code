---
aliases: ["1970485666960656433"]
title: 业务系统通过OIDC接入E10
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿• [[#文档简介|文档简介]]

﻿﻿﻿• [[#应用集成E10系统准备|应用集成E10系统准备]]

[[#应用集成E10系统准备|业务系统]]

[[#E10系统|E10系统]]

## •[[#认证集成过程|认证集成过程]]

[[#认证集成过程|OIDC认证过程]]

[[#认证集成|认证集成]]

[[#认证集成|获取client\_id和client\_secret参数]]

[[#开启OIDC认证|开启OIDC认证]]

[[#获取Authorization Code|获取Authorization Code]]

[[#获取Id\_Token、Access Token|获取Id\_Token、Access Token]]

[[#刷新Id\_Token、Access Token|刷新Id\_Token、Access Token]]

[[#获取用户信息|获取用户信息]]

[[#退出|退出]]

[[#获取密钥|获取密钥]]

[[#验证|验证]]

## •[[#附录1|附录1：提示页面信息]]

## •[[#附录2|附录2：接口错误代码]]

**文档简介**

本文档详细定义了E10系统所提供的OIDC认证服务接口的接口规范。当应用系统在与E10系统进行OIDC认证集成时，需要了解该文档的内容，并根据该文档定义的接口规范进行相应接口的开发或调整。

**应用集成E10系统准备**

一、业务系统

应用系统(需要接入oauth认证的应用)准备认证成功回调地址：

1、回调地址（接收code验证码的地址及认证成功跳转地址）

注：回调地址中不支持带有路由的地址。

|  |  |
| --- | --- |
| **属性名** | **说明** |
| redirect\_uri | http://XXX.XXX.XXX.XXX/XX/XX |

2、应用系统地址协议需与E10系统协议保持一致。

3、向E10系统申请注册应用系统并且提供回调地址给E10系统。

4、向E10系统申请将回调地址域名加入到白名单中。

二、E10系统

1、根据应用系统提供的回调地址，注册应用系统

环境配置：

|  |  |
| --- | --- |
| **属性名** | **说明** |
| client\_id | 注册应用标识，示例：a1dd20759a9046d2bfbc4f104558fe39 |
| client\_secret | 注册应用密钥，示例：4f6f5533-35ac-4c14-ad99-35bec3bf2a29 |
| 请求用户授权接口地址 | 请求登录认证地址，示例：  https://weapp.mulinquan.cn/papi/sso/oidc/authorize |
| 获取授权Token接口地址 | code交互token地址，示例：  https://weapp.mulinquan.cn/papi/sso/oidc/accessToken |
| 获取用户信息接口地址 | Token交互用户信息地址，示例：  https://weapp.mulinquan.cn/papi/sso/oidc/profile |
| 统一退出地址 | 注销E10系统认证地址，示例：  https://weapp.mulinquan.cn/sp/integration/oidc/logout |

2、注册完成，将信息反馈给应用系统。

**认证集成过程**

一、OIDC认证过程

整体上分为三个接口，获取授权码接口 、获取Token接口、获取用户信息接口；

1、获取授权码接口：可获取到授权码code

2、获取应用Token接口：用户通过授权码code，获得id\_token（jwt格式，包含用户信息）、access\_token；

3、获取用户信息接口：用户通过access\_token可获取用户基本信息。

认证流程图如下：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/99819f28e58acd2fca3c87f0d9814938.jpg)

二、认证集成

1、获取client\_id和client\_secret参数

统一认证中心-认证应用管理，注册应用系统的OIDC认证应用。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d02a2349756a5c5e110240539922a104.jpg)

其中，应用标识以及应用密钥则是对应的client\_id和client\_secret参数值。

共享范围：设置应用的人员限制范围，只允许范围内的人员通过应用登录业务系统。

业务系统URL地址：该地址是应用在用户登录完成后返回给应用授权码的地址。

账号映射规则：设置需要返回给应用人员的哪个字段信息（需在人员基本信息里面维护）。

2、开启OIDC认证

统一认证中心-认证协议管理直接开启认证，提供OIDC认证接口地址。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/115fd86eb86aa40071bf0aec87671b93.jpg)

3、获取Authorization Code

用户访问该应用系统时，应用通过下面接口向E10系统发起授权登录请求，用户输入用户名密码认证成功后，E10系统将重定向到第三方应用系统，并且带上授权码code参数。

请求说明：

|  |  |
| --- | --- |
| **参数** | **描述** |
| 请求地址 | OIDC认证中“请求用户授权接口地址”  E10系统地址/papi/sso/oidc/authorize |
| 请求方式 | GET |

请求参数：

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **参数** | **名称** | **必须** | **示例** | **描述** |
| scope | 授权范围 | 必须 | openid | 固定openid |
| response\_type | 授权类型 | 必须 | code | 响应类型，支持code |
| client\_id | 应用标识 | 必须 | 9c5a07c0e2ad40229cc73306b6996f6b | E10系统认证应用管理中该应用注册的应用标识 |
| redirect\_uri | 回调地址 | 必须 | https://cas.e-cology.cn | 成功授权后的回调地址。需与应用标识的应用中业务系统url地址一致。  注：不支持地址中有#路由地址。 |

请求示例：

|  |
| --- |
| E10系统地址/papi/sso/oauth2.0/authorize?client\_id=e9b7bee8b9d0434eb022fe2f8604addf&redirect\_uri=https://cas.e-cology.cn&response\_type=code |

返回参数说明：

|  |  |  |
| --- | --- | --- |
| **参数** | **名称** | **描述** |
| code | 授权码 | 用户登录并授权后，返回给应用的授权码。注意：此code是一次有效。 |

正确返回示例：

|  |
| --- |
| redirect\_uri?code=OC-2-2ffB72HRr8qblzFOXC3W660-ZWWPEEw4 |

错误返回示例：

会跳转提示页面。可能跳转的提示页面可参考[[#附录1|附录1：提示页面信息]]。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/29bd21bc4d2c45adcc4e1caa779a34ee.jpg)

4、获取Id\_Token、Access Token

通过用户验证登录授权后，获取授权令牌Access Token，Access Token是第三方应用在调用E10系统获取用户信息时必须传入的参数。

请求说明：

|  |  |
| --- | --- |
| **参数** | **描述** |
| 请求地址 | OIDC认证中“获取授权Token接口地址”  E10系统地址/papi/sso/oidc/accessToken |
| 请求方式 | POST |

请求参数：

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **参数** | **名称** | **必须** | **示例** | **描述** |
| grant\_type | 授权类型 | 必须 | authorization\_code | 固定为authorization\_code |
| client\_id | 应用标识 | 必须 | 9c5a07c0e2ad40229cc73306b6996f6b | E10系统认证应用管理中该应用注册的应用标识 |
| client\_secret | 应用密钥 | 必须 | 4439727c-2f20-42d1-b11c-e36b8214072e | E10系统认证应用管理中该应用注册的应用密钥 |
| code | 授权码 | 必须 |  |  |
| redirect\_uri | 回调地址 | 必须 | https://cas.e-cology.cn | 成功授权后的回调地址。  注：不支持地址中有#路由地址。 |

请求示例：

|  |
| --- |
| curl --request POST 'https://weapp.yunteams.cn/papi/sso/oidc/accessToken?client\_id=1910ad2019214245bb7dcf8bd3c0472e&client\_secret=e4d790e2-f735-4f09-8e91-29f3bf56c849&grant\_type=authorization\_code&code=OC-2-2ffB72HRr8qblzFOXC3W660-ZWWPEEw4&redirect\_uri=https://cas.e-cology.cn |

返回参数说明：

|  |  |  |
| --- | --- | --- |
| **参数** | **名称** | **描述** |
| access\_token | 授权令牌 | 返回给第三方应用的授权令牌，获取用户信息时需要使用到 |
| refresh\_token | 刷新令牌 | 返回给第三方应用的刷新令牌，刷新access\_token使用 |
| id\_token | jwt令牌 | 通过jwt可解析到用户信息 |
| expire | 授权令牌的有效期 | 返回给应用的授权令牌的有效期。（注意：有效期以秒为单位） |
| msg | 错误信息 | 成功为SUCCESS |
| code | 错误代码 | 成功为0 |
| status | 状态码 | 成功200，失败400 |

正确返回示例：

|  |
| --- |
| {  "msg": "SUCCESS",  "access\_token": "AT-1-5x09geXtAAUrWOpD-RZUBOH-7kpWyUKK",  "refresh\_token": "RT-1-H-QIvq9UXMdY-mShNny1cBwqhSDUTm7q",  "code": "0",  "id\_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IlpJb2tPOE5iQmhmWENzQmhBaEpTUHYyZ1FCQTZFdklMIn0.eyJqdGkiOiJUR1QtMy1WYXU0LS1kM2ZwSnNULThnVFJoRGF5c0lYcUxTV1RSdzNlR2w3bWNLc0R0UUhHay0tZ3RMcVB6U2Z1VG41QlppSEowRVRMMTAyMDEwIiwiaXNzIjoiaHR0cHM6Ly9pbnQueXVudGVhbXMuY24vb2lkYy8iLCJhdWQiOiIyNTUzMmI0My1kMzdhLTQ1MWYtOTM3Ny0wZjIyZjI4ZTYwOTMiLCJleHAiOjE2ODgxMjA5NDUsImlhdCI6MTY4ODA5MjE0NSwic3ViIjoiMTk5MDE3NjE4NDQifQ.XdmphV\_H26HRageal1\_7AI-\_QAY\_vaSXC6as8oxI4oLou7-4fr0p\_Eh4OXNfUvSLkWnttrDA-OfB3QhCns4dMAloUhKTay-Tm716aoE3BEOPfJQ8okhzYV8aeC\_W7aJK04FZiFjN6vjTSBL61xNqj30Sism-E5icPxhWWY4hiE6iECLyvdqNQzsyNNwpx3zQql65bw8z2-2rRbKFenFVtBo0PruObKm50EXwFgcrAAWWNxGH04T3Ax3w4A0PR\_szIydv-2b4-siHrPOgi-HtTOOq48x\_rXwu0QXXJt84rFytKGP5lH2vOMESTzNYkHBbg9kyvaDTp9gIBt1rayBMEw",  "expires\_in": 28800,  "status": 200  } |

错误返回示例：

接口返回的错误代码可参考[[#附录2|附录二、接口错误代码]]

|  |
| --- |
| {  "msg":"参数client\_id不能为空",  "code":"1002",  "status":400  } |

5、刷新Id\_Token、Access Token

通过授权Token接口返回的Refresh\_Token，刷新授权令牌Access Token，Access Token是第三方应用在调用E10系统获取用户信息时必须传入的参数。

请求说明：

|  |  |
| --- | --- |
| **参数** | **描述** |
| 请求地址 | OIDC认证中“获取授权Token接口地址”  E10系统地址/papi/sso/oidc/accessToken |
| 请求方式 | POST |

请求参数：

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **参数** | **名称** | **必须** | **示例** | **描述** |
| grant\_type | 授权类型 | 必须 | refresh\_token | 固定为refresh\_token |
| client\_id | 应用标识 | 必须 | 9c5a07c0e2ad40229cc73306b6996f6b | E10系统认证应用管理中该应用注册的应用标识 |
| client\_secret | 应用密钥 | 必须 | 4439727c-2f20-42d1-b11c-e36b8214072e | E10系统认证应用管理中该应用注册的应用密钥 |
| refresh\_token | 刷新token | 必须 |  |  |

请求示例：

|  |
| --- |
| curl --request POST 'https://weapp.yunteams.cn/papi/sso/oidc/accessToken?client\_id=1910ad2019214245bb7dcf8bd3c0472e&client\_secret=e4d790e2-f735-4f09-8e91-29f3bf56c849&grant\_type=refresh\_token&refresh\_token=RT-1-H-QIvq9UXMdY-mShNny1cBwqhSDUTm7q |

返回参数说明：

|  |  |  |
| --- | --- | --- |
| **参数** | **名称** | **描述** |
| access\_token | 授权令牌 | 返回给第三方应用的授权令牌，获取用户信息时需要使用到 |
| id\_token | jwt令牌 | 通过jwt可解析到用户信息 |
| expire | 授权令牌的有效期 | 返回给应用的授权令牌的有效期。（注意：有效期以秒为单位） |
| msg | 错误信息 | 成功为SUCCESS |
| code | 错误代码 | 成功为0 |
| status | 状态码 | 成功200，失败400 |

正确返回示例：

|  |
| --- |
| {  "msg": "SUCCESS",  "access\_token": "AT-1-5x09geXtAAUrWOpD-RZUBOH-7kpWyUKK",  "code": "0",  "id\_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IlpJb2tPOE5iQmhmWENzQmhBaEpTUHYyZ1FCQTZFdklMIn0.eyJqdGkiOiJUR1QtMy1WYXU0LS1kM2ZwSnNULThnVFJoRGF5c0lYcUxTV1RSdzNlR2w3bWNLc0R0UUhHay0tZ3RMcVB6U2Z1VG41QlppSEowRVRMMTAyMDEwIiwiaXNzIjoiaHR0cHM6Ly9pbnQueXVudGVhbXMuY24vb2lkYy8iLCJhdWQiOiIyNTUzMmI0My1kMzdhLTQ1MWYtOTM3Ny0wZjIyZjI4ZTYwOTMiLCJleHAiOjE2ODgxMjA5NDUsImlhdCI6MTY4ODA5MjE0NSwic3ViIjoiMTk5MDE3NjE4NDQifQ.XdmphV\_H26HRageal1\_7AI-\_QAY\_vaSXC6as8oxI4oLou7-4fr0p\_Eh4OXNfUvSLkWnttrDA-OfB3QhCns4dMAloUhKTay-Tm716aoE3BEOPfJQ8okhzYV8aeC\_W7aJK04FZiFjN6vjTSBL61xNqj30Sism-E5icPxhWWY4hiE6iECLyvdqNQzsyNNwpx3zQql65bw8z2-2rRbKFenFVtBo0PruObKm50EXwFgcrAAWWNxGH04T3Ax3w4A0PR\_szIydv-2b4-siHrPOgi-HtTOOq48x\_rXwu0QXXJt84rFytKGP5lH2vOMESTzNYkHBbg9kyvaDTp9gIBt1rayBMEw",  "expires\_in": 28800,  "status": 200  } |

错误返回示例：

接口返回的错误代码可参考[[#附录2|附录2：接口错误代码]]。

|  |
| --- |
| {  "msg":"参数client\_id不能为空",  "code":"1002",  "status":400  } |

6、获取用户信息

此接口主要用于第三方应用系统使用E10系统登录时，从E10系统获取当前登录用户的信息。

请求说明：

|  |  |
| --- | --- |
| **参数** | **描述** |
| 请求地址 | OIDC认证中“获取用户信息接口地址”  E10系统地址/papi/sso/oidc/profile |
| 请求方式 | POST |

请求参数：

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **参数** | **名称** | **必须** | **示例** | **描述** |
| access\_token | 授权令牌 | 必须 | authorization\_code | 获取授权Token接口返回的access\_token |

请求示例：

|  |
| --- |
| curl --request POST 'https://weapp.yunteams.cn/papi/sso/oidc/profile?access\_token=xxxx' |

返回参数说明：

|  |  |  |
| --- | --- | --- |
| **参数** | **名称** | **描述** |
| id | 用户信息 | 值为该应用注册的OAuth2应用选择的账号映射规则对应的值 |
| msg | 错误信息 | 成功为SUCCESS |
| code | 错误代码 | 成功为0 |
| status | 状态码 | 成功200，失败400 |
| attributes | 人员其他属性 | 暂不返回人员其他属性值 |

正确返回示例：

|  |
| --- |
| {  "msg":"SUCCESS",  "code":"0",  "id":"18229708888",  "status":200  } |

错误返回示例：

接口返回的错误代码可参考[[#附录2|附录2：接口错误代码]]。

|  |
| --- |
| {  "msg":"参数access\_token值失效",  "code":"1012",  "status":400  } |

7、退出

应用在和E10系统进行认证集成后，在退出应用系统后，会出现无法退出的情况，原因是没有注销E10系统的登录会话。

所以应用在退出时，可调用E10系统的退出接口，进行E10系统的用户会话注销。

注意：退出接口还未支持全局退出，即应用调用退出接口后， 是退出了E10的会话，当前应用退出了，但是另外接入的应用将还不会退出。

请求说明：

|  |  |
| --- | --- |
| **参数** | **描述** |
| 请求地址 | OIDC认证中“统一退出接口地址”  E10系统地址/sp/integration/oidc/logout |
| 请求方式 | GET |

请求参数：

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **参数** | **名称** | **必须** | **示例** | **描述** |
| service | 退出重定向地址 | 必须 | https%3A%2F%2Fjytcas.e-cology.cn%2Fdemo\_oauth%2Findex.jsp | 域名需要在白名单中进行设置，否则将不能跳转service |

请求示例：

|  |
| --- |
| E10系统地址/sp/integration/oidc/logout?service=https%3A%2F%2Fjytcas.e-cology.cn%2Fdemo\_oauth%2Findex.jsp |

8、获取密钥

获取id\_token加密使用的jwk密钥信息

请求说明：

|  |  |
| --- | --- |
| **参数** | **描述** |
| 请求地址 | E10系统地址/papi/sso/oidc/keys |
| 请求方式 | POST |

请求参数：

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **参数** | **名称** | **必须** | **示例** | **描述** |
| client\_id | 应用标识 | 必须 | 9c5a07c0e2ad40229cc73306b6996f6b | E10系统认证应用管理中该应用注册的应用标识 |
| client\_secret | 应用密钥 | 必须 | 4439727c-2f20-42d1-b11c-e36b8214072e | E10系统认证应用管理中该应用注册的应用密钥 |

请求示例：

|  |
| --- |
| curl --request POST 'https://weapp.yunteams.cn/papi/sso/oidc/keys?client\_id=1910ad2019214245bb7dcf8bd3c0472e&client\_secret=e4d790e2-f735-4f09-8e91-29f3bf56c849 |

返回参数说明：

|  |  |  |
| --- | --- | --- |
| **参数** | **名称** | **描述** |
| key | 密钥类型 |  |
| e | 公共指数 |  |
| kid | 唯一标识 |  |
| alg | 算法类型 |  |
| n | 密钥值 |  |

正确返回示例：

|  |
| --- |
| {  "keys": [  {  "kty": "RSA",  "e": "AQAB",  "kid": "xxx",  "alg": "RS256",  "n": "xxx"  }  ]  } |

错误返回示例：

接口返回的错误代码可参考[[#附录2|附录2：接口错误代码]]。

|  |
| --- |
| {  "msg":"参数client\_id不能为空",  "code":"1002",  "status":400  } |

9、验证

维护应用系统与E10系统之间的人员关系。

访问应用系统，调用E10系统授权接口进行登录授权（应用系统自行实现），E10认证登录授权后，携带code回调应用系统， 应用系统进行登录。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/968560148b52d6e9371f0923fff63002.jpg)

**附录1：提示信息页面**

请求用户授权接口进行授权时，如果授权失败，将会跳转到提示页面。

以下列举可能出现的提示：

|  |  |  |
| --- | --- | --- |
| **code** | **提示信息** | **描述** |
| 80006 | 当前账号未维护登录名，请设置登录名后重新登录 | 认证应用中账号映射规则设置了登录名，登录人员需要维护登录名 |
| 80007 | 当前账号未维护身份证，请设置身份证后重新登录 | 认证应用中账号映射规则设置了身份证，登录人员需要维护身份证 |
| 80008 | 当前账号未维护工号，请设置工号后重新登录 | 认证应用中账号映射规则设置了工号，登录人员需要维护工号 |
| 80009 | 当前账号未维护电子邮箱，请设置电子邮箱后重新登录 | 认证应用中账号映射规则设置了电子邮箱，登录人员需要维护电子邮箱 |
| 80010 | 当前账号未维护手机号码，请设置手机号码后重新登录 | 认证应用中账号映射规则设置了手机号码，登录人员需要维护手机号码 |
| 80011 | 该用户当前团队与应用所属团队【xxx】不一致，请切换正确的团队后重新登录 | 需要切换到认证应用所在团队，才能进行认证登录 |
| 80012 | 当前认证未开启，请联系管理员开启认证 | 应用标识对应的认证应用被禁用了 |
| 80013 | 回调地址与认证应用注册的业务系统URL地址不一致，请联系管理员检查配置 | 授权接口传的redirect\_uri参数值与认证应用中业务系统URL地址不一致 |
| 80014 | 登录用户不在认证应用注册的适用对象范围内，请联系管理员检查配置 | 认证应用设置的适用对象中没有此人员 |
| 80015 | 参数应用标识(client\_id)缺失或值未在认证应用中注册，请联系管理员检查配置信息 | 授权接口传的client\_id参数值不对，需要应用系统检查 |
| 80016 | 参数response\_type缺失或值错误，请联系管理员检查配置信息 | 授权接口传的response\_type参数值不对，需要应用系统检查 |
| 80017 | 参数回调地址(redirect\_uri)缺失，请联系管理员检查配置 | 授权接口传的redirect\_uri参数值不对，需要应用系统检查 |
| 80018 | 参数应用标识(appid)缺失或值未在认证应用中注册，请联系管理员检查配置信息 | process接口里面参数appid不对 |
| 80019 | 参数回调地址(service)缺失，请联系管理员检查配置 | process接口里面参数service不对 |
| 80020 | 参数回调地址(appUrl)缺失，请联系管理员检查配置 | process接口里面参数appUrl不对 |
| 80021 | 接口请求超时异常，请稍后重新登录 |  |
| 80022 | 认证登录异常，请稍后重新登录 |  |
| 80023 | 认证应用未启用，请联系管理员启用应用 | OAuth2认证还是关闭状态 |
| 80026 | 认证登录异常，请稍后重新登录 | rpc接口异常，需要等待 |

**附录2：接口错误代码**

接口返回的结果里的code值：

|  |  |
| --- | --- |
| **错误代码（code）** | **错误信息（msg）** |
| 0 | 成功 |
| 1002 | 参数client\_id不能为空 |
| 1003 | 参数redirect\_uri不能为空 |
| 1005 | 参数redirect\_uri未注册 |
| 1007 | 参数client\_secret不能为空 |
| 1008 | 参数code不能为空 |
| 1009 | 参数client\_secret未注册 |
| 1010 | 参数code值失效 |
| 1011 | 参数access\_token不能为空 |
| 1012 | 参数access\_token值失效 |
| 2019 | 授权异常 |
| 1014 | process异常 |
| 1015 | 获取access\_token异常 |
| 1016 | 获取用户异常 |
| 1017 | 参数grant\_type不能为空 |
| 1018 | 登录异常 |
| 1019 | 获取TGT异常 |
| 1020 | 获取Ticket异常 |
| 1022 | 参数grant\_type值错误 |
| 2022 | 参数clientId未注册 |
| 9090 | service不存在 |
