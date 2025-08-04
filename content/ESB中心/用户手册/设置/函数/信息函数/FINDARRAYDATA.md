---
aliases: ["1967885057166932056"]
title: FINDARRAYDATA
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

FINDARRAYDATA(array(必须), searchKey(必须), searchValue(必须), policy(可选), returnKey(可选))

参数说明：

array(必须)：欲查询的数据集合（数组）

searchKey(必须)：查询字段

searchValue(必须)：查询字段值

policy(可选)：查询策略。1-返回第一条符合条件的数据（默认），2-返回最后一条符合条件的数据，3-返回空值，4-返回所有符合条件的数据

returnKey(可选)：返回字段，默认返回整个对象

示例：

array：[{"fieldname":"a","fieldvalue":"a"},{"fieldname":"a","fieldvalue":"1"},{"fieldname":"b","fieldvalue":"b"}]

FINDARRAYDATA(array, "fieldname", "a") == {"fieldname":"a","fieldvalue":"a"}

FINDARRAYDATA(array, "fieldname", "a", "", "fieldvalue") == "a"

FINDARRAYDATA(array, "fieldname", "a", "2", "fieldvalue") == "1"

FINDARRAYDATA(array, "fieldname", "a", "3", "fieldvalue") == ""

FINDARRAYDATA(array, "fieldname", "a", "4", "fieldvalue") == ["a", "1"]

FINDARRAYDATA(array, "fieldname", "a", "4", "") == [{"fieldname":"a","fieldvalue":"a"},{"fieldname":"a","fieldvalue":"1"}]