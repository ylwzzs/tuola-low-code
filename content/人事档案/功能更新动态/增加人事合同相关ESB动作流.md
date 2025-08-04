---
aliases: ["1973941312282160106"]
title: 增加人事合同相关ESB动作流
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 人事档案
---

新增人事合同相关ESB执行组件，支持通过ESB新建或更新人事合同相关数据。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c52629222cf35df3c3d99c743b59c44f.jpg)

1、新增人事合同：新建人员人事合同的数据，支持主表字段、明细表字段。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/221907940f1f5d3a22bb44ef03722116.jpg)

当进行明细表字段映射时，赋值字段类型需选择“依据值”下级。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/704f61ba326dc39c7bc3339eb6409173.jpg)

2、更新人事合同：更新人员人事合同信息。

更新人事合同与新增人事合同主表字段对应基本相似，可根据用户自身需求设置原值或动态赋值。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/883a70cb9417b7db0aa5da244486b2a0.jpg)

其中不同点在于明细表对应，更新人事合同明细表可选择默认、追加、更新、更新（追加）、覆盖。明细表赋值字段对应时，推荐选择依据值下级。

操作类型：【默认】代表不更新；【追加】代表将流程表单中的数据直接追加到卡片对应明细中；【更新】代表根据更新条件找到对应数据并进行更新；【更新（追加）】代表根据更新条件找到对应数据进行更新，没找到的数据，直接新增；【覆盖】代表忽略卡片原有的数据，直接替换为流程明细表单中的数据。

