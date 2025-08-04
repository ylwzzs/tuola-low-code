---
aliases: ["1974158605042091756"]
title: BASECURRENCY2TARGET
created: 2025-07-29
modified: 2025-07-29
tags: ['ESB中心']
theme: ESB中心
---

说明：

本位币转外币

参数：

targetCurrency：目标币种，支持传递币符或币种ID

rateType：1:实时汇率 2:平均汇率 3:期末汇率 4:指定日期汇率(使用指定日期汇率，数据来源为:指定日期浮动汇率>指定日期所在期间汇率>最新汇率)

sourceMoney: 原金额

FXRateRange：汇率类型为2/3时需要传递，格式为yyyy/MM

FXRateDate：汇率类型为4时需要传递，格式为yyyy-MM-dd

periodFXRateType：2:平均汇率 3:期末汇率，当rateType为指定日期汇率时，需要传递此参数，表明获取不到当天浮动汇率时，取哪种类型的区间汇率