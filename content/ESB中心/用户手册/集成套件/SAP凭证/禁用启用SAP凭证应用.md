---
aliases: ["1963239179079048570"]
title: 禁用/启用SAP凭证应用
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

1、禁用：通过SAP凭证详情页面的“禁用”按钮，来实现SAP规则禁用。禁用后，SAP应用状态变为“禁用”，且禁用后，审批完成不会发送相应的文件到SAP系统的FTP服务器；

2、启用：通过SAP凭证详情页面的“启用”按钮，来实现SAP规则启用。启用的时候会校验对应的审批单是否存在已启用的SAP凭证应用；如果存在，则启用失败，并提示“该流程已有设置，且在启用状态中,无法启用！”；如果不存在，则启用成功，对应的SAP凭证应用状态变为“启用”，且审批完成会发送相应的文件到SAP系统的FTP服务器。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/666c1e7fbeb5214cb0a7a5c773aaead8.jpg)