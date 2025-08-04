---
aliases: ["1975038789113898735"]
title: 新增支持FTP/SFTP/共享NAS文件采集
created: 2025-07-14
modified: 2025-07-14
tags: ['基础模块']
theme: 知识文档
---

## 1. **背景**

越来越多的客户希望能够从第三方数据源中采集文件数据到E10系统中，满足其业务需求。通过接入esb的数据源及动作流实现文件采集功能，提供定时或者手动的采集方式满足更多客户的采集需求

## 2. **功能描述**

1、在后台管理中心--文件设置中新增【文件采集设置】菜单，新增角色权限【文件采集设置】来维护此功能，且依赖是否购买非标ESB  
2、文件采集任务里的采集数据源来源于esb维护好的连接信息，本次暂时支持FTP/SFTP/共享NAS的数据源采集，后期考虑支持网盘等更多的第三方数据源  
3、文件采集任务里的归集到业务动作流来源于已经维护好的采集动作流（代码实现内置两条业务线的采集动作流，包含新建文档、档案的具体业务）  
4、文件采集任务支持手动采集或者定时采集（定时以小时、日为单位）  
5、任务开始采集前会进行扫描，弹窗告知用户即将要采集多少文件数、大小及耗时  
6、采集任务可暂停；也可进行增量采集  
7、采集任务支持另存为，快速复制一个类似的采集任务

# 3. **功能说明**

## 3.1. **连接器**

设置入口：后台管理中心-平台引擎-ESB中心-连接器

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c65601a986b421778a03324b7efc019f.jpg)

### 3.1.1. **创建连接器**

点击右上角新建连接器按钮，弹出连接器设置框，连接类型选择FTP，其他信息根据实际情况填写，填写完成后点击保存

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/cf758bd2f72506f0455943d0746d156b.jpg)

打开刚才创建的连接器，点击新建按钮，弹出连接信息设置框

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f4d77c37dc55bc4124df29ebc9e9fcca.jpg)

弹框内填写相应的信息，连接方式选择PASV被动模式，填写完毕后点击保存即完成连接器创建

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8d622af9fb953462de1d7c61d45cbf4c.jpg)

## 3.2. **动作流**

设置入口：后台管理中心-平台引擎-ESB中心-动作流

### 3.2.1. **导入动作流**

点击新建按钮下拉框中的动作流本地迁入按钮，选择文件采集动作流压缩包，完成动作流迁入

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d4878f300b09360a339ea13ff686b8f0.jpg)

### 3.2.2. **动作流设置**

点击打开导入的动作流，再点击新建文档动作流组件，修改目标文件夹设置项为采集文件归档的文件夹，选择文档密级，完成后点击保存并启用

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/0336e24ba403d30f1e2f37d6d5ea4567.jpg)

## 3.3. **文件采集设置**

设置入口：后台管理中心-全局基础-文件设置-文件采集设置

### 3.3.1. **新建采集任务**

点击有上角新建按钮，弹出新建窗口

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/bac43a6a8a5a91fd956ebdf2f6870dc0.jpg)

启用：默认不启用，完成新建后需手动开始任务；若设置启用，完成新建保存后，立即开始任务

采集数据源：选择3.1中创建的连接器  
采集文件路径：不配置默认采集全部数据；配置路径只采集指定路径下的数据  
归集到业务动作流：选择3.2中导入的动作流  
采集方式：

1、手动同步：需手动点击规则列表的立即同步按钮才会发起同步

2、定时同步：系统将会根据配置的定时频率自动触发同步，若客户端不在线，则不进行同步

### 3.3.2. **启用**

未启用的采集任务，点击启用按钮，开始文件采集。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/aaa964b3008002fdb8cf090426df461f.jpg)

任务开始采集前会进行扫描，弹窗告知用户即将要采集多少文件数、大小及耗时

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5bce34bfff58dcd6d39595664bfc37b4.jpg)

点击开始采集按钮，开始执行采集任务，弹出采集进度弹窗，展示采集详情

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1a1f94ba1e13884f12f33f1008d97be7.jpg)

### 3.3.3. **暂停**

正在执行中的采集任务，可以在采集进度中点击【暂停采集】，或直接点击启用开关进行暂停

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/507e51e2d65638e0ce5515ecc9506af0.jpg)

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2c46a81b2302a164e227d623651ef803.jpg)

暂停的任务可在任务进度中点击重新采集按钮，或者点击启用开关，继续执行采集任务

### 3.3.4. **另存为**

对于已存在的采集任务，可点击另存为按钮，生成一份新的采集任务，新的采集任务状态为未开始状态

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/989a72a291e090cbb6dd4d983f14b979.jpg)

另存为的采集任务，可以编辑修改采集任务设置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/e296e9c40eb1cd098a6294ee4ea180ff.jpg)

