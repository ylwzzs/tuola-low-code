---
aliases: ["1974036289979394787"]
title: ServerlessAction组件
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

**1.使用背景**

在一些业务场景下（如业务模块二开等），业务模块需要自己开发代码满足具体需求。区别于目前已有的 serverless/Action 组件需要将业务模块代码上传到 ESB 的服务路径下以实现代码调用的方式， serverless/Action 跨服务 action 调用可以实现直接调用业务模块实现的 dubbo 接口，无须上传代码到 ESB。

**2.实现方案**

业务模块实现 ESB 提供的接口，并将此接口按 dubbo 的方式注册到注册中心，然后通过ESB 动作流配置实现接口调用。

**2.1 业务模块（provider）**

业务模块按以下步骤实现：

2.1.1 引入依赖

|  |
| --- |
|  |
| com.weaver |
| weaver-esb-server-api |
|  |
|  |

2.1.2

实现com.weaver.esb.api.rpc.EsbServerlessRpcRemoteInterface接口 （注意： 此处已调整新的api, 不影响历史老接口调用，新建的动作流默认使用com.weaver.esb.api.rpc.EsbServerlessRpcRemoteInterface接口， 如果想要使用老的api 请在输入参数中添加 useOldVersion（useOldVersion = 1） 参数 ）

![](603e1f479584b149c977b5f4fe1cbacc.jpg)

例：

![](d14ff79f5eea10dbb2d6c6b8499d98cf.jpg)

2.1.3 发布服务

按照项目的架构体系，下面是通过xml文件去配置dubbo接口，发布对应服务。

![](92c78ef3f7acea874b498ffbc805ed84.jpg)

ref : 对应实现接口的bean实例名称。

interface：com.weaver.esb.api.rpc.EsbServerlessRpcRemoteInterface （固定不变）。

group: 用于区分不同实现的唯一约束。

version：可选参数，可用于后续多版本扩展，如果dubbbo提供者配置了动作流也需要配置

**3. ESB 动作流配置**

【选择动作流】 - 【内置】-【 serverless/Action】

![](34bf04bf0fdc964888f400b914092e01.jpg)

填入发布服务时对应的分组标识（group） 和 版本号（version）（ 和dubbo提供者配置文件的 group 和 version 对应，如果没有版本号就不用填）

![](a1df242fa29f31874e4b17debfac8127.jpg)

配置输入参数和输出参数

![](fd28e09a2b7dd31e1f1c10b2555e9f94.jpg)

相应参数参数可在上下文中获取。

![](89bdc0e5c821a9db0b66ca43d1cb7533.jpg)

所需配置简述：

输入参数 ：（调用接口所需要请求参数）

输出参数：（调用接口返回参数）

分组标识：上述发布服务时填写的 group

版本号： 上述发布服务时填写的 version, 没有可以不填，一般用于拓展使用。

**4. 应用**

**4.1 通过ecode 发布dubbo服务**

可通过本地IDE开发（详情咨询二开模块）， 按照文档开始的规范进行代码编写

将代码jar包上传，以及配制文件编辑，然后重启二开服务，当nacos 能查询到发布的服务之后 配置动作流进行调用

**5. 常见问题**

**1).实现代码需要放到ESB服务吗？**

不需要，开发完成之后只需要在各自项目中注册dubbo服务，然后在动作流中根据发布服务时填写的group和version（可选参数）去配置即可调用。

**2).Duboo发布服务在哪个配置文件？**

根据项目架构体系来。E10 一般在项目resources 目录下。

如果是二开服务二开修改xml统一到e-code监控管理平台里面改，访问地址 /ecode/monitor/loom/deploy/jar 配置文件编辑入口；如下图：

![](c675d626340c82795ce218bb2e9fed92.jpg)

注意：

修改二开服务xml配置的时候，一定不要手动修改服务器上的 applicationContext-secondev-dubbo.xml 文件，此文件为标准文件，升级版本时会覆盖，会导致这部分二开功能全部失效！如果已经手动改了上述文件，那么需要将xml中的二开配置拷贝迁移到e-code里面，确保升级不会受到影响。

**3).后端如何开发代码，以及如何发布jar包？**

后端Java开发请走本地开发模式。参考文档：https://www.e-cology.com.cn/sp/doc/docDetail/8140901019737699195  
开发好打jar上传部署到二开服务，如下图

![](3431d714c54b71b6f24f6e675e30cbb2.jpg)

**4).输入参数代码如何获取？**

例如下图，如果在动作流中配置params 的参数key

![](e3b569d051905a2d171c3111512cf575.jpg)

则按照下面图中方法获取

![](c13e1dd467c6b28a4e54e7afb960021f.jpg)

**5).接口超时时间如何修改**

修改dubbo接口超时时间

![](80f33375d20af8d4e8e6f5641c285ad0.jpg)

修改naocs配置文件 weaver-esb-server-service.properties （部分合体项目可能需要到指定合体服务的配置文件去修改）

添加如下配置, 超时时间自定义, 单位毫秒

weaver.rest.web.restRpc.[group/dubboapi全路径/version].restProperties.connectTimeOut=30000

weaver.rest.web.restRpc.[group/dubboapi全路径/version].restProperties.writeTimeOut=60000

weaver.rest.web.restRpc.[group/dubboapi全路径/version].restProperties.readTimeOut=3000

例：如 group :esb\_test\_new , version : seconddev1.0

weaver.rest.web.restRpc.[esb\_test\_new/ com.weaver.esb.api.rpc.EsbServerlessRpcRemoteInterface/seconddev1.0].restProperties.connectTimeOut =xxx

weaver.rest.web.restRpc.[esb\_test\_new/ com.weaver.esb.api.rpc.EsbServerlessRpcRemoteInterface/seconddev1.0].restProperties.writeTimeOut =xxx

weaver.rest.web.restRpc.[esb\_test\_new/ com.weaver.esb.api.rpc.EsbServerlessRpcRemoteInterface/seconddev1.0].restProperties.readTimeOut =xxx

修改完成后重启esb所在服务