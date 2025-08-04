---
aliases: ["1967818665585731996"]
title: 新增eb表单数据（批量新增）
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

**1.**场景说明**

如在【三会管理】中，会议发布之后，签到登记者可以在会议开始前生成签到表，根据列席人员和出席人员者这两个多选人员字段，分别为每一个参会者创建会议签到信息。根据多选字段的值同时新建多条数据的效果可通过动作流新增表单数据功能，以批量新增的方式实现。

效果如下图所示

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/48da98ad22c5c44a6c48d53c016b1c42.jpg)

**2.**功能简介**

在【会议信息表单】创建按钮【生成签到表】，点击该按钮，将每一个参会人员信息结合会议信息录入到【参会人员表单】中，生成新的表单数据。

**3.**操作说明**

1、设计会议信息表单，添加**多选人员字段**【出席人员】和【列席人员】，如图1所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f4a9128b5e00f690486f62084452abb2.jpg)

图1 设计表单和多选字段

2、在会议信息表单的表格视图上创建自定义按钮【生成签到表】作为动作流的触发入口，按钮显示条件为“会议状态等于已发布”如图2所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1ee9db806ec158cf5645c819a593bda0.jpg)

图2 创建自定义按钮【生成签到表】

前台效果如图3所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/58bc7f4ee09c0d12f947b35484e479b6.jpg)

图3 按钮在前台的显示效果

3、新建动作流，配置触发动作为点击按钮【生成签到表】后，如图4所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bc9d51c1ee522f5711febffaec1c6abf.jpg)

图4 新建动作流配置触发动作

添加【标准应用-ebuilder-新增表单数据】执行动作，**新增方式选择批量新增**，**依据值为出席人员字段**如图5所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/77fdabbc685f3e9e3019907350a76e92.jpg)

图5 添加执行动作

配置表单数据，会议相关信息（如会议名称、会议编号、会议状态和会议类型）由触发节点的会议信息表单数据动态赋值；姓名字段的赋值方式选择**依据值下级**，赋值数据为出席人员；是否出席赋值为**固定值**未出席，如图6所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/76d1d738634b117cc6792a147f84ffec.jpg)

图6 配置表单信息

