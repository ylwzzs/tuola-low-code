---
aliases: ["1969752162766850929"]
title: 单点到e-cology8系统
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bffc87736e833a0876b2f4990fbf34de.jpg)

点击套件模板的使用按钮，进入简易版新建集成登录页面：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/271cdc9f85ed3bfcc25ad2a3a15d5668.jpg)

**配置参数说明**

外网地址：ip:端口号/login/VerifyLogin.jsp

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e8fa9c4a00c7da4ab290e534476ee06b.jpg)

自定义参数：

loginid：参数值根据第三方账号参数做匹配

userpassword：参数值根据第三方密码参数做匹配

logintype：固定值1

**配置单点登录人员权限（共享范围）**

新建完成后，若要进行单点登录，则需进入编辑集成登录设置页面，点击共享范围，设置允许单点登录的人员（共享范围默认为空，所有人均无权限）。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/dadc086b144e9d8771c906e4e0a1a680.jpg)

**单点具体页面地址**

单点具体页面地址后方需要携带gopage参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a92b2728656233350b37394e2c49e815.jpg)

例：新建流程地址：

/workflow/request/AddRequest.jsp?workflowid=12023&isagent=0&beagenter=0&f\_weaver\_belongto\_userid=

Url编码后：

%2Fworkflow%2Frequest%2FAddRequest.jsp%3Fworkflowid%3D12023%26isagent%3D0%26beagenter%3D0%26f\_weaver\_belongto\_userid%3D

内外网地址：

