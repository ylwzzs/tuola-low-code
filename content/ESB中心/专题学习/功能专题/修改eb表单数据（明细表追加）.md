---
aliases: ["1967818675534131998"]
title: 修改eb表单数据（明细表追加）
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

# 1. 场景说明

在EB表单勾选多条数据，当点击按钮时，数据批量插入另一张表单的明细子表中。

如在【表单录入明细表】表单勾选数据点击“写入明细”按钮，就能将表单的数据批量插入到【明细数据汇总表】表单对应的明细子表中。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/600d37e13c89a1e49ba1391f238b2578.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/348399495f6919b983e93960bfc42ace.jpg)

# 2. 功能简介

在表单动作流部分创建触发事件与操作或创建"表单提交时更新另一张表单数据"动作流模板，通过动作流设置达到表单数据批量插入明细表的预期效果。

# 3. 操作说明

1.在表单录入明细表表单页面点击右上角后台管理。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ccef7e19ff70b623e129d007943411de.jpg)

2.进入后台管理页面，点击按钮功能页右上角新建。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3bfc2894bd09fea3518e0c9da4bd5d00.jpg)

3.（1）在创建按钮基本信息部分输入按钮名称并设置显示位置；（2）完成按钮权限设置并点击保存。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/df15dc113ceb6a99ab2cb2aa98bbcacd.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/781063714c22ddd8b4d584c00ae3ca97.jpg)

4.进入动作流页面点击右上角新建动作流。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/48637827de0f333891571a9cf204a603.jpg)

5.（1）点击"添加触发事件"，搜索选择"点击按钮时"触发事件。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/645bb13ba56c5e96308af1f61463b4c1.jpg)

添加完成触发事件，点击下方"添加操作"，搜索选择"修改表单数据"。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/08362e4900574a7d63608f9b6575f924.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0ab2d55fddbe5ca196fa27221279baf0.jpg)

（2）以上操作也可以在动作流模板创建页中选择第二项"表单提交数据时更新另一张表单数据"达到同样效果。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/63db3c113596eb3ea5bce9a7da44aa96.jpg)

6.在选择应用项选择本次展示使用的动作流写入明细，选择表单项选择表单录入明细表，选择按钮项添加之前新建的"写入明细"按钮，触发类型选择默认的依次触发。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/40be943a3b1ee1930d05860a7d632e0d.jpg)

7.在修改表单数据中操作人选择动态赋值为系统参数中的当前用户ID，类型项选择按数据ID更新，并设置数据ID。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ee68377822586aae151d55088bef731a.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f38d25dd27080ce5bc5a18d1df022c21.jpg)

点击添加设置数据ID，设置数据ID为表单录入明细表中的EB关联字段“编号”。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1dddad70fe6777b11d2efe50caf7ff3b.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/79f77fb2e936292fe0714432e460ef9a.jpg)

8.点击设置表单数据，对应的明细表部分操作类型选择追加并设置依据值。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/de433fe75bb5978517327f87f97550e5.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/08865d2a1ef4a91750aee68fd86fdc5f.jpg)

根据业务需求选择相应的主表/明细表为依据值，类型选择依据值下级并设置对应数值。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/74e69d2dbaf74469a4b98228328d29d4.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a704a99bf1b917bc5c6ad15bfe5e824f.jpg)

9.点击右上方保存并启用按钮，输入动作流名称。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/620477bc38f5437c1a60d23d74d21278.jpg)

10.启用之前新建的"写入明细"按钮，点击"写入明细"按钮可以查看新增的动作流。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f53bcef0e05035acbaf281d5f0f5f466.jpg)

配置效果展示：![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/20ef259e0dbd51f7a37e2a2d092c9eba.jpg)

