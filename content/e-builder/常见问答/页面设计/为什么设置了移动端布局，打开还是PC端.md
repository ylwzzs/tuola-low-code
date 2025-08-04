---
aliases: ["1969356092415515567"]
title: 为什么设置了移动端布局，打开还是PC端
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

在页面中，我们经常会设置各式各样的点击动作，例如点击按钮打开表单的新建布局，为什么有的时候新建了移动端的布局，打开还是pc端的布局呢？

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b67bbb2447cac2186bbd00f630b3d4bc.jpg)

**解决方式：**

首先我们需要知道，页面新建的时候支持pc、移动双端适配，也支持单独设置某一端，上述问题经常发生在双端适配的页面中，我们有以下两个方法解决：

1.设置移动端默认布局，由于移动端没有设置默认布局，系统会自动读取PC端的默认布局，所以会导致这类情况的发生。因此我们可以在表单-表单设置-布局管理-移动端中设置移动端默认布局：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/8af2ea0f5a6f44d9e2ed738a977c4be7.jpg)

2.将页面切换到移动端，对按钮事件-打开表单布局-自定义移动端布局：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/50c5f509dc8e49b2573ac2ee53454472.jpg)

