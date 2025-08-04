---
aliases: ["1968377455694205334"]
title: 流程审批节点—流程节点id
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**1. 场景说明：**

在【审计管理】场景中，有时会需要根据不同的流程审批节点，修改当前审计业务表单的相关数据的情况。

展示效果如下图所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d66ee426a8d09e5fdb7a4574bef2c424.jpg)

**2. 功能简介：**

如果我们想要实现以上业务场景，我们可以通过获取不同审批节点的流程id配合动作流执行动作-内置-条件分支来对配置应动作流。

**3. 操作说明：**

（1） 获取流程id

方法1：可以直接在流程节点查看当前页面的URL，URL中nodeset后方的一串数字就为节点id。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1a12689a4ff788d64fc8ac77eb263418.jpg)

方法2：利用开发者工具-元素，进入流程设计中选择对应流程节点，可以获取到所需流程节点id。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/814060caea13601b7f2ca0ce75a3f7c1.jpg)

方法3：配置输出动作流，将所需节点的流程id打印出来。

进入动作流配置界面，选择所需流程，并配置所需打印出的流程审批节点为触发时机；然后在选择执行动作-【内置】-【输出组件】，配置它的提醒内容为动态赋值-流程触发节点。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/eaf2d28b17f3c95f6ca95b62b9a9a872.jpg)

动作流执行成功后，进入后台管理-ESB中心当中，选择配置打印流程id的动作流。查看最新触发的动作流执行报文，可以在报文对应执行动作位置查看到所需的流程节点id。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/699b8468fdeb8e732c4012cd913b2afc.jpg)

**4. 实现效果：**

