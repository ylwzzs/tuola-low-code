---
aliases: ["1971651688405803535"]
title: Adobe Sign配置准备
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 电子签
---

如需在电子签中集成使用Adobe Sign服务，需要先在Adobe Sign中进行部分设置，并将一些参数配置到电子签中、进行服务绑定，这样才能在系统中使用电子签服务时、对应到指定的Adobe Sign服务。

**在Adobe Sign中新建应用，并完成配置**

1.登录Adobe Sign

<https://secure.adobesign.com/>

![](d2776fa4c23d316a7518453850483296.jpg)

![](f266d6165b17bb353e8dcdea46a50b49.jpg)

定位建议选择美国

![](e74f00bc80aed74e696f7085a1168e22.jpg)

![](1d00c5fcb29a583d48a71645b46f5b3f.jpg)

2.获取Integration Key

![](00e98e2f00a78ae1a8abae70c8a53346.jpg)

![](0131485bfc6a95a3d21566f8651ac23d.jpg)

1）自定义命名

2）勾选全部选项

3）点击保存

![](191348ae0413c8b300a8716371e24c15.jpg)

4）保存成功后，点击刚刚创建的应用

![](84538b086fbfd93220901d1b795e3ff8.jpg)

5）点击左上角【Intergration Key】按钮

![](ab8ebc5b969193a7be596041b487e415.jpg)

6）复制弹窗中的 Intergration Key

![](45777ba8a4f4d8beef028e2a5209a828.jpg)

3.在E10电子签中新建、并完成服务绑定后，再次进入Adobe Sign配置回调地址

点击导航中的【Webhooks】，点击编辑已有的回调数据，在编辑弹窗中的【Url】字段中填写回调地址。

回调地址：OA地址+/papi/signcenter/adobesign/globalCallback

示例：https://prototype.mulinquan.cn/papi/signcenter/adobesign/globalCallback

填写后保存即可。

![](6159131119e2fe54da7c19f93ed45de6.jpg)