---
aliases: ["1969923774848526774"]
title: Docusign配置准备
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 电子签
---

如需在电子签中集成使用Docusign服务，需要先在Docusign中进行部分设置，并将一些参数配置到电子签中、进行服务绑定，这样才能在系统中使用电子签服务时、对应到指定的Docusign服务。

**在Docusign中新建应用，并完成配置**

[[#1|1.新建入口]]

[[#2|2.新建]]

[[#3|3.配置重定向地址]]

[[#4|4.获取Private Key]]

[[#5|5.获取Integration Keys]]

[[#6|6.激活docusign接口调用权限]]

[[#7|7.配置回调事件]]

**1.新建入口**

在Docusign主页中，点击My Apps & Keys，进入新建应用页面

![](c8daa75f9ff6b3e272de0e842fa3da87.jpg)

**2.新建**

为新建应用命名

![](7c35a7e5496d6b83444f9cd110c70af5.jpg)

**3.配置重定向地址**

命名后，将进入新建设置页，下滑至Additional settings，在Redirect URLs中配置重定向地址。

需要配置两条，点击两次【ADD URL】按钮，新增两条输入框，输入如下两个地址：

1）https://developers.docusign.com/platform/auth/consent（固定地址）

2）客户oa访问地址/sp/signcenter/closeCurrentPage（需将“客户oa访问地址”进行替换，如图中示例）

![](2e3ec71348dfc4a06a49a6fc26cea72b.jpg)

**4.获取Private Key**

在新建好的应用后方，鼠标移入【ACTIONS】按钮，点击下拉框中的【Edit】，进入应用编辑界面。

![](2cb353fd997f44790a94b26fd06f2813.jpg)

下滑至【Service Intergration】分组，点击【GENERATE RSA】，系统将自动生成Private Key，点击右侧复制按钮，即复制到剪贴板。

注：Private Key用于在电子签中、绑定Docusign服务时粘贴填写。

![](e29cecf7d355012182fe11ac20de98cf.jpg)

**5.获取**Integration Keys**

在上述第4步的应用编辑界面，找到Intergration Key，点击后方复制即可获取，也是用于在电子签中绑定服务配置使用。

![](c1fa52b843bec33b3d90d34ac62752c6.jpg)

**6.激活docusign接口调用权限**

无痕窗口新开浏览器访问以下地址激活用户的接口调用权限（地址中的client\_id使用【上述的第5步获取到的Integration Key】）输入后会进入登录页面，登陆刚才管理员的账号（后续准备用于发起docusign信封的用户账号），然后给予授权。

docusign测试环境授权地址：

<https://account-d.docusign.com/oauth/auth?response_type=code&scope=impersonation%20signature&client_id=4104beb4-1788-45a2-b8ae-bfdb4f9600dc&redirect_uri=https%3A%2F%2Fdevelopers.docusign.com%2Fplatform%2Fauth%2Fconsent>

docusign正式环境授权地址：

<https://account.docusign.com/oauth/auth?response_type=code&scope=impersonation%20signature&client_id=4104beb4-1788-45a2-b8ae-bfdb4f9600dc&redirect_uri=https%3A%2F%2Fdevelopers.docusign.com%2Fplatform%2Fauth%2Fconsent>

![](894d206ad344655ea2ebe0c44164c2fa.jpg)

**7.配置回调事件**

在菜单【INTEGRATIONS】下面找到【connect】，然后点击【Add configuration】按钮，选择Custom，配置回调地址：oa地址+/papi/signcenter/docusign/globalCallback。（注意：配置的回调地址，Connect 默认使用 443 端口进行 HTTPS 连接。您也可以在 URL 中指定使用 1443、2443、3443、4443、5443、6443、7443、8443 或 9443 端口。此外，Web 服务器的 SSL 和 TLS 证书也必须满足特定要求。）

然后在下面的Trigger Event中勾选对应的需要使用到的回调事件即可。

![](85c7e6716461d56c68c4b614106ba964.jpg)

![](8f51e6a019c0bc6f0c9dd409d6fddc76.jpg)

![](37947f902920e628c8d377af799fcc4f.jpg)

![](b2561a702f5d62c69c4f01af205f74aa.jpg)

完成上述操作、了解上述参数所在位置后，即可进入Ecology系统，在电子签应用的绑定服务设置中，绑定当前Docusign服务。