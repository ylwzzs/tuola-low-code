---
aliases: ["1967713159082965279"]
title: 档案集成支持通过ESB动作流实时同步来源数据
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

【集成中心--档案集成--动作流】或【ESB--动作流】中新建，选择触发时间类型为“流程触发”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bb75c0057edbdc626e7f39e7d7cd4883.jpg)

根据实际需要选择“选择工作流”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a1b34f4f32405d190df84d1ca4a63de9.jpg)

根据需要设置归档导出的时机

注意：如流程路径有四个节点：创建、提交、批准、结束，设置为批准节点前执行附加操作，即只能获取到创建节点表单数据及签字意见数据，**提交节点表单数据【无签字意见数据】**，流程流转至结束节点，在档案集成-归档日志中**重新手动归档此流程**，因为获取的数据节点不一样，**导出的数据可能存在差异**

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2a525b5324185436574cf00802bb9a6b.jpg)

选择“内置”中“**serverless/Action**”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2a60524378706bbc8513ddb24c0b4d30.jpg)

|  |  |
| --- | --- |
| 跨服务执行 | 开启 |
| 分组标识【请复制粘贴】 | intias\_wf |
| 版本号【请复制粘贴】 | 1.0 |

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6181a93af080b6070300fd56093d45dc.jpg)

填写“输入参数”请复制粘贴

|  |  |  |  |
| --- | --- | --- | --- |
| **参数名称** | **显示名称** | **参数类型** | **说明** |
| workflowId | 工作流ID | 文本 | 必须配置 |
| requestId | 流程请求标识 | 文本 | 必须配置 |
| creatorId | 流程创建人ID | 文本 | 必须配置 |
| channelIds | 归档方案ID | 文本 | 未配置此参数或值为空，集成中心-档案集成-归档方案设置中所有以此流程路径配置的方案逐个归档； 配置某个归档方案ID，即仅归档所配置方案ID，多个方案以英文逗号隔开示例["831746869586460686","830697806837481486"] |

配置后：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/80b1e07e49f0fbc47ac6a543d078c0ca.jpg)

工作流ID：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e68f102eb5ff1cbc90b193e3b927f38a.jpg)

流程请求标识：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d3a77d45a43699cf11e08d4250861b0d.jpg)

流程创建人ID：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9a496e56b85607c19ea0620f2b12a394.jpg)

归档方案ID：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/23d98428131aab95b585630e1fea1b5f.jpg)

配置“输出参数”请复制粘贴：

|  |  |  |
| --- | --- | --- |
| **参数名称** | **显示名称** | **参数类型** |
| code | 状态码 | 文本 |
| msg | 提示信息 | 文本 |
| status | 状态 | 布尔型 |
| data | 数据 | 布尔型 |

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c6dac46ed4b4a9fd5d8a06adee2bd77d.jpg)

添加“分支”：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/79fe4b06627ec1d21026b32543ffda7f.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3922237346fe735da1817365af01c086.jpg)

“条件1”中“条件设置”，选择组件“内置：**serverless/Action**”，“选择参数”“响应参数”“状态”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7b00fde66d5a261ef0399bf8a24f5dd2.jpg)

选择“是”后添加：、![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f9e18e50345f2b3a3b7941aafc3000a9.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/408166da4fcb0dcbdf68d4589547b514.jpg)

“其他条件”选择“输出组件”：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f975a03ddbbb0a409d73fcbca827728e.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/44e43aa0f12781d75d32e516b808c96b.jpg)

状态选择“失败”，提醒内容选择“错误”“动态赋值”“提示信息”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/27950d3e2a3399c817f1c3920d75e1e2.jpg)

保存并启用，动作流命名：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7f84e83f549bc06d314707ea77ad6f7b.jpg)

