---
aliases: ["1973155037133742550"]
title: SAP集成-浏览框
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

#

- # [[#功能入口|功能入口]]
- # **[[#运维管理平台安装驱动|运维管理平台安装驱动]]**
- # **[[#数据源|数据源]]**
- # **[[#注册服务|注册服务]]**
- # **[[#注册浏览框|注册浏览框]]**
- # **[[#1、基本信息|1、基本信息]]**
- # **[[#2、字段设置|2、字段设置]]**
- # **[[#3、快捷搜索字段|3、快捷搜索字段]]**
- # **[[#4、常用条件|4、常用条件]]**
- # **[[#5、查询字段默认显示|5、查询字段默认显示]]**
- # **[[#6、查询条件必填|6、查询条件必填]]**
- # 

# **[[#表单联动|表单联动]]**

- # **[[#1、数据赋值|1、数据赋值]]**
- # **[[#2、高级搜索条件设置|2、高级搜索条件设置]]**
- # **[[#2.1禁用搜索条件|2.1禁用搜索条件]]**
- # **[[#2.2常用条件|2.2常用条件]]**
- # [[#2.3隐藏|2.3隐藏]]
- # [[#2.4只读|2.4只读]]

# **功能入口**

# 【集成中心】-【SAP集成】

**除购买SAP集成外，还必须购买ESB中心**

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0149945d29b7784f471393aa992dff55.jpg)

权限：

除需要SAP集成权限外，还需要有ESB连接器权限

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/041e3838a256a7f3fff51bf6bb830943.jpg)

##

# **运维管理平台安装驱动**

云上环境可跳过此步骤，私有化部署环境第一次需要安装

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/442ad5d06a3558552f17232484016e3c.jpg)

## **数据源**

注册SAP相关信息

|  |  |
| --- | --- |
| 配置项 | 说明 |
| 连接名称 | 任意 |
| 说明 | 任意 |
| IP地址 | SAP服务器IP地址，例如192.168.7.98 |
| 用户名 | SAP用户名【咨询SAP供应商获取】 |
| 密码 | SAP密码【咨询SAP供应商获取】 |
| 客户端 | SAP服务客户端【咨询SAP供应商获取】，例如：001 |
| 编号 | SAP服务编号【咨询SAP供应商获取】，例如：00 |
| SAPRouter | SAP Router 【咨询SAP供应商获取】 |
| 语言 | 根据实际SAP服务语言设置 |
| 是否开启集群 | 默认否 |
| SAP服务为集群选择是 |
| 消息服务器 | 咨询SAP供应商获取 |
| 消息服务器端口号 | 咨询SAP供应商获取 |
| 集群系统标识 | 咨询SAP供应商获取 |
| SAP集群组 | 咨询SAP供应商获取 |

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3cf8d1de2db1e28849028a523bcf750d.jpg)

## **注册服务**

定义SAP函数有那些请求和响应【返回】参数，此处配置的请求参数可作为浏览框的搜索条件，响应【返回】参数可作为浏览框展示的数据。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/af5ede89e1f33dd8db9e59dcac01d8c6.jpg)

|  |  |
| --- | --- |
| 配置项 | 说明 |
| 接口名称 | 任意 |
| SAP-ABAP函数名 | 想要使用哪个函数，填写对应的SAP函数名 |
| 开启事务提交 | 否，浏览框无需关心此配置，默认否即可 |
| 是 |
| 是否自动解析参数 | 关闭，请求和响应参数需手动填写 |
| 开启，可选择对应数据源，自动解析出来当前SAP函数有那些请求参数和响应参数，**建议使用自动解析，以免填写的参数名不正确** |

请求参数有哪些，取决于SAP函数的请求参数要求有哪些，建议开启自动参数，选择对应数据源，点击下一步，可自动带出请求参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/133ab7bf648e22f49a0a6445ea090050.jpg)

响应参数有那些，取决于SAP函数，建议开启自动参数，选择对应数据源，点击下一步，可自动带出响应参数

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0b1946a7ff4e5cd558b34416c6ad169e.jpg)

请求和响应配置完成后，可发布此注册服务，发布后，浏览框才可以选择此注册服务

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/aa4da6df97843daade1b58fb0c090dc9.jpg)

## **注册浏览框**

### **1、基本信息**

注册浏览框选择的注册服务，应保证数据源测试通过，否则注册浏览框会保存失败

|  |  |
| --- | --- |
| **配置项** | **说明** |
| 浏览框名称 | 任意，只能为字母、数字和下划线 |
| 关联注册服务 | 选择对应数据源及注册服务  注意此处显示的服务为注册服务列表内所有发布状态的服务，类似于查询某个数据库【数据源】中的某张表【注册服务】，此SAP函数去那个SAP服务器里边执行 |
| 备注 | 任意 |
| 所属机构 | 根据实际 |

**![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7d58ad46964672626026eee4430c96f8.jpg)**

### 2、**字段设置**

|  |  |
| --- | --- |
| 配置项 | 说明 |
| 字段 | 所选SAP函数所有的请求和响应参数 |
| 字段显示名 | 浏览框打开时，字段列名 |
| 显示 | 勾选后，打开浏览框即显示此列 |
| 显示顺序 | 可设置证书，数值越小，该列靠前显示 |
| 标题栏 | 选中浏览框展示名称，不可重复 |
| 主键字段 | 浏览按钮唯一标识，不可重复 |

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c4828b885631e4e401225e7a3decb4c7.jpg)

#### 3、**快捷搜索字段**

如图，输入内容后回车可搜索数据

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1b8dfa8eb003ca3fd1342d3123745176.jpg)

#### **4、常用条件**

设置后打开浏览框可在浏览框高级搜索看到被勾选常用条件的字段

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c73b7783dece0a282ac33a1621b9844c.jpg)

#### **5、查询字段默认显示**

勾选后，打开浏览框，无需打开高级搜索，即展示此搜索项

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/81b5bbfb94b4332373dc61cb7a28366d.jpg)

#### **6、查询条件必填**

勾选后，高级搜索项必须填写内容才可以搜索

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a131162801a8e923481b9dc1f24450d3.jpg)

## **表单联动**

工作流程表单或EB表单中添加关联浏览类型字段，浏览框类型选择SAP集成注册好的浏览框

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a6afacfb98f4d15cc7da225832fcfd3e.jpg)

添加后可设置此浏览框与表单字段的联动效果

### 1、**数据赋值**

将SAP浏览框中选中的数据带到流程表单其他字段中

示例选中**两行**数据：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/27a7505a53bdd856f35d484e6a1556c9.jpg)

选中后效果：

联动到表单字段，值显示最后一行浏览框数据

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9429e1e49bfd21611f198a1bdbe44874.jpg)

开启“完整钻取”，选中两条数据

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2a7004000da5b683907d3df0e262c9ea.jpg)

选中后效果：

选中的多条浏览框数据，以逗号分割的形式显示在表单上

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0bb1c191716c7ebbcf7929916cedf586.jpg)

### 2、**高级搜索条件设置**

#### 2.1**禁用搜索条件**

设置高级搜索禁用条件：

此搜索项不显示

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8f438d8ced9a1ceec741e73afc4f9e2e.jpg)

取消禁用效果：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b2af8048f725aca198ab2e908ca93b8c.jpg)

#### 2.2**常用条件**

搜索条件可设置常量和变量

常量，例如给Country Grouping搜索项设置常量“CN”，浏览框打开时，默认赋值“CN”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fa28b32acefe3e2bc5df5019b22c80ff.jpg)

变量：

可选择表单字段

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/fb49bde347c6455203b871937c9fa0b1.jpg)

效果：

将表单字段值带到浏览框高级搜索中

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b615de92779e02d549731a62707c1dff.jpg)

#### 2.3**隐藏**

勾选隐藏后，高级搜索不展示此搜索项

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4124c56d2a0493aa307e91011c6eca20.jpg)

#### 2.4**只读**

勾选只读，不可手动输入值

