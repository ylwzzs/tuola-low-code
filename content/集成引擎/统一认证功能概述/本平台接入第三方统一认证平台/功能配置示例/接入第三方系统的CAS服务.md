---
aliases: ["1966571276631617460"]
title: 接入第三方系统的CAS服务
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

本地通过tomcat搭建一套CAS服务，然后E10系统进行接入。

首先，先了解下CAS服务与E10系统之间的人员关系；

其次，CAS服务提供CAS接口地址给到E10系统；

最后，E10系统进行配置。

**E10与第三方CAS服务的人员关系**

本地CAS服务，默认返回的人员信息是登录名。

维护人员关系：CAS服务返回的人员登录名对应E10人员的电子邮箱。

**第三方CAS服务提供接口地址**

CAS服务提供接口地址：

**服务地址：http://jytcas.e-cology.cn/cas\_sqlserver\_MD5**

**登录地址：http://jytcas.e-cology.cn/cas\_sqlserver\_MD5/login**

**登出地址：http://jytcas.e-cology.cn/cas\_sqlserver\_MD5/logout**

**E10统一认证接入管理配置**

开启统一认证接入管理，设置CAS集成，配置认证服务参数，账号规则设置电子邮箱：

![](b5238297e14d1f215a7c8d9d2059c65a.jpg)

**E10中需注册CAS服务白名单**

需要将CAS服务域名e-cology.cn添加白名单，目前只能passport那边手动添加。

**登录效果**

界面配置中心-登录页设置中设置企业登录地址：

![](72157a2d1abe73b3849a951cf5f5bf1d.jpg)访问企业登录地址https://passport.yunteams.cn/jytcaslogin 可跳转CAS服务：

![](3dff1d67c23ff7af41625409aba91745.jpg)

输入账号密码认证登录后即可回调登录OA：

![](2a5eb2ee9370585edf8c145c82c73fcb.jpg)

点击退出也是会退出到CAS服务。