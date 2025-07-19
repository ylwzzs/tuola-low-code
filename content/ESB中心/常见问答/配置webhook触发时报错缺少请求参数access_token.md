---
aliases: ["1970282220803357664"]
title: 配置webhook触发时报错缺少请求参数access_token
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

**问题描述：**

配置webhook触发时报错缺少请求参数access\_token，但是认证应用只提供app\_key和app\_secret，这个access\_token参数要去哪里获取？

![](c562c13f0a9ed2577e001f88cb19add8.jpg)

![](01b3b9a137e4ce678161d79f1671e97f.jpg)

![](32c2834c1dc3056fc227017292e63a63.jpg)

**问题解答：**

根据官网开放平台的开发文档，由corpid、app\_key、app\_secret分别动态获取code和access\_token

![](b0695eda8b2edaa540d83f09b5f4321c.jpg)