---
aliases: ["1974798747788297612"]
title: 新增免费预览插件ofd.js
created: 2025-07-14
modified: 2025-07-14
tags: ['基础模块']
theme: 知识文档
---

# 1、需求背景

目前文件预览的应用场景日益丰富，因此对支持预览能力的插件集成需求也越来越多。OFD.JS插件支持预览ofd格式的文件预览。

# 2、功能描述

- 将OFD.JS插件对接到E10 插件功能体系中，可以在【租户管理平台-预览编辑设置】中，对插件属性、租户应用范围、插件开关进行设置。
- 可以在系统的【后台管理中心-文件设置-文件插件】项中，控制OFD.JS插件的应用范围及设置优先级。

# 3、功能说明

## 3.1. 租户管理平台设置

入口：租户管理平台-预览编辑设置

### 3.1.1. 新建

点击新建按钮，插件类型选择OFD.JS，插件信息包含插件名称，启用状态，可应用于，可应用端，预览格式。设置好相应信息后点击保存即可新建成功。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a9746f348c66e0b40d4b64a7d72e5f5f.jpg)

### 3.1.2. 设置

点击OFD.JS后编辑按钮，弹窗打开OFD.JS设置页面，可在此修改插件相关设置，修改完成后点击保存完成设置

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/dc1555f06d62b56598050a5942459b7e.jpg)

### 3.1.3. 应用范围

点击OFD.JS后应用范围按钮，弹窗打开应用范围设置页面，可在此控制插件应用范围，调整各个租户的使用情况。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8542ae25851d85895f6553ec791ab545.jpg)

### 3.1.4. 删除

点击OFD.JS后删除按钮，弹出确认弹窗，点击确认即可删除该插件。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/67d59c2c1e9b838aae5b49390a30f71d.jpg)

## 3.2. 后台管理中心设置

入口：后台管理中心-文件设置-文件插件

### 3.2.1. 应用范围

应用范围默认不设置，此时所有用户可以使用插件，添加共享对象后，仅共享列表中的对象可以使用该插件。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/ec0c975c0a4bdf2f642c793c27ef0ed1.jpg)

### 3.2.2. 优先级设置

在该页面，可以通过拖动操作调整插件优先级，系统将根据优先级及本地环境设置来自动适配插件。可以分别设置预览，编辑，格式处理的优先级。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b6d663d40e8e920e4451cb2414a643be.jpg)

## 3.3. OFD.JS功能

### 3.3.1. 预览

OFD.JS预览支持格式：OFD，可以直接预览该格式范围内的文档或附件。

### 3.3.2. 打印

OFD.JS支持打印功能，在附件预览页面，点击打印按钮即可进行打印操作。

### 3.3.3. 移动端

