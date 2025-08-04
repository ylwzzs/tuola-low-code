---
aliases: ["1971273884423626087"]
title: Word/Excel模板
created: 2025-07-15
modified: 2025-07-15
tags: ['表单引擎']
theme: 业务表单
---

**Excel版打印模板设置**

Excel设置模板非常灵活，打印时样式完全根据excel来，我们只需要在打印的时候根据数据源将实际用户填写的数据填充到excel中，如下图所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/f807307bb44aa5a98f334efc7a9ea16b.jpg)

支持设置模板名称，适用范围、开启状态和上传模板（下载系统提供的模板）

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5d2415198b548194b964dcaa45469f9e.jpg)

如果对制作过程不是很了解的，可点击右上角"制作模板介绍”，介绍一共分为两个步骤，下载模板和制作模板，如下图所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/6ed9245646205ba277eaeaeddba2c86a.jpg)

系统会提供设置模板所需要的所有数据源写法，数据源是对应到表单中的每个控件的，即通过数据源获取该控件的值，Excel模板中必须严格按照系统提供的数据源写法，否则系统无法获取数据到模板中，如下图所示：

注意：

（1） 主表字段的数据源写法如下:#字段标题#”,如存在主表多个控件标题相同，系统将无法区分;  
（2） 对于明细子表里的字段数据源写法如下:#明细子表标题.字段标题#,#明细子表标题.sum.字段标题#,如明细子表无标题,系统会默认一个标题（考虑到表单可能存在多个明细子表）dtb1，dtb2...来表示;  
（3）对于系统默认的字段（如提交人）,关联控件,系统提供固定写法,请参考下面的数据源列表;  
（4）对于评论,系统提供两种打印方式,其中#horizontalcommenttable#表示评论纵向打印

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/a945fe9bdba221a1730c2465dc8f935a.jpg)

如果有多条打印规则适用，则在打印时，可选择要使用的模板，如下图：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/3769574dfe99ace9097f626c55f0ced1.jpg)

## ◦评论纵向打印设置

word和excel中，审批意见及评论支持横向打印，可进行选择插入横向评论或纵向评论。如下图所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/4c3b45b0369c29015667eb341bb31157.jpg)

设置excel打印模板时，插入#transverseCommentTable#表示横向打印。如下图所示：

注意：①设置横向评论时，默认评论占一行，需拆分单元格。否则一条评论占一行，效果跟纵向打印类似。

②这里设置评论占位符占两个单元格，每条评论都将占两个单元格。

③当评论过多超过一行时，换行显示评论。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/5225c279ea0f7fa30e60e2685a2c0a83.jpg)

打印预览效果，每条评论占两个单元格。如下图所示：

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/daa61febdaa5ebb1a611edffb6cdb50d.jpg)

## ◦打印数字默认两位小数

word和excel中模板中，数字类型的字段默认保留两位小数。

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/595c5f7b4eef64964dcc473a3032b5af.jpg)

**Word版打印模板设置**

word模板的设置方式和excel类似，请参考excel。

