---
aliases: ["1974157768874891676"]
title: JSONPATHVALUE
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

说明

根据json路径获取value

参数

json/jsonarray

jsonPath:json路径

示例

JSONPATHVALUE([{"a":1,"b":88,"c":{"a":123}},{"a":2,"b":99,"c":{"b":123}}],$['c']['a'])

返回

[123]