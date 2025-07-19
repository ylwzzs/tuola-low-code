---
aliases: ["1966571287244817461"]
title: 接入E9系统的CAS认证
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

一套E9系统部署weaversso，开启CAS认证， 注册E10系统的认证应用， E10系统进行接入。

首先，先了解下E9系统与E10系统之间的人员关系；

其次，E9系统需部署weaversso服务，开启CAS认证；

其次，E9系统需要注册E10系统的CAS认证应用，提供应用标识appid给到E10系统；

其次，E9系统提供CAS接口地址给到E10系统；

最后，E10系统进行配置。

**E10与E9系统人员关系**

E9系统提供的CAS服务默认是返回人员的登录名的。

维护人员关系：E9系统人员登录名为手机号码，对应E10中人员的手机号码。

**E9系统提供CAS服务接口地址**

E9系统中开启CAS认证：

（E9系统中需配置weaversso，确保CAS认证能测试通过）

![](dfc0efae9367aade967af16d5c8a6ff2.jpg)

E9系统注册E10的CAS认证应用，提供应用标识：**9eb50b1f-06e2-4b77-a637-74f290a153d1**

![](859a493715151353fb196fe615afd7ff.jpg)

则此E9系统提供CAS服务接口地址：

**服务地址：E9系统地址/sso**

**登录地址：E9系统地址/sso/login?appid=9eb50b1f-06e2-4b77-a637-74f290a153d1  
退出地址：E9系统地址/sso/logout**

**E10统一认证接入管理配置**

开启统一认证接入管理，设置CAS集成，配置认证服务参数，账号规则设置手机号码：

![](1cb04a719dfde22c97faf15b40a48a8b.jpg)

**E10中需申请注册E9系统白名单**

需要将CAS服务域名10.12.21.20添加白名单，目前只能passport那边手动添加

**PC登录效果**

前提：启用认证接入管理功能，开启PC端认证。

![](91301c468970ea7f89d9f16af631adda.jpg)

在界面配置中心-登录页设置-PC端登录页中设置自定义登录地址：

![](239ad20c3adfa79f3cdae15aacd090a7.jpg)

PC认证登录效果：

访问自定义登录https://passport.yunteams.cn/customlogin/mysqlzzz可跳转E9系统：

![](621b8b04e122fc340d8d7424495471b7.jpg)

输入用户名密码可登录E10：

![](2a5eb2ee9370585edf8c145c82c73fcb.jpg)

**移动端登录效果**

前提：启用认证接入管理功能，开启移动端认证。

![](f5df2eecc4018e3dacbc4082bf3b477f.jpg)

界面配置中心-登录页设置-移动端登录页中设置自定义登录地址：

![](ce391b4ffebdec8a8517dd9eaa268450.jpg)

移动端APP-配置移动端服务器地址：

1、未开启全资源拦截

移动端服务器地址需配置移动端个性化地址：

https://passport.yunteams.cn/customlogin/mobilezzz

（界面配置中心-登录页设置-移动端登录页中设置的自定义登录地址）；

2、开启全资源拦截

直接配置域名即可；

3、若开启了**二级域名**，则访问域名或个性化地址时，二级域名需使用后端接口域名：

示例：

若当前环境已开启二级域名，前端静态资源、sp接口域名为/release/second，后端api、papi等接口域名为/releaseWeaver。

此时，界面配置中心-登录页设置-移动端登录页中设置自定义登录地址显示为：

http://10.12.106.141/release/second/customlogin/mobilezzz

![](853875ff9e6776748fcd22a32bcb9215.jpg)

由于移动端APP本身无法识别，移动端服务器地址需讲移动端个性化地址的二级域名修改成后端接口的二级域名releaseWeaver，即：

http://10.12.106.141/releaseWeaver/customlogin/mobilezzz

移动端认证登录效果：

进入手机移动端APP登录页，**双指双击**进入切换服务器地址页面，移动端服务器地址需配置移动端个性化地址：

https://passport.yunteams.cn/customlogin/mobilezzz

![](b3760d152180bc701283ffbffa3a7d4d.jpg)

进入认证登录页（适配H5页面）：

![](fac58a699e3a284d3c74dad907e86cab.jpg)

输入账号密码后，可登录E10，进入E10移动端登录后页面：

![](ca3a22a4075b66abc36596a6fc1d9388.jpg)