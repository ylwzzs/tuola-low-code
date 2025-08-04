---
aliases: ["1971021547322414778"]
title: 配置ESB动作流实现批量操作
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

以下为E10配置ESB动作流实现批量操作的操作步骤：

**配置连接器**

1. 点击新建连接器

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/dec21ab2cdec72e5e2b2d9e4f00392c0.jpg)

2. 填写对应的连接器信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/76e0df236984005424b19385ac65a286.jpg)

3. 新建连接信息，要根据第三方提供的批量接口进行确定。

【协议】、【域名/IP地址】、【编码】需要第三方提供，其他配置项可以根据需要自行确定。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4e3cb115e85d8ef63437088f55f8eef6.jpg)

4. 新建接口信息

（1）基础

【接口地址】、【请求方式】需要第三方提供，其他配置按需填写

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fde539096bd8d06407e2a68ae676647f.jpg)

（2）请求

根据第三方提供的接口信息进行配置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/aca86dcca483dfbc29f50caf3ae603d4.jpg)

打开“明细数据”开关后，推送给第三方的数据是数组的格式

示例：

|  |
| --- |
| [  {  "sysCode": "dntest1",  "receiver": "15166752550",  "operateType": "SUBMIT",  "flowId": "ewdn55555555555555",  "taskId": "ewdn55555555555555\_2227495622798760670"  },  {  "sysCode": "dntest1",  "receiver": "15166752550",  "operateType": "SUBMIT",  "flowId": "ewdn5555555555555",  "taskId": "ewdn5555555555555\_2227495622798760670"  }  ] |

（3）响应

根据第三方提供的接口信息进行配置。如果返回的值包含数组的格式，“参数类型”需要选中“JSON”数组开关打开。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2b9163b79643a078f373c5182021e25f.jpg)

（4）成功失败

根据第三方提供的接口信息进行配置。需要第三方提供一个字段，用户确定接口整体调用情况（成功/失败）

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e2cbef617375d82dc54caa9cd9256da1.jpg)

**配置动作流**

1. 新建动作流

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0be0852664fc934f2bbeedf9942d255d.jpg)

2. 添加触发事件

（1）选择“自定义事件触发”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c0eb08eb8f5d55afea5a4ce6adcd7850.jpg)（2）选择“内置MQ监听”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bdb0137a92c41d2c694a152ddbccdb57.jpg)（3）填写“队列名称”，该名称可以自定义要保证全局唯一性。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/02ae0f2cb49581ff6659bc2e1b3ca725.jpg)

注意：此处的队列名称与异构系统中的配置相同

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9f59851bc599a41e0fe1f2d48c63a4ba.jpg)

（4）配置“接收参数”，此配置为固定配置参数名称不可变更。参数名称见下表

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5e6763d5bcffc731eb3d831d7cb40567.jpg)

|  |  |  |  |
| --- | --- | --- | --- |
| 参数名称 | 显示名称 | 参数类型 | 备注 |
| todoData | 流程数据列表，是数组的形式 | JSON | 1. 数据类型为“节点”；  2. 数组类型开关要打开； |
| sysCode | 异构系统标识 | 文本 |  |
| flowId | 第三方流程ID | 文本 | 第三方调用统一待办接口推送过来的流程id |
| requestName | 流程标题 | 文本 |  |
| workFlowName | 流程类型名称 | 文本 |  |
| receiverNodeName | 接收人节点名称 | 文本 |  |
| nodeName | 流程节点名称 | 文本 |  |
| pcUrl | Pc端跳转地址 | 文本 |  |
| appUrl | APP端跳转地址 | 文本 |  |
| creator | 创建人 | 文本 |  |
| createDateTime | 创建时间 | 文本 |  |
| receiver | 接收人 | 文本 | 与人员转换规则匹配 |
| receiveDateTime | 接收时间 | 文本 |  |
| isRemark | 流程处理状态 | 文本 | 0：待办 2：已办 4：办结 8：抄送（待阅） 10：待领取 -1：删除 |
| viewType | 流程查看状态 | 文本 | 0：未读； 1：已读; |
| receivets | 时间戳 | 文本 | 示例：1602817491990（毫秒级时间戳） |
| workFlowCode | 流程类型码 | 文本 |  |
| tenantKey | 住户信息 | 文本 |  |
| requestLevel | 紧急程度 | 文本 |  |
| operateType | 批量操作类型 | 文本 | 操作类型，枚举值：  SUBMIT（批量提交）  RETURNED(批量退回)  ACQUIRE（批量领取） |
| taskId | 审批任务ID | 文本 |  |

3. 添加连接器

（1）选择刚才配置的连接器，以及对应的接口

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/862bdded28c2d6acbab8db1020186f01.jpg)

（2）点击“输入参数配置”，“依据值”中选择“todoData”固定值

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1d0c98e44a3a9fa6de0a2c09f408db16.jpg)

（3）匹配第三方接口入参字段

动态赋值选择【依据值下级】，并根据下拉框选择对应的参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/acf937cb31e07c7f13cda36a2fb1bcbf.jpg)

（4）配置“异常处理”，选择“跳过当前节点”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4e5c11dcf5141dc5efcde29ecf336a21.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fc9070aa728f8c4c2b0e637220a65f38.jpg)

4. 配置分支

（1）选择“分支”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/68c8e016654d4dbfa94b43963c1beb0c.jpg)

（2）【执行方式】选择“排它分支”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a43e57cb7fe5316fdcfd06b3d50dcf0f.jpg)

（3）添加配置条件，第三方接口返回报文中需要提供一个字段，可以根据该字段的值进行判断接口是否调用成功。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c703de77d0152a76b6bd64e72b1e746c.jpg)

5. 添加响应操作

（1）两个分支中均需要选择“内置MQ发送”

（2）“队列名称”填写**固定值“esb-iL3Ei”该值不可更改**。“模式”选择“广播模式”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4c1966cd0e41d0a33230233b8cd50b5b.jpg)

（3）“条件1”表示接口调用成功的情况，其中“发送参数”需要配置。此处配置的**“参数名称”为固定值**不可更改。参数名称见下表

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/92ae04fb5e576607964fad1267cbab75.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/56cc022114a2f8fff978d00ea5963b53.jpg)

注：tenantKey：当前租户识别码（以具体租户确定）

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/34f991e4250f5d0134b500542ab3fc22.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1123b417f1935f721627c196f4226230.jpg)

|  |  |  |  |
| --- | --- | --- | --- |
| 参数名称 | 显示名称 | 参数类型 | 备注 |
| code | 接口响应码 | 文本 | 200 表示调用成功，其他均表示失败 |
| msg | 响应信息 | 文本 |  |
| status | 接口状态标识 | 文本 | 枚举值  true：成功；  false：失败； |
| tenantKey | 租户信息 | 文本 | 固定值：取当前租户识别码 |
| data | 流程数据列表 | JSON | 数组类型 |

data：

|  |  |  |  |
| --- | --- | --- | --- |
| 参数名称 | 显示名称 | 参数类型 | 备注 |
| sysCode | 异构系统标识 | 文本 |  |
| flowId | 第三方流程ID | 文本 |  |
| receiver | 接收人 | 文本 |  |
| taskId | 审批任务ID | 文本 |  |
| status | 操作状态 | 文本 | 枚举值  true：成功；  false：失败； |

（4）“其他条件”分支下是表示失败的情况，“发送参数”中的“参数名称”与条件1的相同均为固定值不可更改。其中赋值参数有区别。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e08c3eeff6ec89f1d53aa058e0cf7f2f.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f4e9d856ac34da8408d31e3317e0bf59.jpg)

注：tenantKey：当前租户识别码（以具体租户确定）

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/24731d078016bceb7f14b7a7b18dd52e.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fd7802702585e8bb60b026cd5e9a89f6.jpg)

|  |  |  |  |
| --- | --- | --- | --- |
| 参数名称 | 显示名称 | 参数类型 | 备注 |
| code | 接口响应码 | 文本 | 固定值：400 |
| msg | 响应信息 | 文本 | 固定值：调用第三方接口失败 |
| status | 接口状态标识 | 文本 | 固定值：false |
| tenantKey | 租户信息 | 文本 | 固定值：取当前租户识别码 |
| data | 流程数据列表 | JSON | 动态赋值，数组类型，从“内置MQ监听”事件中获取 |

data：

|  |  |  |  |
| --- | --- | --- | --- |
| 参数名称 | 显示名称 | 参数类型 | 备注 |
| sysCode | 异构系统标识 | 文本 | 依据值 |
| flowId | 第三方流程ID | 文本 | 依据值 |
| receiver | 接收人 | 文本 | 依据值 |
| taskId | 审批任务ID | 文本 | 依据值 |
| status | 操作状态 | 文本 | 固定值：false |

**应用系统配置**

开启：支持批量操作

指定批量操作ESB队列名称

