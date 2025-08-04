---
aliases: ["1970494049751656580"]
title: 日程会议集成Offiice365配置示例
created: 2025-07-15
modified: 2025-07-15
tags: ['集成引擎']
theme: 集成引擎
---

Offiice365国内版与国际版均需参照以下步骤获取目录(租户) ID、应用程序(客户端) ID、客户端凭据

**Offiice365注册应用**

1、应用注册点击“新注册”![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/10dcf9f79dce40296fef503065a53e55.jpg)

2、“名称”任意命名点击注册

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/da9abd4241160f7fd49aeef19fbc81af.jpg)

3、注册后可获取“应用程序(客户端)ID”、“目录(租户)ID”复制记录即可

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4093ea16ad1f53fd74676a94a3e80d23.jpg)

4、点击“客户端凭据”中的“添加证书或机密”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/26d665a14bbd5cf5d775d0eef58a93a1.jpg)

5、点击“新客户端密码”，“说明”任意命名即可【注意此密码截止期限】

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2864471464fbfa6710dfc9b9952044fc.jpg)

6、图中“值”请复制，此值即为基本信息中“客户端凭据”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c4637607aecdbac736e2bb7859e9bc03.jpg)

7、API权限中点击“添加权限”，选择“Microsoft Graph”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8f7136da1c1a0dbba395d3ff1615f154.jpg)

8、选择“应用程序权限”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a85ae3fadaf50734f7a3f91a1348ac8e.jpg)

9、搜索到权限项“Calendars.Read、Calendars.ReadWrite”check框选中，点击添加

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/436a51caaaa726365221884c828b4dad.jpg)

10、点击“代表\*\*\*\*授予管理员同意”

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b4ac12dd12d6674afc74e2aa143b387a.jpg)

11、状态为绿色对号即为增加权限成功![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ea38408cbede84f748a037996edc26cc.jpg)

**维护**维护配置所选绑定字段值**

**例如绑定字段选择邮箱，则在人力资源卡片维护邮箱字段值**

入口：个人设置 - 个人资料

