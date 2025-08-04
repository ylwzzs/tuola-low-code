---
aliases: ["1963695863904158889"]
title: HR同步
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

## •[[#概述|概述]]

## •[[#功能入口|功能入口]]

## •[[#注册数据源|注册数据源]]

## •[[#数据接口库|数据接口库]]

## •[[#动作流|动作流]]

## •[[#数据过滤规则库|数据过滤规则库]]

## •[[#转换规则库|转换规则库]]

## •[[#函数库|函数库]]

## •[[#同步设置|同步设置]]

## •[[#同步日志管理|同步日志管理]]

**概述**

同步外部数据中数据到OA, 数据来源可以是接口, 可以是数据源，可以是套件方式，目前已支持反向同步功能。

**功能入口**

【后台管理中心】-【集成中心】-【HR同步】

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1884cc2e5fa8bf5a2472fb46aaedaa43.jpg)

入口权限:

|  |  |  |
| --- | --- | --- |
| **权限名称** | **位置** | **权限内容** |
| HR同步 | 权限管理中心-集成中心-HR同步 | 同步设置、数据接口库、动作流、转换规则库、同步日志管理相关权限 |

**注册数据源**

【后台管理中心】-【平台引擎】-【数据源】（地址：https://域名/sp/datasource/connection）

新建数据连接：![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ea66646284d9a47b028f8b5dda1c2f7f.jpg)

**数据接口库**

进入HR同步数据接口库，可默认带出所有接口库

提供提供33个数据接口库，包含22个数据来源接口，11个数据目标接口(分部 部门 岗位 人员 兼职信息)

其中数据来源接口是用来连接外部数据库和数据源的, 数据目标接口是用来同步OA的组织架构表

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e806009558bfd009444085c15f2610c6.jpg)

新建需要填写必填信息, 设置接口类型（数据目标/数据来源），目前数据来源支持数据库连接、数据源连接

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f8b825258b81845481404d31fadd3e4f.jpg)

**动作流**

前端调用ESB中心提供的组件展示动作流，增加后端接口用来获取到HR同步相关的触发组件标识，传参给ESB中心展示HR同步相关动作流

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d0aee59a12767518da75e90dc835f91f.jpg)

**数据过滤规则库**

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c3d1e36931512802fae66f26cfce8783.jpg)

HR同步新增【数据过滤规则库】相关菜单,菜单内展示 HR同步 的所有相关数据，在同步设置的映射与过滤处配置过滤规则,对满足过滤条件的数据不进行同步（支持正向同步、反向同步）

详细内容请见[[什么是数据过滤规则|《帮助中心-数据过滤规则库》]]

**转换规则库**

对于外部的数据, 可能和OA的数据类型不对应, 需要做转换或者需要给固定值或者是进行字符串拼接等, 此时需要配置转换规则

提供了9个系统级别和9个用户级别的转换规则可供使用,系统级别的无需注册,可直接选择使用

系统级别:

1)人员性别转换|0=男|1=女; (备注:性别转换,将0转换为男，1转换为女)

2)人员状态转换-E9;

(备注:E9同步到E10人员状态转换：E9：0：试用 1：正式;2：临时;3：试用延期;4：解聘;5：离职;6：退休;7：无效 E10: 1：试用 2：试用延期 3：正式;4：临时;5：实习 6：离职;7：退休)

3)人员状态转换-bs;(备注:bs套件方式用)

4)固定值;(备注:固定值0)

5)千里聆人员性别转换|0=男|1=女;(备注:千里聆性别转换,将男转换为0，女转换为1;千里聆套件反向同步使用)

6)HR岗位转换规则;(备注:用于转换oa中的岗位id为名称)

7)HR分部/部门名称转换规则;(备注:用于转换oa中的分部/部门id为名称)

8)携程-人员性别转换;(备注:将系统人员性别转换为携程人员性别)(备注:同步携程用)

9)携程-人员状态转换;(备注:将系统人员状态转换为携程人员状态)(备注:同步携程用)

剩余详细内容请见[[什么是转换规则|《帮助中心-转换规则库》]]

**函数库**

函数库内展示HR同步的所有相关数据

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1f7f9354f737a4946f92012f002eb493.jpg)

页面可新建公式及自定义函数,新建的数据会展示在列表里,HR同步选择函数公式时,可选到相对应的函数公式设置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/250c6bf1e49e2013783a545bc7724552.jpg)

**同步设置**

1、基础设置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/cf53762a85d79a178f07943ca9f8c022.jpg)

名称：随意，但不可重复，必填文本框。不能是纯数字，支持设置多语种

集成方式：

正向：数据源、E9套件(数据源)、E9套件(API)、ESB、E10套件、bs套件

反向：ESB反向同步、千里聆套件

所属机构：可选择任意分部、部门（开启分权后显示）

同步设置：

启用：控制功能是否启用

同步方式：包括手动同步和自动同步

a.手动同步：需要配置完成后手动在第五步点击同步

b.自动同步：选择自动同步, 显示corn表达式, 根据配置的频率进行同步(需要注意: 当前表达式暂不支持秒级别的配置)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2d3d760fd2ccc0e48551aaf4bdd7a929.jpg)

同步频率：默认值为0 0 1 \* \* ? 表示每天凌晨一点自动执行同步; 点击【设置】按钮出现设置窗，设置完成后，需点击【确定】按钮

注意：

**如果客户环境是私有化部署，需要在【系统管理】-【任务调度中心】-【回调管理】处新增配置（只需配置一次即可）**![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bcf5d31f75639cec28f88f128c8cfeb4.jpg)**

1）控制自动同步

模块: ic\_hr

方法: sync

回调地址：https://域名/papi/intcenterlhr/sync

2）控制定时清理日志

模块: ic\_hr

方法: cleanlog

回调地址：https://域名/papi/intcenterlhr/sync/cleanlog

2、同步设置（以数据源方式为例）

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/824e0c42af6f529dee06d84339c605fb.jpg)

选择需要同步的数据来源和数据目标, 如同步分部, 数据来源选择数据源的接口, 数据目标选择分部的接口；**同步内容文本框不允许设置纯数字**

需要注意的是：数据目标若要选择分部，需要在【组织架构设置】-【基础设置】处启用分部, 否则数据目标的浏览框选择不到分部的接口

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1cea1c18047917502f4263df258a3af7.jpg)

3、接口参数

配置数据源连接信息及数据来源的参数（表名）

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e9c81ca7df3f61b606cca08074b3f34a.jpg)

选择数据库表名, 增量标识字段目前只支持值为日期的字段

4、字段映射

配置数据来源和数据目标的字段映射关系，相当于把外部表的数据某个字段同步到OA的某个字段

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/042a9ff658d7210a9befbb899fe9865c.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6d65a99052899e8d5044ee3a006cb018.jpg)

来源字段选择的是接口参数里这组配置的表名里的字段或数据源设置字段；

目标字段选择的是同步设置中选择的接口对应的OA的表字段；

转换规则根据实际需要进行配置；

主键为单选, 支持所有字段作为主键进行同步, 需要注意: 主键尽量不要重复, 否则会导致后面同步的数据更新上面同步的数据。

1）字段映射支持字段排序，可拖拽进行排序

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c09fa22355e8aa77472df696f101924d.jpg)

2）字段映射处选择目标字段为人力接口,保存后可进行分部，部门，岗位，人员系统字段以及分部，部门，人员自定义字段的同步

人事档案字段设置：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/01d18aacac84f96fa263791c463dafc9.jpg)

自定义字段设置：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c60b71d0812792641e8e1103d297cf8d.jpg)

分部、部门自定义字段设置：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/857845dbba5ace602b26147d6e339fe3.jpg)

3）字段映射配置里，转换规则支持选择类型：转换规则、函数公式与固定值

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0426b7582d1476be2a7d41f5a1672dd0.jpg)

若转换规则选择【转换规则】，则后方为【转换规则选择浏览框】，内容为转换规则库中的内容，支持浏览框快速新建转换规则，点击跳转到新建转换规则页面

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b6ed77d3c32670640c97b3e39e4b9d9c.jpg)

若转换规则选择【固定值】，则后方为【输入框】，直接可输入固定值

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e1b78c909e048a3f63d8d4089184dba3.jpg)

若转换规则选择【函数公式】，则后方为【函数公式选择浏览框】，内容为函数库中公式列表的内容，支持浏览框快捷新建公式，点击新建公式跳转到新建函数公式页面,可新建函数公式及变量

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/355da4db2dba746956d5524545e1a223.jpg)

5、数据过滤

数据过滤规则根据【同步设置】中配置的【同步内容】配置对应的数据过滤规则：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2f11001dca8e576dfa0af7eca8984e17.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2ebcba167a029362da334c8e271d5f4c.jpg)

6、手动同步

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2b411c4ef752d7b7858f10c99ef8df6e.jpg)

同步内容选择的是同步设置中开启的数据；

封存组织效验下级开关默认开启，提示文案：关闭后，封存组织架构将取消是否存在下级、非封存下级组织以及在职人员的校验；

开启全量同步，不走增量标识，全量同步数据。

同步情况：记录同步进度，显示同步详情，点击同步详情可跳转至同步日志页面

**同步日志管理**

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/40b5861c59b7e0c99556b1ddbc804de8.jpg)

分为两个页面，同步日志和定时清理：

1、同步日志记录每次同步基本信息，点击查看可查看数据详情, 失败的数据会做出提示![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d837be554ba230a9b88512234fd51a83.jpg)

2、定时清理开启后通过配置保留日志天数，清理当前日期x天前的日志数据，清理动作每天零点执行

