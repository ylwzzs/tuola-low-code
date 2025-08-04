---
aliases: ["1972120304667637132"]
title: 流程明细数据转EB数据，然后将EB的数据ID回写到流程对应的明细上
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

## **需求功能描述：**

提交流程时，需要将流程的明细数据转成EB数据，且将EB的数据ID回写到对应的流程明细字段上

## **配置方案**一**：**

流程触发组件+新建表单数据+流程保存组件进行配置；

新建表单数据组件：选择批量新增，依据值选择流程的明细表（EB的表单数据中需要加个字段存流程的明细rowid）

流程保存组件：对流程的明细表进行更新，依据值选择新建表单组件的上下文最上级，更新条件选择按明细数据ID，利用新建表单数据组件中存放流程明细rowid的字段作为条件配置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/eaac37bc4c57aa82b77715ece16998b7.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/98847b47982b2eee8c89dc7cedf9c936.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3435a98b38967fb8a8c836a278e01ffc.jpg)

**实现效果：**

**![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/dc94ebd3c892439f7c9c74e3465bee60.jpg)**

## **配置方案**二**：**

流程触发组件+循环+新建表单数据+流程保存组件进行配置；

循环组件：利用指定数据，选择流程的明细表去循环

新建表单数据组件：新增方式选择新增单条数据（该方案不需要EB的表单数据中加存流程的明细rowid字段）

流程保存组件：对流程的明细表进行更新，依据值选择循环里面的数据，更新条件选择按明细数据ID，利用依据值下级rowid作为条件进行更新，数据ID来源于新建表单数据组件上下文的数据ID即可

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6b508593af68ab6175a649f706c0b523.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4e2308f3504df04d77a7416707415ec3.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5f42ae15043b20911cd0dfb81759c54d.jpg)

实现效果：

