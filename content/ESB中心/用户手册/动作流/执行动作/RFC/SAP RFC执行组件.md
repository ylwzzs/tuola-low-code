---
aliases: ["1974036429444094790"]
title: SAP RFC执行组件
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

1. 进入平台引擎-> ESB中心-> 连接器

2. 点击新建连接信息 新建RFC连接， 如下图所示

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6c67852977ffb8952300b0ef79978af8.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ae9c6cc91a0fdc0c64b3df40db6a67cd.jpg)

3. 点击新建RFC接口信息,如下

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/12d1f59ee65e3a39478694d2aeaf98cb.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f84769c469014af13a28a78c73233e1b.jpg)

在rfc 连接信息正确 并且 接口函数存在情况下 可以开启自动解析参数，并且可以检测函数是否存在

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1649e0400cb19ef7f7c5a3d133775d8e.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bb3761707ca78def3d466113e62ed5b4.jpg)

函数存在说明连接正常 函数也正常

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6dab1f51888673aab25fca7906231f00.jpg)

开启自动解析参数之后 在首次创建时 会自动带出该函数请求和响应数据（注意：保存后则不会再带出了，只有首次新建时可用），如下

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/abf1cd168c59f27e60a1e38063c4bfe3.jpg)

如果不开启自动解析， 也可以根据接口要求自己手动配置请求参数以及响应参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/91704e6174a7d479526facb098fb1467.jpg)

配置成功失败条件

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2065c7d0885a21805c38a12b5c09e757.jpg)

例：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/99514157425f2c2599014dd3ef272f15.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7d35dac4eeb38b8cfd30efac5246482c.jpg)

点击添加，保存即可

当配置检查无误，选择将接口发布使用

