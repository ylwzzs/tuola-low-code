---
aliases: ["1968715967578348542"]
title: 不通过数据ID打开表单显示布局
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

如何通过不使用数据id的情况下也可以打开对应数据的显示布局页面。

![](362e7a6564af1a202ef1f66fddc081e6.jpg)

**解决方式：**

第一步：设置字段打开动作，链接地址放固定地址：/sp/ebdfpage/formmode/view/convertPage?objId=表单id&pkfield=rkdh；此处链接地址为固定地址。直接粘贴复制即可，需要手动修改的是objid 、pkfield ，如图1；

如何获取表单objid，如图2；

如何获取pkfield，如图3；

图1![](4e9d7841e05a582c6e8e7ca31b971268.jpg)

图2

![](373929ad696d7b6804be0f4db9765f9f.jpg)

图3

![](a977b480143f7359a7681e8cd51c6371.jpg)

第二步：设置参数；左侧参数名称为固定值：pkvalue ；右侧参数值可选择表单字段；

**pkvalue和pkfield必须对应的是同一个字段。**

![](418c8d8fe6a28f46f7e133f16316e112.jpg)

第三步：配置完成即可保存查看效果

![](d9e991a6b3b254430d3d95c2aa5b6e3c.jpg)