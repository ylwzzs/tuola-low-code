---
aliases: ["1975029832015198643"]
title: DevOps自动化发布
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 权限管理
---

#### **一、 功能介绍与开启**

DevOps自动化发布通过统一管理发布环境、应用包，将应用发布到其他环境/租户下，能够实现在一个环境进行统一管理，多个环境同时部署的应用发布管理体系，无需进行迁出迁出操作，就能够快速实现应用的部署发布。

自动化发布功能，需要在迁出迁入功能配置菜单中开启。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0d797489d3956f7d3603ab6257e0f7e6.jpg)

开启之后，需要添加相应管理员角色的功能权限，如下所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c7f825e403dccee38575b1739dbd05e2.jpg)

具备功能权限的角色人员，在迁出迁入处会展示功能菜单。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/227ebf3daedcf5cf06953aeb0c81f4ef.jpg)

#### **二、 设置**

设置页面目前主要进行发布环境的配置以及管理，入口位于【后台管理中心】-【迁出迁入】-【设置】：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9e877ab636341aed94cf0d66fbf4b7e5.jpg)

**新建环境**

新建发布环境通过点击右上角的“新建环境”按钮，弹出环境信息进行填写。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b375d30e6a98f1903de751a9af255238.jpg) l环境名称：填写发布环境的名称信息

描述信息：发布环境的具体描述

环境类型：分为测试环境、预发布环境、正式环境

环境地址：发布环境的URL地址

组织识别码：发布环境对应的租户识别码（租户key）

登录账号ID：发布环境对应的人员ID

注：1、环境地址未连接成功，请检查环境地址是否有误、环境是否未对外开放；2、登录账号ID的人员需要在发布环境中具备应用创建的权限，否则发布时会因为无创建权限而导致发布失败。

环境信息填写完成后，点击确定按钮，会发送申请信息到发布环境对应的人员处进行审核，当前新建的环境变为审批中状态。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/faefc6cbec3e2acd3c17fffc79195609.jpg)

**编辑环境**

当环境信息需要修改或者对应环境的人员账号需要更换时，可以点击环境卡片进行编辑修改。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d9f3361ef3241dc4ca5cdcc8b6e2777c.jpg)

注：环境地址与组织识别码禁止修改；登录账号ID修改之后会发起新的审批，环境状态变为“审批中”。

**删除环境**

当环境需要进行删除时，鼠标悬浮环境卡片时会显示删除按钮（审批中状态的环境不允许删除，因此不显示删除按钮），点击删除按钮二次确认后删除即可。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/99f2bd2f17fb978a5920d7cff2c5d703.jpg)

**环境审批**

新建环境发起申请后，发布环境对应的人员会收到申请信息并且进行审批。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ccd94970c927ef297d28de06d33a848d.jpg)

审批通过后，环境变为正常运行中状态，可以发布应用当前环境当前租户。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/43ca6fd33ab9bea4f8ab113c54aaf6ff.jpg)

审批拒绝后，环境卡片显示被拒绝状态，需要重新发起申请。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/349bd13fb9b59612d23044330a3d5912.jpg)

#### **三、自动化发布**

自动化发布主要是管理发布过程，用户可以在此页面进行发布、查看发布详情和结果等内容。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9d16aa1f99fbbfc22b7a7140e6bdb62b.jpg)

**一键发布**

在自动化发布页面右上角点击“一键发布”按钮，首先选择发布的内容（支持多选进行批量发布）

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9fa6b2bc1906737474f6d8879a60d986.jpg)

选择完成确认之后，在发布信息页填写发布名称、发布环境等，填写完成之后点击“发布”按钮即可完成发布。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/870270d3f0345d5333e412eebbb0e2db.jpg)

**1.名称**：本次发布任务的名称

**2.目标发布环境**：选择需要发布到哪个环境（只有运行中的环境支持发布）

**3.描述信息**：对本次发布任务的信息描述补充

**4.流水线源**：本次任务发布的内容，支持添加删除

完成发布信息的填写后，点击“发布”按钮，将自动进行发布，可以在发布信息页面看到发布过程进度以及发布的状态。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b9eff65879b5dedc40bfbdc279dc2e0d.jpg)

发布成功后，可以点击“比对结果”查看本次发布任务与目标环境的数据比对。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7e2e39c311e8c704eff8c87f72084511.jpg)

**发布情况**

发布情况可以在发布列表中进行查看，发布列表中记录每次发布的记录，支持查看发布过程、状态、耗时以及失败原因等，并且支持将发布的离线包进行下载。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/34da99c418f3d630e8b5e2c38b3cadf5.jpg)

#### **1.**7.3 包管理**

自动化发布生成的数据包以及常规迁出生成的包都会在包管理中进行统一管理，包卡片展示包的主要信息：包名、包内容、操作者、生成时间等。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fb75e356b9a9ea0168f486af476619e4.jpg)

支持下载、发布、删除操作。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3be7dc653d5e9f18e65af3f355489864.jpg) 下载：将包下载到本地

发布：将包发布到其他环境，与自动化发布操作一致

删除：在包管理列表中移除包的数据

点击包卡片，会展示包的详情以及操作日志，并且也支持下载与发布。

