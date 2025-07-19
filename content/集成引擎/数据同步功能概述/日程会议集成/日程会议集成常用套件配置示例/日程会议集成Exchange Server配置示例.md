---
aliases: ["1970494130515256606"]
title: 日程会议集成Exchange Server配置示例
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

Exchange Server分为代理模式与用户模式。

**代理模式**

1、代理模式下需要配置管理员账号

首先要有一个exchange账号，后再执行赋权操作，打开EWS服务器上的powershell，界面如下图：

![](d3e9432ce7a94f326b92770af1cda5b4.jpg)

执行以下命令为账号赋权，命令红色部分替换实际账号：

New-ManagementRoleAssignment –Name:impersonationAssignmentName –Role:ApplicationImpersonation –User:test1

执行完上述语句即可完成赋权（红框为执行失败，绿框为执行成功）

![](949a7bd69b8eb2808909addd3c1ce317.jpg)

2、日程会议集成基本信息配置

选择代理模式，账号填写已赋权的账号及该账号密码，其他根据实际需要配置

![](d139acc4500ed00f0acb04a5ded0f251.jpg)

**用户模式**

选择用户模式后，需要在个人设置--集成设置--日程会议集成账号菜单设置个人Exchange Server账号及密码

![](7c5005021bfb256b2e39c233d06e811c.jpg)

如客户邮箱账号“别名”【zhao4B】与“登录名”【zhao4】不相同，请在此菜单维护用户名为“登录名@域名”，例如“zhao4@exchange.com”，密码为该账号密码

![](3c8441bf86b7450e10ed9efefaeee4ae.jpg)

**维护**维护配置所选绑定字段值**

**例如绑定字段选择邮箱，则在人力资源卡片维护邮箱字段值**

入口：个人设置 - 个人资料

![](84018f7c69f6aeb48761009b53ae1256.jpg)

如客户邮箱账号“别名”【zhao4B】与“登录名”【zhao4】不相同，请在人力资源卡片邮箱信息维护为“别名@域名”，例如：“zhao4B@exchange.com”

![](41acb646f7cb44c8f5801828e57d8749.jpg)

以上步骤配置完成，即可实现日程同步