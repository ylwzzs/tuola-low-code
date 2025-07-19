---
aliases: ["1969666567354750621"]
title: ecology9(数据源)方式配置示例
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

![](98475b8040c0a5868427ee2b127ff623.jpg)

点击套件模板的使用按钮，进入简易版新建同步方案页面

**前提条件**

确保E10环境能访问到E9数据库

**创建视图**

1、sqlserver数据库

分部视图：

|  |
| --- |
| if exists(select table\_name from INFORMATION\_SCHEMA.VIEWS where TABLE\_NAME='v\_hrsync\_HrmSubcompany')  DROP view v\_hrsync\_HrmSubcompany;  go  create view v\_hrsync\_HrmSubcompany as  select 's\_'+cast(id as varchar) as id,  's\_'+cast(supsubcomid as varchar) as up,  case when canceled=0 or canceled is NULL or canceled='' then '1' else '0' end as canceled ,  subcompanycode , subcompanyname, subcompanydesc ,showorder,modified  from hrmsubcompany  go |

部门视图：

|  |
| --- |
| if exists(select table\_name from INFORMATION\_SCHEMA.VIEWS where TABLE\_NAME='v\_hrsync\_HrmDepartment')  DROP view v\_hrsync\_HrmDepartment;  go  create view v\_hrsync\_HrmDepartment as  select id,  case when supdepid=0 or supdepid is null then 's\_'+cast(subcompanyid1 as varchar) else cast(supdepid as varchar) end as up,  case when canceled=0 or canceled is NULL or canceled='' then '1' else '0' end as canceled ,  departmentname,departmentmark,departmentcode,showorder ,modified  from HrmDepartment ;  go |

岗位视图：

|  |
| --- |
| if exists(select table\_name from INFORMATION\_SCHEMA.VIEWS where TABLE\_NAME='v\_hrsync\_HrmJobTitles')  DROP view v\_hrsync\_HrmJobTitles;  go  create view v\_hrsync\_HrmJobTitles as  select id,jobtitlemark ,jobtitlename ,modified,jobtitlecode,case when s.canceled=0 or s.canceled is NULL or s.canceled='' then '0' else '1' end as canceled  from hrmjobtitles s;  go |

人员视图：

|  |
| --- |
| if exists(select table\_name from INFORMATION\_SCHEMA.VIEWS where TABLE\_NAME='v\_hrsync\_HrmResource')  DROP view v\_hrsync\_HrmResource;  go  create view v\_hrsync\_HrmResource as  select id ,lastname,workcode,mobile,email,loginid,password,telephone,  case when sex=0 or sex is null then 'male' else 'female' end as sex,  -- E9：0：试用 1：正式;2：临时;3：试用延期;4：解聘;5：离职;6：退休;7：无效 E10: 1：试用 2：试用延期 3：正式;4：临时;5：实习 6：离职;7：退休;  CASE STATUS  when 0 then 1  when 1 then 3  when 2 then 4  when 3 then 2  when 4 then 6  when 5 then 6  when 6 then 7  when 7 then 7  else 7 end as status  ,departmentid,jobtitle,managerid ,modified  from hrmresource  go |

2、mysql数据库

分部视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmSubcompany as  select CONCAT('s\_',id) as id,  if(SUPSUBCOMID=0 or SUPSUBCOMID is null,0,CONCAT('s\_',SUPSUBCOMID)) as up,  if(CANCELED=0 or CANCELED is null or CANCELED ='','1','0') as canceled,  subcompanycode , subcompanyname, subcompanydesc ,showorder,modified  from hrmsubcompany  ; |

部门视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmDepartment as  select id,  if(SUPDEPID=0 or SUPDEPID is null,  concat('s\_',SUBCOMPANYID1) ,  SUPDEPID ) as up,  if(CANCELED=0 or CANCELED is null or CANCELED ='','1','0') as canceled,  departmentname,departmentmark,departmentcode,showorder ,modified  from hrmdepartment  ; |

岗位视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmJobTitles as select id,jobtitlemark,jobtitlename,modified,jobtitlecode,if(CANCELED=0 or CANCELED is null or CANCELED ='','1','0') as canceled from hrmjobtitles ; |

人员视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmResource as  select id ,lastname,workcode,mobile,email,loginid,password,telephone,  if(sex=0 or sex is null or sex ='','male','female') as sex,  -- E9：0：试用 1：正式;2：临时;3：试用延期;4：解聘;5：离职;6：退休;7：无效 E10: 1：试用 2：试用延期 3：正式;4：临时;5：实习 6：离职;7：退休;  CASE STATUS  when 0 then 1  when 1 then 3  when 2 then 4  when 3 then 2  when 4 then 6  when 5 then 6  when 6 then 7  when 7 then 7  else 7 end as status,  departmentid,jobtitle,managerid ,modified  from hrmresource  WHERE accounttype <> 1  ; |

兼职信息（一人多岗）视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_EmpExtra as  select id,departmentid ,jobtitle,belongto,managerid,modified ,  -- 是否删除  CASE STATUS  when 0 then 0  when 1 then 0  when 2 then 0  when 3 then 0  when 4 then 1  when 5 then 1  when 6 then 1  when 7 then 1  else 1 end as status  from hrmresource h  WHERE accounttype = 1  ; |

3、oracle数据库

分部视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmSubcompany as  select concat('s\_',CAST(id AS varchar(30))) AS id,  concat('s\_',CAST(SUPSUBCOMID AS varchar(30))) AS up,  case when canceled=0 or canceled is NULL or canceled='' then '1' else '0' end as canceled ,  subcompanycode , subcompanyname, subcompanydesc ,showorder, TO\_CHAR(modified,'YYYY-MM-DD') AS modified  from hrmsubcompany  ; |

部门视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmDepartment as  select id,  case when supdepid=0 or supdepid is null then concat('s\_',CAST(subcompanyid1 AS varchar(30))) else CAST(supdepid AS varchar(30)) end as up,  case when canceled=0 or canceled is NULL or canceled='' then '1' else '0' end as canceled ,  departmentname,departmentmark,departmentcode,showorder , TO\_CHAR(modified,'YYYY-MM-DD') AS modified  from HrmDepartment  ; |

岗位视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmJobTitles as  select id,jobtitlemark ,jobtitlename,jobactivityid , TO\_CHAR(modified,'YYYY-MM-DD') AS modified,jobtitlecode,'0' as up  from hrmjobtitles  ; |

人员视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_HrmResource as  select id ,lastname,workcode,mobile,email,loginid,password,telephone,  case when sex=0 or sex is null then 'male' else 'female' end as sex,  -- E9：0：试用 1：正式;2：临时;3：试用延期;4：解聘;5：离职;6：退休;7：无效 E10: 1：试用 2：试用延期 3：正式;4：临时;5：实习 6：离职;7：退休;  CASE STATUS  when 0 then 1  when 1 then 3  when 2 then 4  when 3 then 2  when 4 then 6  when 5 then 6  when 6 then 7  when 7 then 7  else 7 end as status  ,departmentid,jobtitle,managerid , TO\_CHAR(modified,'YYYY-MM-DD') AS modified  from hrmresource  ; |

兼职信息（一人多岗）视图：

|  |
| --- |
| create or REPLACE view v\_hrsync\_EmpExtra as  select id,departmentid ,jobtitle,belongto,managerid,TO\_CHAR(modified) AS modified,  -- 是否删除  CASE STATUS  when 0 then 0  when 1 then 0  when 2 then 0  when 3 then 0  when 4 then 1  when 5 then 1  when 6 then 1  when 7 then 1  else 1 end as status  from HRMRESOURCE h  WHERE accounttype = 1  ; |

**创建同步方案**

1、配置前提条件：数据源注册

数据源注册功能入口:【后台管理中心】-【平台引擎】-【数据加工】-数据连接-新增连接

![](62f948ec3acc78707046f77c71375b9a.jpg)

![](3ae2353bb43eb466ebfc12b6ced907dc.jpg)

2、配置参数说明

功能入口:【后台管理中心】-【集成中心】-【HR同步】-基础设置-新建

![](ef88549f0b152bed31a5f1b4091a9330.jpg)

1）基础设置

² 名称：随意，不可重复，不可为纯数字（必填）

² 同步设置：启用按钮控制功能是否开启, 同步方式包括手动同步和自动同步

手动同步：需要配置完成后手动在第五步点击同步

自动同步：选择自动同步, 显示corn表达式, 根据配置的频率进行同步(需要注意: 当前表达式暂不支持秒级别的配置)

² 同步频率：默认值为0 0 1 \* \* ? 表示每天凌晨一点自动执行同步; 点击【设置】按钮出现设置窗，设置完成后，需点击【确定】按钮

![](9d1067bef8ce0c2ebd5696bfdbf29e27.jpg)

2）同步设置：默认带出同步设置

选择需要同步的数据来源和数据目标, 如同步分部, 数据来源选择数据源的接口, 数据目标选择分部的接口

![](3b52ce59db320fb06d825e375d19987a.jpg)

需要注意的是：数据目标若要选择分部，需要在下面的【组织架构设置】中启用分部，否则数据目标的浏览框选择不到分部的接口

![](8a3850bc7878907f310fb3c32fad38df.jpg)

3）接口参数

选择E9数据库所在数据源，其他参数默认带出

![](9a46e819300f4d1e905100ff9ce5ada3.jpg)

**注：增量标识只支持值为日期的字段**

4）字段映射，配置外部表数据的字段和OA字段的同步对应关系

注：主键为单选，支持所有字段作为主键进行同步，需要注意，主键不要重复

一些基础字段会默认带出，其他字段可自动手动添加

![](b959f577bd10e6fc2abd82e98402dee4.jpg)

5）手动同步

同步内容选择的是同步设置中开启的数据

开启全量同步：不走增量标识，全量同步数据

![](f9b471a9e65eab78578fd967d492bee5.jpg)

注：初始化兼职信息，开启后，可将同步的兼职信息与系统内原有信息进行匹配