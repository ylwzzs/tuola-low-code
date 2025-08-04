---
aliases: ["1967818669393531997"]
title: 修改eb表单数据（修改其他表单数据）
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

# 1.场景说明

当EB表单提交数据时，更新另一张EB表单。

如在【采购管理】应用，在到货验收列表中通过"签收"按钮将发货通知列表中的发货状态更改为已签收（"到货验收"表单和"发货通知"表单中都存在"采购订单"字段，通过此字段可以关联上采购订单）。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e3afb45540726830d3688bf373560749.jpg)

#

# 2. 功能简介

在ESB中心创建触发事件与操作或创建"表单提交时更新另一张表单数据"动作流模板，通过动作流设置达到跨表单批量更新数据的预期效果。

# 3. 操作说明

1.在到货验收表单页面点击右上角后台管理。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8f223ede63858fd1ada702f05a7ebfe2.jpg)

2.进入后台管理页面，点击按钮功能页右上角新建。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6681f01de9f90d481dbd7560a30ea781.jpg)

3.（1）在创建按钮基本信息部分输入按钮名称并设置显示位置；（2）完成按钮权限设置并点击保存。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0077e22480221dabe9aef6ed1df26659.jpg)

4.进入动作流页面点击右上角新建动作流。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/96d0a7da1040636d5c98befb4974d629.jpg)

5.（1）点击"添加触发事件"，搜索选择"点击按钮时"触发事件。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2006af3069fad4cc709372e96f5568c4.jpg)

添加完成触发事件，点击下方"添加操作"，搜索选择"修改表单数据"。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b549b07c5589a9a7ceb075142c5f421a.jpg)

（2）以上操作也可以在动作流模板创建页中选择第二项"表单提交数据时更新另一张表单数据"达到同样效果。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e009ddd512b4e985603009f1bba10de0.jpg)

6.在选择应用项选择本次展示使用的采购管理，选择表单项选择到货验收，选择按钮项添加之前新建的"签收"按钮，触发类型选择默认的依次触发。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1e367d999d038aa92b979ef7cd0146ea.jpg)

7.在修改表单数据中操作人选择动态赋值为创建者，类型项选择按条件更新，并设置触发条件。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0ab4dda7b2387ca27fb0dccb4e040c5b.jpg)

在条件筛选器中添加"发货状态"等于"待签收"，添加两张表单的eb关联字段"采购订单"等于"采购订单"。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7f68eec185eb79f011fc988db8acb4f8.jpg)

8.点击设置表单数据，关闭发货状态的原值勾选并选择固定值已签收。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/60062bfcb9740f0e50d47923271e15e3.jpg)

9.点击右上方保存并启用按钮，输入动作流名称。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fa4ac9b94c0c980450d57946c489988a.jpg)

10.启用之前新建的"签收"按钮，点击"签收"按钮可以查看新增的动作流。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0d4c57bbfcdc81b72925bf2d9ed44a82.jpg)

