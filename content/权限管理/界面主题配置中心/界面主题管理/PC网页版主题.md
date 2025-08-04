---
aliases: ["1965777705637801380"]
title: PC网页版主题
created: 2025-07-15
modified: 2025-07-15
tags: ['基础模块']
theme: 权限管理
---

**整体介绍**

“PC网页版主题”用于配置PC网页版系统主题，如图1所示，系统提供标准的深色导航风格主题25个、浅色导航风格主题12个：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4d06e2c4dd250ddaf5ab6ef4a485b17f.jpg)

图 1

主题列表支持搜索。

新建方式有：直接【新建】、【从本地导入】和【从云商店导入】，三种方式。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/1d6f1426c39429fe9790fe10f046550a.jpg)

图 2

**主题新建和编辑**

### 1.标准主题

**（1）新建主题**

点击新建主题，打开如图 3所示操作窗口，主题风格可选“深色主题风格”或“浅色导航风格”，点击【保存并进入样式设置】，可在选择的主题风格基础上进行进行样式：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7af4e2b6bbfcec1f45dfe61c9d720585.jpg)

图3

【浏览器窗口标题】：默认格式为：【应用名称】-【组织名称】-【浏览器窗口标题】，其中【浏览器窗口标题】为“浏览器窗口标题”字段填写的内容；点击显示格式链接可打开格式设置如图3-1所示，可调整为仅显示【浏览器窗口标题】还是搭配【应用名称】、【组织名称】显示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8f4e130a13eed556862a5aa7b0c899e9.jpg)

图3-1

【使用范围】/【所有范围中禁用】：用于配置谁有权限使用这个主题。

样式设置页签如图4、图5、图5-1所示，包含【导航栏】、【侧边栏】、【快捷搜索栏】和【其他】：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/48475d0fb3b4e096f565a6efeb81f270.jpg)

图 4

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/70635576fa508269314049eceb0e6dd6.jpg)

图 5

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/9b99bbd8650374a72a7770345ae52559.jpg)

图5-1

【导航栏】：背景颜色、背景图片、菜单字体、菜单字号、菜单字体颜色、菜单展示方式、图标风格、企业LOGO显示位置、左上角背景色、左上角背景图片、主导航背景色、主导航背景图片、工具栏背景色、工具栏背景图片。其中“菜单展示方式”仅在横向导航时有效，纵向导航固定使用“仅图标”的方式。

【侧边栏】：背景颜色、右侧框线颜色、 菜单字体、菜单字号、菜单字体颜色、选中菜单背景色、选中菜单字体色、选中菜单左边线颜色。

【快捷搜索栏】：快捷搜索栏显示方式、快捷搜索栏背景色、快捷搜索栏边框颜色、快捷搜索栏字体颜色。

【其他】：系统主按钮颜色、聊天气泡颜色。

样式设置可通过【预览】按钮查看预览效果，如图 6所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3eb8b716bfb6efc663d9947c1eb2d6c8.jpg)

图 6

**（2）编辑主题**

鼠标移入主题卡片，显示操作按钮：编辑、另存为、下载、更多（启用/禁用、设为默认主题、指定、删除、上传至云商店、操作日志）,如图 7所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/7dab12dc07bc35db5e5ba1719574fa3e.jpg)

图 7

【编辑】：点击打开编辑窗口，如图 8所示，对于标准主题只能启用/禁用、和设置使用范围，支持在使用范围内设置禁用范围：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8681e75b52fb020c23e3f60f4ba0296d.jpg)

图 8

对于自定义主题，还有【样式设置】页签，可设置主题样式，如图 4、图 5所示。

【另存为】：即复制主题，对于系统主题可通过【另存为】操作存为自定义主题，如图 9所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f4d14bf7de0e7c0efd87c2dc7234c5b7.jpg)

图 9

【下载】：以.json的格式下载主题，支持直接导入到系统中。

【禁用】：“启用”状态的主题可以【禁用】，禁用的主题无【设为默认主题】按钮，如默认主题被禁用，系统自动启用主题中排序第一个的主题为默认主题。

【设为默认主题】：未标记“默认”的主题，有【设为默认主题】按钮，点击可将当前主题设为默认主题，主题卡片上将标记蓝色“默认”标记。

【指定】：无论主题是否“启用”，均有【指定】操作菜单，点击【指定】时，可设置永久指定或定时指定，如图 10所示，主题“指定”时，前台用户无法自行自行选择切换主题。定时指定优先级高于永久指定，如果多个定时时间段有交集，即同个时间段内存在多个定时指定主题的，用户登录后，取符合定时指定时间段内，显示顺序在前的主题显示。

【永久指定】或【定时指定】时，可设置是否允许用户自行切换，启用时，允许前台用户在指定主题下切换其他主题。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/d1cab44cbadd231834924dd93e4ecbbe.jpg)

图 10

【上传至云商店】：点击后可将主题上传至云商店，如图 11所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/188172a04855c9d6c359b795e2a07a12.jpg)

图 11

【操作日志】：点击后可查看当前主题的操作日志。

### 2、特色主题

如果系统对接了E-Builder，可以通过“页面设计器”的方式配置样式；未对接的情况下只有ecode代码方式，如图 12所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/c9e5c1ded223850d2c7c7fe8cb9607c5.jpg)

图 12

开发方式选择“页面设计器”时，点击【保存并进入样式设置】将打开EB页面设计器。

开发方式选择“ecode代码”时，可选择ecode或新建ecode，如图 13所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/59b23bac05807bd5eec0ec936dcfd289.jpg)

图 13

## **前台用户操作**

用户可在【个人设置】-【显示设置】页面自行切换主题，如图14所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/cdad846c623e4368378cadb906142dfc.jpg)图14

如果管理员指定了主题，在指定时间范围内， 前台用户将无法自行切换主题，如图15所示：

如指定主题时，启用了【允许用户自行切换】，前台用户可在指定主题下切换其他主题，如图16所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/2abf2639fe37ecf00da358b6915c6fc6.jpg)

图15

