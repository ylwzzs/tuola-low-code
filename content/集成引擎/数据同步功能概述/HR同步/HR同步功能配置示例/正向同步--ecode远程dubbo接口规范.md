---
aliases: ["1972048984988736393"]
title: 正向同步--ecode远程dubbo接口规范
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

说明:

正向同步是指手动或者自动周期性执行的从第三方系统获取人事数据同步至当前系统，当现有同步方式（如数据库、ESB动作流）无法满足同步需求时，需要自己开发代码满足具体需求，HR同步可以实现直接调用二开实现的 dubbo 接口，二开的dubbo接口可通过ecode发布，无需上传代码至系统标准服务。

一、ecode中按照规范开发dubbo接口

在ecode二开项目中，需要实现如下接口以及方法

接口：com.weaver.intcenter.hr.dataInterface.source.RPCSourceDataInterface

例如如需同步分部、部门、人员，则需要开发三个接口，分别于获取分部、部门、人员数据

开发后将jar包上传至ecode二开服务中，并发布dubbo接口

|  |  |  |  |
| --- | --- | --- | --- |
| 方法名 | 入参 | 返回值 | 说明 |
| com.weaver.intcenter.hr.dataInterface.source.RPCSourceDataInterface#getSourceDataField |  | 接口返回字段列表 | 获取接口字段列表接口，用于设置字段映射，作用于【功能点1】截图 |
| com.weaver.intcenter.hr.dataInterface.source.RPCSourceDataInterface#page | 1. IPage> page 分页查询DTO  2. Map context 上下文信息 | com.weaver.intcenter.hr.dataInterface.pagination.IPage#setRecords写入实际数据返回值 | 分页获取数据 |
| com.weaver.intcenter.hr.dataInterface.source.RPCSourceDataInterface#test |  | 返回示例：  //return WeaResult.success(null);  //return WeaResult.fail("模拟失败场景",true); | 测试接口，可以编写测试逻辑用于验证和第三方系统网络是否正常等信息，返回错误信息作用于【功能点2】截图 |

二、配置HR同步

1. 集成中心-HR同步-点击新建-从空白新建-集成方式选择Ecode正向同步

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/88d456e78cd640c485aafaf41d2018e0.jpg)

2. 数据来源选择ecode正向同步，数据目标选同步分部、部门、岗位、人员【根据实际需要配置，例如只同步分部也可以】

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/cb7404fa9b6e69e75d885735fad365f6.jpg)

3. 接口参数填写发布的dubbo接口的groupId分组标识以及版本号

点击下一步时会调用test方法测试是否通过，若不通过展示接口返回的异常信息

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bf3fd969a4bb5abd65347b696a90418b.jpg)

4. 点击下一步-映射与过滤-字段映射填写对应的映射关系，来源字段列表调用getSourceDataField方法获取

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e83b26b7eb2ad7b3323faa09760deaba.jpg)

