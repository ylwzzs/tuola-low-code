---
aliases: ["1969752284464050935"]
title: token方式单点到e-cology8/9系统
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

以e-cology9系统为例：

**启用token认证**

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/44a8094dd09c9c0c86edbf131414617d.jpg)

注册token应用，配置IP白名单

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a6eadbff09d41c53ec1248244c60e37a.jpg)

IP白名单：是限制哪些 IP可以通过此 TOKEN应用获取 token值。故，需要第三方是在应用后台请求获取 token接口获取 token值，从而 IP白名单中只需配置应用服务的 IP即可。不建议第三方在前端请求获取 token接口，因若在前端，则每次调用 token接口的 IP都是不一样的，从而需在IP白名单中配置各个访问第三方的客户端 IP。若第三方服务有配置 nginx，则需要配置 nginx IP，非调用服务器 IP。

账号映射规则：默认用户名（OA账号 loginid），对应获取 Token接口中的 loginid参数取值，若此参数提供的是 OA账号，则选择用户名；若此参数提供的是 OA的邮箱，则选择邮箱。

**验证E9系统Token认证是否可以获取到token，拼接获取到的token是否能成功单点**

1、获取Token示例：E9获取 Token接口?appid=Token认证应用标识&loginid=E9人员对应Token认证应用账号映射规则字段的值

http://e9test.e-cology.cn/ssologin/getToken?appid=35ff6a69-1a12-4600-8d30-5d4d214483f6&loginid=13339997301**（这个只是示例，请勿直接复制使用，请根据当前环境配置调整！）**

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/499e4e9c128c23aa101955359aa26058.jpg)

2、拼接获取到的Token浏览器访问可成功登录至E9

http://e9test.e-cology.cn/wui/index.html?ssoToken=4B70C3ACD0C1B12CC0040390BB3AA85D9AE6FD430A9E9A359D293A8AF055FFEF737278125BB0AFA7D685A501F27FC513F4D7D2AA677599AFA91A1971B08CA955#/main

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/711d5db5a2cb99526c7fdb812600c896.jpg)

3、获取Token失败，请参考 常见配置问题说明 检查配置

**新建E10系统集成登录配置**

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f8a3155782f07eaae037dff879f2d51a.jpg)

点击套件模板的使用按钮，进入简易版新建集成登录页面：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4522ffde9e98ca8c097b0458eab9425f.jpg)

外网地址：配置E9获取token接口地址

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0491bfae851f2318f0fbb74a35da75bb.jpg)

自定义参数：

appid：配置E9Token认证应用的应用标识

loginid ：与E9Token认证应用设置的账号映射规则匹配

loginUrl：最终跳转的E9地址

**配置单点登录人员权限（共享范围）**

新建完成后，若要进行单点登录，则需进入编辑集成登录设置页面，点击共享范围，设置允许单点登录的人员（共享范围默认为空，所有人均无权限）。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fd41349060018b25e289df4418576a14.jpg)

**配置示例**

E9 Token认证应用账号映射规则为手机号码

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6a2637b467b1f6d3bb61b8df9c9c855f.jpg)

E10人员与E9人员手机号匹配

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3df70901f0697bab0b9a7a80d7c6c43c.jpg)

E10集成登录配置的loginUrl为E9新建流程地址

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c29ab85753005022a4432e9c94119b78.jpg)

配置完成后，点击保存并预览或预览，选择对应人员，点击预览可生成单点登录地址

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/847d708f04cde3c6ae1a58e0379c5bf4.jpg)

复制该地址访问或点击测试按钮最终单点效果

