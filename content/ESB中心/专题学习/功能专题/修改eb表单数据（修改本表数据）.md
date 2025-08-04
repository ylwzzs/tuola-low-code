---
aliases: ["1967818652101431994"]
title: 修改eb表单数据（修改本表数据）
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

# 1. 场景说明

当点击EB表单的按钮时，更新或批量更新本表单的数据。

如在【采购管理】应用，发货通知列表中通过右侧"入库"按钮将发货状态更改为已入库，也可通过右上角"入库"按钮批量将所选中数据的发货状态更改为已入库。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3eaad897054b7f50aaf3232656db2fc6.jpg)

# 2. 功能简介

在ESB中心创建触发事件与操作或创建"表单提交时更新另一张表单数据"动作流模板，通过动作流设置达到预期效果。

# 3. 操作说明

1.在发货通知表单页面点击右上角后台管理。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f59fea2aa64c0ed178e21dd79b0b648d.jpg)

2.进入后台管理页面，点击按钮功能页右上角新建。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/25feeb4401844d2688537e59b2bf5f5b.jpg)

3.（1）在创建按钮基本信息部分输入按钮名称并设置显示位置；（2）完成按钮权限设置并点击保存。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a7d53407b2ae87168d907a22e233a37d.jpg)

4.进入动作流页面点击右上角新建动作流。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b19b5feae206b911b1a2d96a1de4dd95.jpg)

5.（1）点击"添加触发事件"，搜索选择"点击按钮时"触发事件。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b39f473a139100240a6ed4beb5a8f17b.jpg)

添加完成触发事件，点击下方"添加操作"，搜索选择"修改表单数据"。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0ebe07c84e0684a7520ad479bea467c3.jpg)

（2）以上操作也可以在动作流模板创建页中选择第二项"表单提交数据时更新另一张表单数据"达到同样效果。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/000ea00f0d9fb6a59d574a8ca100560a.jpg)

6.在选择应用项选择本次展示使用的采购管理，选择表单项选择发货通知，选择按钮项添加之前新建的"入库"按钮，触发类型选择默认的依次触发。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c595eddd736296444c3e3bc243fecc24.jpg)

7.在修改表单数据中操作人与数据ID项选择动态赋值，操作人为创建者，数据ID为数据ID，类型选择按数据ID更新（本表单内提交数据若不需要设置条件，类型通常选择按数据ID更新）。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4d2e6fe46d7f50195fb6216d2758e353.jpg)

8.点击设置表单数据，关闭发货状态的原值勾选并选择固定值已入库。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/51b1aaca8ee7c6c2385d2361247868c2.jpg)

9.点击右上方保存并启用按钮，输入动作流名称。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0e6fada76c69de66fc478c774323970d.jpg)

10.启用之前新建的"入库"按钮，点击"入库"按钮可以查看新增的动作流。![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d248867e45b845a8745b2f53fa0a5dc5.jpg)

