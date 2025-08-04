---
aliases: ["1974314071730193183"]
title: 自定义e-code开发
created: 2025-07-15
modified: 2025-07-15
tags: ['表单引擎']
theme: 表单引擎
---

**一、背景、概述与价值**

表单引擎提供了一个针对表单全部布局的ecode代码、可视化管理页面，可以进行新增、管理ecode代码，从而实现定制功能或样式。

二**、内容目录**

- [[#3|功能详细说明]]

  [[#3.1|功能说明]]

  [[#3.2|场景示例]]

**三、功能详细说明**

**3.1 功能说明**

入口位于表单设置->自定义e-code开发处。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/de08741e535d598ea1d7f1dca6e436f3.jpg)

点击右上角的新增符号，可以新建e-code内容，每个表单当前最多支持20条e-code数据，可以在代码编辑处进入到JavaScript编辑器和CSS编辑器进行代码的新增或者编辑。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/de075d5b8fb4f1e22fd6de46ab80c431.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/53aadffa4893818efe241a0e7dc05268.jpg)

右上角更多处，有操作日志可以查看e-code的新增更新删除情况

**![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c40ea61f97d2e7e0cd3bf55a6c49e838.jpg)**

**![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1709f14589ba53ae37cfe12b0f2797c2.jpg)**

多个启用的e-code会调用多个ecode接口

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/462bda557bd2534d7fce86906dc7f668.jpg)

**3.2 场景示例**

**1.用ecode给选项设置默认值**

1）新建e-code，在JavaScript编辑器编辑器中写入代码

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bbd6f12e6940c75e44515db2424320e9.jpg)

2）运行时生效

