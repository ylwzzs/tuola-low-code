---
aliases: ["1966571672261117462"]
title: SAML集成接入微软AzureAD
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

本文档介绍E10系统通过SAML集成方式接入微软AzureAD。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6e66e6200a97f1e767090ea354f6834c.jpg)

**配置前提**

1、E10系统需要部署https协议。

2、维护OA系统与微软中人员的对应关系。（可看“[[#6|维护微软AzureAD以及OA系统人员]]”）

**微软AzureAD提供IDP元数据文件**

1、企业应用程序中创建你自己的应用程序

默认勾选“集成未在库中找到的任何其他应用程序(非库)”![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/52a5b877404c88041ad4f36368fd6e9d.jpg)

2、单一登录-设置SAML单一登录中，在SAML证书中通过应用联合元数据URL保存IDP元数据文件或直接点击“下载”联合元数据XML。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f97ff2e7d6d321c1e791633196a61054.jpg)

（备注：可通过“应用联合元数据URL”，将内容复制出来，存为一个.xml文档）

**E10系统配置SAML集成获取SP元数据文件**

后台管理中心-集成中心-统一认证接入管理，选择SAML集成进行配置：

1）回调地址：只读，不用管

2）Entity ID：默认值，无特殊要求不需要调整

3）IDP元数据文件上传微软的联合元数据XML

4）自动生成自签名证书开启，使用自签证书

5）证书密码根据实际自行设置证书密码

6）签名算法选择SHA-1

7）组织名称、组织网址、联系邮箱地址根据实际自行设置，生成SP元数据文件需要

8）账号规则电子邮箱（可看“[[#6|维护微软AzureAD以及OA系统人员]]”）

点击【保存】后显示【下载SP元数据文件】，点击下载SP元数据文件，文件给到微软

**微软AzureAD中导入SP元数据文件**

单一登录-设置SAML单一登录中，点击“上载元数据文件”，上传E10提供的SP元数据文件：![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8b2d12ae15b8c176c7f32d4e1d03bb6f.jpg)

点击“添加”后，配置会自动加载，无需调整，直接保存即可。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5dc6056e4af4a57d22049f5aeae1ecb1.jpg)

**维护微软AzureAD以及OA系统人员**

1、进入创建的应用，“用户和组”中添加用户/组![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b8ac4f66159225fe9374ad9d96b73ab7.jpg)

2、单一登录，属性和索赔里面唯一用户标识符默认是“user.userprincipalname”，即对应人员的“用户主体名称”

默认“user.userprincipalname”：![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c58b6b015ac62eac3e8dc1879077c8d6.jpg)

对应人员“用户主体名称”：![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5f68879558790c839ab311fad2760343.jpg)

唯一用户标识符保持默认“user.userprincipalname”，需要维护用户主体名称，即E10系统这边获取到的信息是用户主体名称信息，将与SAML集成中设置的账号规则进行匹配：

若账号规则选择“电子邮箱”，则将获取的用户主体名称直接与E10的人员邮箱进行匹配；

若账号规则选择“手机号码”，则将获取的用户主体名称，截取@符号前面的内容 与E10的人员手机号码进行匹配；

若账号规则选择“工号”，则将获取的用户主体名称，截取@符号前面的内容 与E10的人员工号进行匹配。

注意：若唯一用户标识符被修改成其它属性，E10系统获取的人员信息将是其它属性的值的，匹配规则还是保持不变，即账号规则选择“电子邮箱”直接匹配；选择“手机号码”或“工号”还是会截取@符号前面的内容（若有@符号）。

**集成效果：PC端**

前提：

1、开启PC端认证按钮

2、全局基础-界面配置中心-登录页设置-PC端登录页中维护PC端自定义登录地址：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fc8b7a7c1691a5adbd43a2b092c086c6.jpg)

访问自定义登录地址可跳转到微软登录页面进行认证登录：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b5c8c785c2cbb02b544943a3f3bff365.jpg)

微软登录后可回调登录E10系统：![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7c94c2e169b67b9bb83247e39abd2f21.jpg)

**集成效果：移动端**

前提条件

1、开启移动端认证按钮

2、全局基础-界面配置中心-登录页设置-移动端设计中维护自定义登录地址：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/232284b1ac4bb98ad9d026f1f062572d.jpg)

3、配置移动端服务器地址

1）未开启全资源拦截

移动端服务器地址需配置移动端个性化地址：

https://passport.yunteams.cn/customlogin/mobilezzz

（界面配置中心-登录页设置-移动端登录页中设置的自定义登录地址）；

2）开启全资源拦截（**仅私有化主团队支持**）

直接配置域名即可；

3）若开启了二级域名，则访问域名或个性化地址时，二级域名需使用后端接口域名：

示例：

若当前环境已开启二级域名，前端静态资源、sp接口域名为/release/second，后端api、papi等接口域名为/releaseWeaver。

此时，界面配置中心-登录页设置-移动端登录页中设置自定义登录地址显示为：

https://passport.yunteams.cn/release/second/customlogin/mobilezzz

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/eae89bd0d3ed4f9c58cfbebf0b661f96.jpg)

由于移动端APP本身无法识别，移动端服务器地址需讲移动端个性化地址的二级域名修改成后端接口的二级域名releaseWeaver，即：

https://passport.yunteams.cn/releaseWeaver/customlogin/mobilezzz

认证登录效果：

进入手机移动端APP登录页，双指双击进入切换服务器地址页面，移动端服务器地址需配置移动端个性化地址：

https://passport.yunteams.cn/customlogin/mobilezzz

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a8a4d20b3b2b0c4cceb5284608c5482c.jpg)

进入认证登录页（适配H5页面）：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/cf299a9a4ef7aaf4f3cab27e79cc5f8c.jpg)

输入账号密码后，可登录E10，进入E10移动端登录后页面：

