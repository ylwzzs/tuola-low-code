---
aliases: ["1970260311923757565"]
title: serverless/Action组件执行报错，服务未发布
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

**问题描述：**

serverless/Action组件执行报错，服务未发布

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/46b31b604c14afb6923305f7ca29db0b.jpg)

**问题解答：**

常见原因：查看动作流日志，发现出现上面的异常信息。该报错一般是dubbo提供者未成功发布，检查下 dubbo服务的 group 和version 动作流配置是否正确，并且可以在nacos 查询对应的服务有没有发布成功。

1、首先找到动作流中异常serverless的配置，获取分组标识  
![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a53d465d883248455d07fd52485331d0.jpg)  
2、复制分组标识，到nacos控制平台-服务列表下搜索服务是否发布  
