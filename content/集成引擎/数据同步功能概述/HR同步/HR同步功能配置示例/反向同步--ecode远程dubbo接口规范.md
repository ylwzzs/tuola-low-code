---
aliases: ["1972048990093136397"]
title: 反向同步--ecode远程dubbo接口规范
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

说明：

反向同步是指手动、自动周期性的或者实时的将E10人事数据从第三方系统，当现有同步方式（如数据库、ESB动作流）无法满足同步需求时，需要自己开发代码满足具体需求，HR同步可以实现直接调用二开实现的 dubbo 接口，二开的dubbo接口可通过ecode发布，无需上传代码至系统标准服务。

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

1. 集成中心-HR同步-点击新建-从空白新建-集成方式选择Ecode反向同步

![](5711756d0d0c761f1b309fe901d68acf.jpg)

2. 数据目标选择ecode反向同步，数据来源选择HRM反向分部、部门、岗位、人员【同步那些数据根据实际而定】

![](01ae7aa04cd816b496b40ae7448b92fc.jpg)

3. 接口参数填写发布的dubbo接口的groupId分组标识以及版本号

点击下一步时会调用test方法测试是否通过，若不通过展示接口返回的异常信息

![](521b05673e9e950ea374481fdc2fa34e.jpg)

4. 点击下一步-映射与过滤-字段映射填写对应的映射关系，来源字段列表调用getSourceDataField方法获取

![](ebb96181684955e54812043428da7f72.jpg)

5. HR同步中执行同步，调用ecode 接口Page方法进行同步