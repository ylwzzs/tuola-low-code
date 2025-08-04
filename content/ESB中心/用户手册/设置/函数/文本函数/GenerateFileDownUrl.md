---
aliases: ["1969759456411951105"]
title: GenerateFileDownUrl
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

后台管理中心->ESB中心->动作流（或接口信息的成功失败）中，点击动态赋值框，左侧选择函数后，在右侧选择加文本函数中的GenerateFileDownUrl函数，用于获取文件的下载链接

说明：

获取文件的下载链接

语法：

GenerateFileDownUrl(String,String,String,String)

参数：

四个参数分别是文件id，重命名，链接过期时间/分钟，用户id。 其中文件id和用户id是必填，重命名和链接过期时间不填可用空串填充

示例：

GenerateFileDownUrl(“123”，“重命名”，“30”，“4654654”);