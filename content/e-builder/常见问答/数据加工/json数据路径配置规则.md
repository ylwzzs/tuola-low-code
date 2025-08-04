---
aliases: ["1970262609278257626"]
title: json数据路径配置规则
created: 2025-07-15
modified: 2025-07-15
tags: ['e-builder']
theme: e-builder
---

**问题描述：**

json数据如何配置路径规则，及配置实例

**解决方式：**

`text
1.'$' 开头: 表示json变量标识
`

`text

2. 读取对象object加 '.'
`

`text

3. 读取数组array 加 '[]'： [index]取对应角标为 index 的值； [*]:取数组全部
`

`text

4. 正则形式的path：暂不支持
`

`text

5. 如果输入的json字符串或路径 path 无效，那么返回NULL
`

![](https://myhelpdoc.oss-cn-heyuan.aliyuncs.com/mdimages/b6e394aea0503f88848e1a393638ce17.jpg)