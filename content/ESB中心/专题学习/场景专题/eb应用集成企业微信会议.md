---
aliases: ["1972716013446162371"]
title: eb应用集成企业微信会议
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

1.编写目的

本期内容将为大家讲解如何实现e10会议管理集成企业微信，在e10系统中会议预约流程审批通过后若会议形式为线上，系统自动创建企业微信会议，生成会议链接和会议号，降低人工预约会议的操作量，并解决个人腾讯会议账号会议预约时长限制的问题。用户参会议程在线上会议台账上清晰可见，参会人员可快捷扫码入会，发起人可一键取消预约。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a06f287fb868419d3d89a050159e4539.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a0d2a159cf1f7bdcbc03e9e2961c317d.jpg)

2.思路分析

通过云桥实现e10应用集成到企业微信，动作流云桥相关执行组件可实现创建/更新/删除企业微信会议。

3.操作说明

3.1云桥集成企业微信，将ebuilder应用发布到企业微信

具体操作方式可参考操作手册[[待下载-未知ID_1968932497207841036|云桥集成企业微信]]

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8d631770808e02b0a92b3f7934d07eab.jpg)

3.2在发布的应用中创建会议审批表单和会议审批流程

发起会议预约流程时仅显示会议预约信息，线上会议预约成功后显示入会信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/dc763e9e3eb3ab05268f62ca47d7b080.jpg) 会议预约表单设计器上，入会方式分组信息默认显示，添加显示属性联动，在流程审批结束之前隐藏此分类信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/614a8eab60554ffebaab83fe02a6f3b4.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3dc017a0f72632987c7839cb1e0446e0.jpg)

3.3会议预约流程归档时自动创建企业会议动作设计

会议归档节点添加节点附加操作，操作类型为动作流，新建自定义动作流

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/133d5fa325ff6840954edf31a6301f06.jpg)添加执行组件【创建企业微信会议】，选择发起会议预约的企业微信团队和来源应用，通过动态赋值讲会议预约流程字段信息映射到会议信息配置字段上

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/43c88c64148299d34d97d927862af596.jpg)

添加更新表单数据组件，更新会议预约流程表单的入会信息和会议状态字段，入会信息通过动态赋值从上文创建企业微信会议组件响应数据下获取

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/246d317362f851091323bb92fbd61ad1.jpg)

保存动作流设置，跳回流程附加操作设计页面，点击中间的【添加节点附加操作】讲动作流添加到附加操作列表，为其设置执行条件，当会议预约形式等于线上会议时执行该动作

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e09ac91971b0739ed5dcf97d11c029b1.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/68f13875328d754d03f960e39dd0ff53.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f5ec9f1d676afde9c95ea1b41127e15b.jpg)

3.4扫码入会设计

为会议预约详情信息添加页签展示入会二维码，微信扫码入会

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/792c4a9b5cb26f5506d91fd5c64667fc.jpg)

在表单关联设置中新建关联页签，命名为扫码入会，执行动作为点击表单入会链接字段所示地址（该字段内容由上一步骤中调用创建企业微信会议组件后其响应参数返回），二维码仅对主持人和参会人员生效

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2890068d55ab13006a065aa63f2e8a3e.jpg)

3.5会议取消按钮设计

在会议预约台账上添加会议取消按钮，显示位置为行上，仅对会议预约主持人开放

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/02831261a27d904f5501d9be5acc8191.jpg)

新建动作流，点击会议取消按钮时触发，如果会议形式字段选项名称等于线上，通过【删除企业微信会议】组件取消会议预约，分支外添加更新表单数据组件更新点击位置的会议状态为已取消

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/601f9fb350898bdc411b8396490ce0c1.jpg)

