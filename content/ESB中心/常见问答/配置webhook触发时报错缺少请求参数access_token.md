---
aliases: ["1970282220803357664"]
title: 配置webhook触发时报错缺少请求参数access_token
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

**问题描述：**

配置webhook触发时报错缺少请求参数access\_token，但是认证应用只提供app\_key和app\_secret，这个access\_token参数要去哪里获取？

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c562c13f0a9ed2577e001f88cb19add8.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/01b3b9a137e4ce678161d79f1671e97f.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/32c2834c1dc3056fc227017292e63a63.jpg)

**问题解答：**

根据官网开放平台的开发文档，由corpid、app\_key、app\_secret分别动态获取code和access\_token

