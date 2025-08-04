---
aliases: ["1969752193152450931"]
title: 单点到e-cology9系统
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/573853b1cd0fc0172436f4d218062150.jpg)

点击套件模板的使用按钮，进入简易版新建集成登录页面：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a38cb21754083533d6b8a3f651af2491.jpg)

**配置参数说明**

外网地址：ip:端口号/login/VerifyLoginE9.jsp

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b049f8393f2acdc073022e0bd040418c.jpg)

自定义参数：

loginid：参数值根据第三方账号参数做匹配

userpassword：参数值根据第三方密码参数做匹配

**配置单点登录人员权限（共享范围）**

新建完成后，若要进行单点登录，则需进入编辑集成登录设置页面，点击共享范围，设置允许单点登录的人员（共享范围默认为空，所有人均无权限）。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b962cdc051d61219f348dc8b7bf54201.jpg)

**单点具体页面地址**

单点具体页面地址后方需要携带gopage参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e6114d99923d2e75091d81e44057e226.jpg)

例：新建流程地址：

/wui/index.html?#/main/workflow/add?menuIds=1,12&menuPathIds=1,12&\_key=7bs10w

Url编码后：

%2Fwui%2Findex.html%3F%23%2Fmain%2Fworkflow%2Fadd%3FmenuIds%3D1%2C12%26menuPathIds%3D1%2C12%26\_key%3D7bs10w

内外网地址：

