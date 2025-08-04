---
aliases: ["1973398973550609310"]
title: 通过动作流创建IM群聊并发送消息
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

**1.** **编写目的**

IM不仅可以进行简单的聊天，也能够与E10各个模块深度联动，快速沟通处理各类工作事宜。例如在风险流程处理场景中，用户提交风险流程，下一节点处理人员如果超时1天未处理，则自动发送IM消息进行提醒；如果超时2天未处理，则自动拉取相关员工，创建IM群聊，进行风险事项的沟通交流。

展示效果如下图所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4f28270893937d093da7077aafa419ab.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6cd01f84450f4c49d96e41d1aabbedf9.jpg)

**2.** **思路分析**

对于上述场景，首先搭建eb表单及其对应的eb流程。之后新建一个动作流，按日期字段触发，取风险流程的提交时间；当提交时间超时1天时，添加执行动作-发送IM消息，发送给风险处理人员进行提醒。再新建一个动作流，同样的触发方式，当超时2天时，添加执行动作-新建IM群聊，再添加动作-发送IM群聊，将风险信息发送到新创建的群聊中，供大家讨论交流。

**3.** **操作说明**

**3.1**搭建风险信息表单及流程**

用户可根据实际场景搭建风险信息表，表单中包含风险信息与处理信息两部分，其中风险状态为下拉框字段（待处理、处理中、已处理、搁置），只有待处理状态的风险信息，超时后才会发送IM消息：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9bde681a1b1084164ac7ead6a20a9b8d.jpg)

在风险提交时，用户选择对应的模块（关联eb字段，关联模块处理人员表），通过关联表字段自动带出处理人员，作为下一节点的操作者：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0d054051208de254c5b840fcbc4887d0.jpg)

风险信息表单搭建完成后，依据实际场景搭建风险处理流程，设置流程的操作节点信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d996e41235a3bbe1bb1357bbd2b2d822.jpg)

**3.2**动作流一：超时1天发送IM消息提醒**

新建一个动作流，由于我们需要利用表单中的“发现日期”字段作为判断依据，因此触发动作选择：定时或指定时间触发-按日期字段触发，选择对应的表单以及过滤条件等信息。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2eb503b8013997ee56b52acd7b210c88.jpg)

添加触发动作，系统各个标准模块提供的事件动作，放在连接器（应用）tab页中，添加发送IM消息动作：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b7a67283049a8a49514a9eb24ca03127.jpg)

由于我们打开的是eb流程，此时可以选择eb模块，配置流程对应的表单，然后用数据id对应即可，详细配置及说明如下：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/71465ed1d231eef7fe8dd87fda732554.jpg)

消息标题可以采用固定值与动态值相结合的效果：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/737c54e0109214c515a78ec6c65cf32b.jpg)

**3.3**动作流二：超时2天创建IM事项群聊**

上文中是超时一天发送消息提醒，当超时两天未处理时，可以通过动作流创建一个事项群聊，将相关人员拉进群中进行讨论。

首先再新建一个动作流，触发方式与3.1相同，只是将延迟1天改为2天：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6757966b9fce60edd1875c11f8f30cde.jpg)

之后添加动作，新建IM群组，此时群聊类型有三种：

1. 普通类型：就是常见的群聊类型，无特殊之处；

2. 话题群聊：围绕某个话题展开，新建后话题状态为“讨论中”，当管理员将话题状态变为“已结束”后，用户无法在发言：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9d0720f268e6c565aaa464509a5e05ef.jpg)

3. 事项群聊：围绕某一模块的某个事项展开，例如本场景中，围绕eb模块的一条风险信息流程。事项群聊创建后有模块标识，点击可打开具体的详情：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/44991853e361f4f6e22e1d4146114394.jpg)

详细配置如下：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e7d7a7b5ccbec6c418a97134dd00da87.jpg)

注意：一个事项只能建一个群（除非前一个事项群解散），因此在配置动作流的时候，请勿重复建群，导致动作流报错：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5fa029f7a17a85fed9ba540a8ea9b03d.jpg)

配置完成后，可以再添加一个动作：发送IM群聊，发送一条消息卡片到刚才创建的群聊中：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/de3a9f12ec0686f8cbd9b4f6ad02dffb.jpg)

展示效果如下：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/efca2c3f23cc2152104ce705ba2d5e05.jpg)

**3.4**拓展：设置IM群聊**

上述场景涵盖了IM动作流当中的前三个组件，最后还有一个组件“设置IM群聊”，当用户获取到群id之后，可以对群的详细情况进行设置，此时需要注意两点：

1.部分用户添加这个组件之后，弹出暂无权限：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/dc423c4ca2f7980e8c6afddb282f4601.jpg)

请在后台管理中心，权限管理中，为自己添加上工作消息中的功能设置权限：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/53880a8ad43abea798cb3061394762c2.jpg)

2.在配置过程中，操作者必须是该群的群主或者群管理员才可以：

