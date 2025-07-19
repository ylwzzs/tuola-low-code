---
aliases: ["1974158618872891758"]
title: GETRATEAMOUNT
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

说明：

汇率金额转换

参数：

sourceCurrency：原币种，支持传递币符或币种ID

targetCurrency：目标币种，支持传递币符或币种ID

rateType：1:实时汇率 2:平均汇率 3:期末汇率 4:指定日期汇率(使用指定日期汇率，数据来源为:指定日期浮动汇率>指定日期所在期间汇率>最新汇率)

sourceMoney: 原金额

decimalPlace: 保留小数位

FXRateRange：汇率类型为2/3时需要传递，格式为yyyy/MM

FXRateDate：汇率类型为4时需要传递，格式为yyyy-MM-dd

periodFXRateType：2:平均汇率 3:期末汇率，当rateType为指定日期汇率时，需要传递此参数，表明获取不到当天浮动汇率时，取哪种类型的区间汇率