---
aliases: ["1973932450943860041"]
title: 执行Python
created: 2025-07-15
modified: 2025-07-15
tags: ['ESB中心']
theme: ESB中心
---

执行Python：通过配置动作流触发后执行python作业

1、创建数据

数据加工模块需要存在python作业，若没有可以自行创建

![](361c6617cbee0d2b5600d59129ffba93.jpg)

2、配置初始触发节点

任意配置一个触发节点：举例配置了一个定时器

3、添加执行Python:

![](e584dd9e074c64681523ab130f148e18.jpg)

4、配置执行Python

可以选择有权限的所有python作业![](27ce7b976ddb913886871066ac47fc78.jpg)

python字段设置：设置参数字段

python作业存在参数字段时，python字段设置可以重新设置参数值，若没有在动作流设置参数值，则使用参数的默认值

![](7f00a1318b22850824f1d3b4094094fb.jpg)

5、执行结果

触发动作流可以运行python作业