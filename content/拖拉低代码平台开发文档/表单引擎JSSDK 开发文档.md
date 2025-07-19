# 一、表单引擎JSSDK文档（20250430）

**##** **1.说明**

**###** **1.1 获取sdk对象实例**

> **【250101】基线及之后，在表单设计器源码、表单ecode中编写的，可直接使用formSdk**

> ***所有接口统一封装在全局对象window.WeFormSDK中\***
>
> *注意：获取实例一定要确保表单初始化完成，如果在设计器→源码中编写，一定要先注册初始化完成后，再获取，否则会报错，使用pageSdk.on('formReady') 绑定；参见1.2文档所示*

**参数说明**

| **参数**  | **类型** | **必需** | **说明**       |
| --------- | -------- | -------- | -------------- |
| moduleKey | string   | 否       | 模块或模块标识 |
| formId    | string   | 否       | 表单id         |
| dataId    | string   | 否       | 表单数据id     |

**示例**

```javascript
// 1、直接使用formSdk实例，相关源码入口：1、表单设计器源码；2、表单设置→自定义e-code开发；  [250101]基线
formSdk;

// 2、注: 这是初始化完成回调，同jQuery的onload
pageSdk.on('formReady',(args)=>{
    // a、获取最上层活动窗口的实例
    window.WeFormSDK.getWeFormInstance()
    // b、获取以moduleKey为隔离的最上层活动窗口实例
    window.WeFormSDK.getWeFormInstance(moduleKey)
    // c、获取以moduleKey和formId为隔离的最上层活动窗口实例
    window.WeFormSDK.getWeFormInstance(moduleKey, formId)
    // d、获取以moduleKey、formId和dataId为隔离的最上层活动窗口实例
    window.WeFormSDK.getWeFormInstance(moduleKey, formId, dataId)
    // 注：E10单个页面，可能会打开多份表单，有条件的情况下，建议使用粒度细的方式，以避免出现获取到其他表单的实例
});
```



### 1.2 表单加载完成回调事件

> **【250101】基线及之后，可直接使用formSdk，不需要再绑定这个**

- 表单布局-插入代码块，对当前表单生效

```javascript
// 通过Eb绑定异步回调，类似于jquery.onLoad; 参考以下形式
pageSdk.on('formReady', (args) => {
    console.log(args)
});
```



### 1.3 表单全局初始化完成回调事件

> 基于window的自定义事件，全局生效，意味着全局表单都会触发事件，注意：每次打开表单都会触发
>
> 一般在ecode中使用，实现监控全局表单场景
>
> 最低版本【240601】基线

```javascript
window.addEventListener('onFormReady', function (event) {
    // [250101]及之后，可直接event.detail.formSdk拿到实例
    const { formId, module } = event.detail || {};
    // [250101]及之后，可直接event.detail.formSdk拿到实例
    const formSdk = event.detail.formSdk;
})
```



## 2.表单事件注册

### 2.1 注册拦截事件，指定动作执行前触发，并可阻断/放行后续操作

> ***registerCheckEvent(type: string, fun: (successFn: Function, failFn: Function) => void): void;\***
>
> ***支持多次注册，按注册顺序依次执行；\***
>
> ***场景1：表单提交、保存等操作执行前，执行自定义逻辑并阻断/放行后续操作\***
>
> ***场景2：明细添加行、删除行前，执行自定义逻辑并阻断/允许后续操作\***

**参数说明**

| **参数** | **类型** | **必须** | **说明**                                                     |
| -------- | -------- | -------- | ------------------------------------------------------------ |
| type     | String   | 是       | 动作类型(详见下表)，多个逗号分隔                             |
| fun      | Function | 是       | 自定义函数，此函数入参为callback，执行自定义逻辑完成或异步ajax的success函数体内，放行需调用callback，不调用代表阻断后续操作。**注：一定要调用成功或者失败；failFu支持参数{msg:”提示语”}，定义自定义提示** |

**动作类型**

| **动作类型**                 | **说明**                                                     |
| ---------------------------- | ------------------------------------------------------------ |
| WeFormSDK.OPER_SAVE          | 保存 ***注：这个是表单的数据保存，如果需要操作模块按钮，请使用\******模块SDK提供的事件；*** ***备注：拦截表单数据【保存'】用这个，拦截流程【提交】使用流程sdk\*** |
| WeFormSDK.OPER_ADDROW        | 添加明细行，需拼明细表标识fieldMark                          |
| WeFormSDK.OPER_DELROW        | 删除明细行，需拼明细表标识fieldMark                          |
| WeFormSDK.OPER_BEFOREVERIFY  | 校验必填前触发事件                                           |
| WeFormSDK.OPER_EDITDETAILROW | 移动端-编辑明细                                              |
| WeFormSDK.OPER_FD_LINKAGE    | 拦截字段联动执行，***最低240601基线\***                      |

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 注册保存事件
formSdk.registerCheckEvent(window.WeFormSDK.OPER_SAVE, (successFn, failFn) => {
    // ...执行定义逻辑
    // 如果是移动端，则向下调用，如果非移动端则阻塞调用，仅演示需要
    window.WeFormSDK.isMobile() ? successFn() : failFn({msg: "演示使用, 非移动端不允许提交"});
});
// 明细表添加行事件
// 根据dataKey获取明细表标识
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2", "main", true);
formSdk.registerCheckEvent(`${window.WeFormSDK.OPER_ADDROW}${detailMark}`, (successFn, failFn) => {
    // ...执行定义逻辑
    // 如果是移动端，则允许添加，非移动端阻塞添加，仅演示需要
    window.WeFormSDK.isMobile() ? successFn() : failFn();
});
// 注： dataKey为数据key，在设计器的右侧可以看到

// 移动端-编辑明细
formSdk.registerCheckEvent(window.WeFormSDK.OPER_EDITDETAILROW, (successFn, failFn, data)=>{
    // ...执行定义逻辑
    // ...输出返回值,含行号
    console.log(data);
    successFn()
});
// 拦截字段联动执行，最低240601基线
formSdk.registerCheckEvent(window.WeFormSDK.OPER_FD_LINKAGE, (successFn, failFn, data)=>{
    // actionType: 触发类型;
    // triggerFields： 触发字段、数组、一般为字符串雪花id
    // triggerRowIds:  明细表内的触发行号、数组、一般为字符串雪花id
    // ...拦截指定字段触发的联动
    const { actionType, triggerFields, triggerRowIds } = data;
    // 继续执行调用successFn， 中断执行调用failFn
    if (triggerFields?.some((obj) => obj === 123456)) {
        failFn();
    } else {
        successFn();
    }
});
```

> ***dataKey 数据key的获取方式，在表单管理-»字段管理→数据key列； 设计器选中字段，右侧也显示\***



### 2.2 注册钩子事件，指定动作完成后触发

> ***registerAction(type: string, fun: (data: any) => void): void;\***
>
> ***支持多次调用注册，按注册的先后顺序依次执行\***

**参数说明**

| **参数** | **类型** | **必须** | **说明**                    |
| -------- | -------- | -------- | --------------------------- |
| type     | String   | 是       | 动作类型，详见上表          |
| fun      | Function | 是       | 触发事件, 参数data: any类型 |

**动作类型**

| **动作类型**                  | **说明**                                                     |
| ----------------------------- | ------------------------------------------------------------ |
| WeFormSDK.ACTION_ADDROW       | 添加明细行，需拼明细表标识fieldMark（**注**：明细表导入可以触发添加行事件，返回的data中有type类型标识） |
| WeFormSDK.ACTION_DELROW       | 删除明细行，需拼明细表标识fieldMark                          |
| WeFormSDK.ACTION_FORM_SAVE    | 表单保存完成回调                                             |
| WeFormSDK.ACTION_DATA_LINKAGE | 数据联动执行后（顶部的字段联动、函数公式）                   |
| WeFormSDK.ACTION_DATA_RELATE  | 数据钻取执行后（关联表字段、函数公式（设计器字段右侧的函数）、运算） |
| WeFormSDK.ACTION_VIEW_LINKAGE | 显示联动执行后                                               |

> 注意：ACTION_DATA_LINKAGE和ACTION_DATA_RELATE有差异，如：ACTION_DATA_LINKAGE是字段联动，包含ESB、SQL、可视化、函数公式(有专门入口，配置触发字段)；
>
> ACTION_DATA_RELATE是数据钻取、字段函数（字段上的函数公式）、运算控件

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
const detailMark = weFormSdk.convertFieldNameToId("mxbo16sr2", "main", true);
// 明细表添加行事件，index为添加行下标，从0开始
// 注：明细表导入可以触发到添加行，返回的data中有type类型标识
formSdk.registerAction(`${window.WeFormSDK.ACTION_ADDROW}${detailMark}`, (rowIds, data)=>{
    // ...execute custom
    console.log("添加行下标是"+rowIds);
    console.log(data);
});
// 明细表删除行事件，arg为删除上下标集合，从0开始
formSdk.registerAction(`${window.WeFormSDK.ACTION_DELROW}${detailMark}`, (rowIds, data)=>{
    // ...execute custom
    console.log("删除行下标是"+rowIds.join(","));
    console.log(data);
});
// 表单提交完毕回调
formSdk.registerAction(window.WeFormSDK.ACTION_FORM_SUBMIT, (arg)=>{
    // ...execute custom
    console.log(arg);
});    

// 数据联动执行后（顶部的字段联动、函数公式）
formSdk.registerAction(window.WeFormSDK.ACTION_DATA_LINKAGE, (data)=>{
    // 注：runData属性不低于240601基线版本
    // actionType: 触发类型;
    // resultFields: 赋值字段、数组、一般为字符串雪花id
    // triggerFields： 触发字段、数组、一般为字符串雪花id
    // triggerRowIds:  明细表内的触发行号、数组、一般为字符串雪花id
    const {actionType, resultFields, triggerFields, triggerRowIds} = data.runData||{};
    console.log("数据联动执行后", actionType, resultFields, triggerFields, triggerRowIds);
});    

// 数据钻取执行后（关联表字段、函数公式（设计器字段右侧的函数）、运算）
formSdk.registerAction(window.WeFormSDK.ACTION_DATA_RELATE, (arg) => {
  // fieldIds触发字段、数组、字符串雪花id
  // rowIds明细表内的触发行号、数组、一般为字符串雪花id
  // tableId明细表的id、字符串雪花id
  const { fieldIds, rowIds, tableId } = arg;
  console.log("数据钻取执行后（关联表字段、函数公式（设计器字段右侧的函数）、运算）", fieldIds, rowIds, tableId);
});

// 显示联动执行后
formSdk.registerAction(window.WeFormSDK.ACTION_VIEW_LINKAGE, (arg)=>{
    console.log(arg);
    console.log("显示联动执行后");
});
```



## 3.字段基础操作

### 3.1 将字段名称转换成字段id

常见问题： [https://weapp.eteams.cn/build/techdoc/wdoc/index.html#/public/doc/c35b2c70-4411-4580-a0dc-8d47f6163585]()

> **注意、重要**：字段多的表单，调用时尽量传位置标识，特别是明细字段，字段多容易出现dataKey重复的情况，可能会取错字段

> ***convertFieldNameToId(fieldName: string, symbol?: string, prefix?: boolean): string;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                     |
| --------- | -------- | -------- | ------------------------------------------------------------ |
| fieldName | String   | 是       | ***表单字段dataKey\****或明细表dataKey***，查看位置: 在设计器中，选中表单字段，右侧的'数据key'或'数据库表名' |
| symbol    | String   | 是       | 位置标示，主表(main)/具体明细表(明细表Id)； ***注意、重要\****：字段多的表单，调用时尽量传位置标识，特别是明细字段，字段多容易出现dataKey重复的情况，可能会取错字段* |
| prefix    | Boolean  | 否       | 返回值是否需要field字符串前缀，默认为true                    |

> 

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId, symbol: "main"
const fieldMark = formSdk.convertFieldNameToId("wbk", "main");

// 获取明细表的Id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取明细内字段fieldId
const detailFieldMark = formSdk.convertFieldNameToId("wbk", detailMark);
```

> ***dataKey 数据key的获取方式，在表单管理-»字段管理→数据key列； 设计器选中字段，右侧也显示\***



### 3.2 获取单个字段值

> ***getFieldValue: (fieldMark: string) => any;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                |
| --------- | -------- | -------- | ------------------------------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id} |

**返回值** string

> **如果是想要获取浏览对象取名字，使用以下任一API：**
>
> **3.12 获取单个字段的数据对象、7.7 获取浏览数据、浏览选项对象**

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("wbk");
// 获取字段值
const fieldValue = formSdk.getFieldValue(fieldMark);
// 文本输入内容，选项型返回选项id
console.log(fieldValue);

// 获取明细行的字段值
// 获取明细字段fieldId
const mxFieldMark = formSdk.convertFieldNameToId("mx_wbk");
// 获取明细表fieldId
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取第一行的rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 获取明细字段的指定行， 注：示例用的ES6拼接字符串
formSdk.getFieldValue(`${mxFieldMark}_${oneRowId}`);
```

 

### 3.3 修改单个字段值

> ***changeFieldValue: (fieldMark: string, valueInfo: any) => void;\***

 **参数说明**

> ***注意\******！！！***valueInfo中，\***文本属性是value，选项浏览属性是****specialObj*

| **参数**  | **类型** | **必须** | **说明**                                                     |
| --------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark | String   | 是       | 字段标示，格式field${字段ID}和field${字段ID}_${明细行号}     |
| valueInfo | Object   | 是       | 字段值信息，**选项及浏览**传{specialObj: [{id: "718974312893816832", name: "report demo1"}]}， **其他类型**传{value: “修改的值“}；***注意\******！！！文本属性是value，选项及浏览属性是****specialObj***选项字段是specialObj结构，如果是固定选项，支持传value使用如果是附件字段**：{specialObj: [{id: "718974312893816832", name: "report demo1", data: {…附件对象}}]}； 附件对象获取联系附件文档模块查询，这里面含有权限、操作按钮等，不一一列举**如果是人员范围选择：** {specialObj: [{id: "718974312893816832", name: "username", type:”user”}]}；type属性对应数据的类型，分别为：[ 'user', 'dept', 'subcompany', 'organization', 'group', 'role', 'position', 'all']；**表单JS没有能提供的判断类型方式** |
| config    | Object   | 否       | **所有属性，false：不执行， true：执行，默认\****系统的，最低241001基线数据联动(含字段联动、函数公式、数据钻取)**数据联动 dataLinkage?: boolean;  显示联动 viewLinkage?: boolean;选项联动 optionLinkage?: boolean; 数据校验 dataValidate?: boolean; jsApi值变更 jsApiChange?: boolean; |

**valueInfo**

| 参数       | 类型   | 必需 | 说明                                                         |
| ---------- | ------ | ---- | ------------------------------------------------------------ |
| value      | string | 否   | 修改的值，文本型                                             |
| specialObj | Array  | 否   | **每个对象有id、name、data属性， 其中data为模块的数据结构\****浏览按钮信息，数组格式，如：[{id: "718974312893816832", name: "report demo1"}]，** **附件、自定义浏览还有data属性，如[{id: "718974312893816832", name: "report demo1", data:{…具体的属性}}]** |
| longitude  | number | 否   | 地理位置，经度                                               |
| latitude   | number | 否   | 地理位置，纬度                                               |
| type       | string | 否   | 数据类型，适用于如金额币种，**不低于：241201基线**           |
| contentObj | obj    | 否   | 特殊类型的数据结构，**不低于：241201基线**                   |

**config**

| 参数          | 类型               | 必需 | 说明                                         |
| ------------- | ------------------ | ---- | -------------------------------------------- |
| dataLinkage   | boolean\|undefined | 否   | **数据联动(含字段联动、函数公式、数据钻取)** |
| viewLinkage   | boolean\|undefined | 否   | 显示联动                                     |
| optionLinkage | boolean\|undefined | 否   | 选项联动                                     |
| dataValidate  | boolean\|undefined | 否   | 数据校验                                     |
| jsApiChange   | boolean\|undefined | 否   | jsApi值变更事件                              |





**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 修改文本型-单行文本字段
const textFieldMark = formSdk.convertFieldNameToId('dhwbk', 'main', true);
formSdk.changeFieldValue(fieldMark, {value: "单行文本内容"});
// 修改字段不触发联动的演示
formSdk.changeFieldValue(fieldMark, {value: "单行文本内容"}, {dataLinkage: false});

// 修改选项型-下拉框字段； 
// 注: 仅固定选项支持，如果用了选项模板，请使用浏览、选项类型的传参方式，见下面的示例
const selectFieldMark = formSdk.convertFieldNameToId('xlk', 'main', true);
formSdk.changeFieldValue(selectFieldMark, {value: "4765016625940566613"});

// 修改选项型-多级下拉字段, 对应选项1、选项11的选项id值；
// 注: 仅固定选项支持，如果用了选项模板，请使用浏览、选项类型的传参方式，见下面的示例
const selectFieldMark = formSdk.convertFieldNameToId('djxlk', 'main', true);
formSdk.changeFieldValue(selectFieldMark, {value: "4765016625951366628,4765016625951966629"});

// 修改日期类型，日期区间格式为"2022-4-23,2022-4-25"
const dateFieldMark = formSdk.convertFieldNameToId('rqxz', 'main', true);
formSdk.changeFieldValue(selectFieldMark, {value: "2022-4-23"});

// 浏览、选项类型
const browserFieldMark = formSdk.convertFieldNameToId('glsb', 'main', true);
formSdk.changeFieldValue(browserFieldMark, {specialObj: [{id: "789", name: "数据1"},{id: "567", name: "数据12"}]});

// 附件浏览按钮类型, data数据需传递附件对象，如需查询联系附件文档模块查询，这里面含有权限、操作按钮等，不一一列举；
formSdk.changeFieldValue(browserFieldMark, {specialObj: [{id: "7189743128938875416888", name: "附件名称", data:{}}]});

//人员范围选择、人力资源多选示例
formSdk.changeFieldValue(browserFieldMark, {specialObj: [{id: "123", name: "人员", type:"user"},{id: "456", name: "部门", type:"dept"}]});

// 地理位置字段，设置经纬度
formSdk.changeFieldValue('1109721112994766848', {value: "上海市浦东新区丁香路910号-1号楼-1701室", latitude: 31.22782708, longitude: 121.55073398})

// 修改明细行的字段值
// 获取明细表内字段fieldId
const mxFieldMark = formSdk.convertFieldNameToId("mx_wbk");
// 获取明细表fieldId
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取第一行的rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 修改指定明细行的内容， 注：示例用的ES6拼接字符串
formSdk.changeFieldValue(`${mxFieldMark}_${oneRowId}`,{value: "Single line text content"});
```



### 3.4 改变单个字段显示属性(只读/必填等)

> ***changeFieldAttr: (fieldMark: string, viewAttr: number) => void;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                     |
| --------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark | String   | 是       | 字段标示，格式field${字段ID}和field${字段ID}_${明细行号}     |
| viewAttr  | Number   | 是       | 改变字段的状态，1：只读，2：可编辑，3：必填，4: 隐藏，5: 隐藏行 |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取字段fieldId
const fieldMark = formSdk.convertFieldNameToId("wbk");
// 设置为只读
formSdk.changeFieldAttr(fieldMark, 1);
// 设置为编辑
formSdk.changeFieldAttr(fieldMark, 2);
// 设置为必填
formSdk.changeFieldAttr(fieldMark, 3);
// 设置为隐藏
formSdk.changeFieldAttr(fieldMark, 4);
// 设置为隐藏、隐藏行
formSdk.changeFieldAttr(fieldMark, 5);
```



### 3.5 同时修改字段的值及显示属性

> ***changeSingleField: (fieldMark: string, valueInfo: any, variableInfo?: any) => void;\***

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                                 |
| ------------ | -------- | -------- | -------------------------------------------------------- |
| fieldMark    | String   | 是       | 字段标示，格式field${字段ID}和field${字段ID}_${明细行号} |
| valueInfo    | Object   | 是       | 字段值信息，与接口3.2格式一致，例：{value:”修改的值”}    |
| variableInfo | Object   | 是       | 变更属性，例：{viewAttr:3}, 值与3.4一致                  |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("wbk");
// 仅修改内容
formSdk.changeSingleField(fieldMark, {value: "Only modify the text content"});
// 同时修改内容与属性
formSdk.changeSingleField(fieldMark, {value: "Text content modification"}, {viewAttr: 3});
```



### 3.6 批量修改字段值或显示属性

> ***changeMoreField: (changeDatas: any, changeVariable?: any) => void;\***

**参数说明**

| **参数**       | **类型** | **必须** | **说明**                                         |
| -------------- | -------- | -------- | ------------------------------------------------ |
| changeDatas    | Object   | 是       | 修改的字段值信息集合：***注意：参数结构同3.3\*** |
| changeVariable | Object   | 是       | 修改的字段显示属性集合***注意：参数结构同3.4\*** |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const textFieldMark = formSdk.convertFieldNameToId("wbk");
const selectFieldMark = formSdk.convertFieldNameToId("xlk");
// 批量修改
const changeDatas = {
    [textFieldMark]: {value: "text content"},
    [selectFieldMark]: {value: "4765016625940566613"}
}
const changeVariable = {
    [textFieldMark]: {viewAttr: 2},
    [selectFieldMark]: {viewAttr: 3}
}
formSdk.changeMoreField(changeDatas, changeVariable);

// 修改明细表的字段数据
// 获取到明细行,细节略
const rowId = "123456789";
// 获取明细字段, 细节略
const mxField = "7899456";
formSdk.changeMoreField({
    [`${mxField}_${rowId }`] : {value: "text content"}
});
```



### 3.7 根据字段ID获取字段信息

> ***getFieldInfo: (fieldMark: string) => void;\***

**参数说明**

| **参数**  | **类型** | **必需** | **说明**                           |
| --------- | -------- | -------- | ---------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识，格式为: {字段Id} |

**返回值**

| **参数**     | **类型** | **说明**                   |
| ------------ | -------- | -------------------------- |
| fieldId      | String   | 字段id                     |
| dataKey      | String   | 字段可见的key标记, 3.1使用 |
| name         | String   | 字段名称                   |
| componentKey | String   | 字段key标识                |
| isSingle     | boolean  | 是否单选                   |
| readOnly     | boolean  | 是否只读                   |
| required     | boolean  | 是否必填                   |

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const textFieldMark = formSdk.convertFieldNameToId("wbk");
const fieldInfo = formSdk.getFieldInfo(textFieldMark);
// id、title、componentKey、required...
console.log(fieldInfo);
```



### 3.8 获取表单下所有字段

> ***listFieldInfo(): any;\***

**参数说明** 无

**返回值**

| **参数**     | **类型** | **说明**                   |
| ------------ | -------- | -------------------------- |
| fieldId      | String   | 字段id                     |
| dataKey      | String   | 字段可见的key标记, 3.1使用 |
| name         | String   | 字段名称                   |
| componentKey | String   | 字段key标识                |
| isSingle     | boolean  | 是否单选                   |
| readOnly     | boolean  | 是否只读                   |
| required     | boolean  | 是否必填                   |

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取所有字段
const fieldInfos = formSdk.listFieldInfo();
console.log(fieldInfos);
```



### 3.9 触发指定字段涉及的所有联动

> ***triggerFieldAllLinkage(): any;\***
>
> ***说明 手动触发一次字段涉及的所有联动，包括字段联动、函数公式、显示属性联动、数据钻取、选择框联动、bindPropertyChange事件绑定等; 注：触发类型为值变更触发; 如果是明细字段，需要指定触发行;\***

**参数说明**

| **参数**  | **类型** | **必需** | **说明**                           |
| --------- | -------- | -------- | ---------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识，格式为: {字段Id} |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段    
const fieldMark = formSdk.convertFieldNameToId("wbk");
// 触发该字段的联动    
formSdk.triggerFieldAllLinkage(fieldMark);

// 获取明细内字段fieldId
const mxFieldMark = formSdk.convertFieldNameToId("mx_wbk");
// 获取明细表fieldId
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取第一行的rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 触发该明细字段指定行的联动    
formSdk.triggerFieldAllLinkage(`${mxFieldMark}_${oneRowId}`);
```



### 3.10 获取单个字段的读写属性(只读/必填等)

> ***getFieldAttr(fieldMark: string): number;\***

**参数说明**

| **参数**  | **类型** | **必需** | **说明**                           |
| --------- | -------- | -------- | ---------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识，格式为: {字段Id} |

**返回值** 1：只读，2：可编辑，3：必填，4: 隐藏，5: 隐藏行

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段    
const fieldMark = formSdk.convertFieldNameToId("wbk");
// 获取该字段的读写属性    
formSdk.getFieldAttr(fieldMark);

// 获取明细内字段fieldId
const mxFieldMark = formSdk.convertFieldNameToId("mx_wbk");
// 获取明细表fieldId
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取第一行的rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 获取该明细字段指定行的读写属性   
formSdk.getFieldAttr(`${mxFieldMark}_${oneRowId}`);
```



### 3.11 根据字段ID获取字段com

> *getFieldCom(fieldMark: string): any;*
>
> **注：不低于240701基线**

**参数说明**

| **参数**  | **类型** | **必需** | **说明**                           |
| --------- | -------- | -------- | ---------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识，格式为: {字段Id} |

**返回值**

| **属性** | **类型** | **说明** |
| -------- | -------- | -------- |
| id       | String   | 组件id   |
| type     | String   | 组件类型 |
| config   | Object   | 字段信息 |

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const textFieldMark = formSdk.convertFieldNameToId("wbk");
const fieldInfo = formSdk.getFieldInfo(textFieldMark);
// id、type、config
console.log(fieldInfo);
```



### 3.12 获取单个字段的数据对象

> *getFieldObj: (fieldMark: string) => any;*
>
> **注：不低于240701基线**

**参数说明**

| **参数**  | **类型** | **必需** | **说明**                                                     |
| --------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark | String   | 是       | 字段Id、字段标识，格式为: {字段Id}和field${字段ID}_${明细行号} |

**返回值**

| **属性**   | **类型** | **说明**                                                     |
| ---------- | -------- | ------------------------------------------------------------ |
| value      | string   | 修改的值，文本型                                             |
| specialObj | Array    | 浏览按钮信息，数组格式，如：[{id: "718974312893816832", name: "report demo1"}] |
| longitude  | number   | 地理位置，经度                                               |
| latitude   | number   | 地理位置，纬度                                               |
| type       | string   | 数据类型，适用于如金额币种，**不低于：241201基线**           |
| contentObj | obj      | 特殊类型的数据结构，**不低于：241201基线**                   |

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("wbk");
// 获取单个字段的数据对象
const fieldObj = formSdk.getFieldObj(fieldMark);


// 获取明细行的字段数据对象
// 获取明细表内字段fieldId
const mxFieldMark = formSdk.convertFieldNameToId("mx_wbk");
// 获取明细表fieldId
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取第一行的rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 获取明细字段的指定行， 注：示例用的ES6拼接字符串
formSdk.getFieldObj(`${mxFieldMark}_${oneRowId}`);
```



## 4.字段事件绑定、组件复写

### 4.1 表单字段值变化触发事件

> ***bindFieldChangeEvent: (fieldMarkStr: any, fun: (id?: string, value?: string) => void) => void;\***
>
> ***字段值变化即会触发所绑定的函数，可多次绑定，按照绑定顺序触发\***
>
> **注：\*****字段联动带出的，不会触发该事件\*****，且极容易产生死循环，因此，想要监听联动带出产生的变化，请使用2.2的‘数据联动执行后’**

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                                     |
| ------------ | -------- | -------- | ------------------------------------------------------------ |
| fieldMarkStr | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}*{明细行Id}, 多个字段使用,分隔；***注意!!!：明细行用*隔开，多个字段批量绑定用,*** |
| fun          | Function | 是       | 字段值变化触发的自定义函数，函数默认传递以下参数，data:{id: fieldMark, value：修改后的值} |
| ext          | Object   | 否       | 扩展参数                                                     |

**ext**

> **至少250401基线**

| **参数** | **类型** | **必须** |                                                              |
| -------- | -------- | -------- | ------------------------------------------------------------ |
| scope    | String   | 否       | 事件范围，配置联动触发如：window.WeFormSDK.CHANGE_EVENT_SCOPE，注意，值变更，不含添加、删除明细行 |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const textFieldMark = formSdk.convertFieldNameToId("wbk");
const selectFieldMark = formSdk.convertFieldNameToId("xlk");
// 绑定单个字段
formSdk.bindFieldChangeEvent(textFieldMark, (data) => {

});

// 绑定字段，设置联动触发改值变更，注意，值变更，不含添加、删除明细行
formSdk.bindFieldChangeEvent(textFieldMark, (data) => {

}, { scope: window.WeFormSDK.CHANGE_EVENT_SCOPE });


// 绑定多个字段
formSdk.bindFieldChangeEvent(`${textFieldMark},${selectFieldMark}`, (data) => {
    // 取字段标识
    const fieldMark = data.id;
    // 取字段修改的值
    const value = data.value;
    console.log(data);
});
```



### 4.2 明细字段值变化触发事件

> ***bindDetailFieldChangeEvent: (fieldMarkStr: string, fun: (data: any) => void) => void;\***
>
> ***绑定后对新添加的明细行字段以及加载的已有行明细字段，值变更触发所绑定的事件\***

| **参数**     | **类型** | **必须** | **说明**                                                     |
| ------------ | -------- | -------- | ------------------------------------------------------------ |
| fieldMarkStr | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}, 多个字段使用,分隔 |
| fun          | Function | 是       | 字段值变化触发的自定义函数，函数默认传递以下参数，data:{id: fieldMark, value：context} |

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表内的字段fieldId
const textFieldMark = formSdk.convertFieldNameToId("wbk");
const selectFieldMark = formSdk.convertFieldNameToId("xlk");
// 绑定事件，对明细表整列字段绑定
formSdk.bindDetailFieldChangeEvent(`${textFieldMark},${selectFieldMark}`, (data) => {
    // 取字段标识
    const fieldMark = data.id;
    // 取字段修改的值
    const value = data.value;
    // 修改行号
    const rowId = data.rowId;
    console.log(data);
});
```



### 4.3 字段区域绑定动作事件

> ***bindFieldAction: (type: "onblur" | "onfocus" | "onclick" | "ondbclick" | "mouseover" | "mouseout", fieldMarkStr: string, fun: (data: any) => void) => void;\***

> **注：不是所有字段都有全部的区域事件，有些字段没有或者区域很小，如果有较强需求，可易用4.5追加元素、按钮的形式实现**

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                                     |
| ------------ | -------- | -------- | ------------------------------------------------------------ |
| type         | String   | 是       | 动作类型，见上表                                             |
| fieldMarkStr | String   | 是       | 字段标示，格式field${字段ID}和field${字段ID}_${明细行号}， 多个字段使用,分隔 |
| fun          | Function | 是       | 字段值变化触发的自定义函数，函数默认传递以下参数，data:{id: fieldMark, value：context} |

**类型说明**

| **类型**  | **说明**                                     |
| --------- | -------------------------------------------- |
| onblur    | 失去焦点事件，仅支持单行文本类型             |
| onfocus   | 获取焦点事件，仅支持单行文本字段类型         |
| onclick   | 单击事件，字段所在单元格区域单击触发         |
| ondbclick | 双击事件，字段所在单元格区域双击触发         |
| mouseover | 鼠标移入事件，鼠标移入字段所在单元格区域触发 |
| mouseout  | 鼠标移出事件，鼠标移出字段所在单元格区域触发 |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const textFieldMark = formSdk.convertFieldNameToId("wbk");
const selectFieldMark = formSdk.convertFieldNameToId("xlk");
// 绑定事件，对明细表整列字段绑定
formSdk.bindFieldAction("onblur", `${textFieldMark},${selectFieldMark}`, (data) => {
    // 取字段标识
    const fieldMark = data.id;
    // 取字段修改的值
    const value = data.value;
    // 修改行号
    const rowId = data.rowId;
    console.log(data);
});
```



### 4.4 自定义渲染表单字段

> ***proxyFieldComp(fieldMark: string, el: React.Component, range: string | undefined): void;\***

**参数说明**

| **参数**  | **类型**        | **必须** | **说明**                                                     |
| --------- | --------------- | -------- | ------------------------------------------------------------ |
| fieldMark | string          | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}, 注: 明细字段不传行号, 为整列生效 |
| el        | React.Component | 是       | 渲染的组件, 建议用React, js语法请自行查询                    |
| range     | string          | 否       | 作用范围，默认全部，(1:只读、2:可编辑、3:必填),组合后逗号分隔 |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段的fieldId
const fieldMark = formSdk.convertFieldNameToId('dxwb_md31');
// 复写指定组件，全部状态, 用react
formSdk.proxyFieldComp(fieldMark, React.createElement('div', {fieldMark}, "Copy the content of a multiline text component"));
// 复写编辑状态下的组件，用html格式
formSdk.proxyFieldComp(fieldMark, "Copy the content of a multiline text component", '2');
// 复写明细字段，指定行复写

// 获取明细表fieldId
const detailMark = formSdk.convertFieldNameToId('mx_detail_dt1');
// 获取第一行的行Id、rowId
const detailRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 获取明细内字段fieldId
const fieldMark = formSdk.convertFieldNameToId('mx_dxwb_md31');
// 复写指定行的组件，全部状态, 用react; 注：以下示例为ES6语法的拼接字符串，等同于 fieldMark"_"+detailRowId"
formSdk.proxyFieldComp(`${fieldMark}_${detailRowId}`, React.createElement('div', {fieldMark}, "Copy the content of a multiline text component"));
```



### 4.5 自定义追加渲染表单字段

> ***afterFieldComp(fieldMark: string, el: React.Component, range: string | undefined): void;\***

**参数说明**

| **参数**  | **类型**        | **必须** | **说明**                                                     |
| --------- | --------------- | -------- | ------------------------------------------------------------ |
| fieldMark | string          | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}, 注: 明细字段不传行号, 为整列生效 |
| el        | React.Component | 是       | 渲染的组件, 建议用React, js语法请自行查询                    |
| range     | string          | 否       | 作用范围，默认全部，(1:只读、2:可编辑、3:必填),组合后逗号分隔 |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 复写组件
const fieldMark = formSdk.convertFieldNameToId('dxwb_md31');
// 指定组件后追加，全部状态, 用react
formSdk.afterFieldComp(fieldMark, React.createElement('div', {fieldMark}, "Append the content of the multiline text component"));
// 编辑状态下的组件追加，用html格式
formSdk.afterFieldComp(fieldMark, "Append the content of the multiline text component", '2');
// 明细字段的示例，参考4.4的明细字段
```



### 4.6 函数式自定义渲染表单字段

> ***proxyFieldContentComp(fieldMark: string, fun: any): void;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                     |
| --------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark | string   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}, 注: 明细字段不传行号, 为整列生效 |
| fun       | Function | 是       | 代理的函数，此函数必须有返回值，返回自定义渲染的组件 info 字段基础信息，包括字段值、字段属性等等 compFn 代理前原字段组件函数，可通过此函数获取原组件 |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 复写组件
const fieldMark = formSdk.convertFieldNameToId('dxwb_md31');
// 用函数式，可根据条件控制渲染组件
formSdk.proxyFieldContentComp(fieldMark, (props, component) => {
    return React.createElement('div', {fieldMark}, "Function rendering the content of a multiline text component");
});
// 明细字段的示例，参考4.4的明细字段
```



### 4.7 表单字段读写属性变化事件

> ***proxyFieldContentComp(fieldMark: string, fun: any): void;\***

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                                     |
| ------------ | -------- | -------- | ------------------------------------------------------------ |
| fieldMarkStr | string   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}, 多个字段使用,分隔 |
| fun          | Function | 是       | 字段读写属性变化的事件回调                                   |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const textFieldMark = formSdk.convertFieldNameToId("wbk");
// 绑定事件，对主表字段和明细表的某一行绑定
formSdk.bindFieldAttrChangeEvent(`${textFieldMark}`, (data) => {
    // 取字段标识
    const fieldId = data.fieldId;
    console.log(data);
});
```



## 5.明细表操作相关

### 5.1 添加明细行并设置初始值

> ***addDetailRow: (detailMark: string, initAddRowData?: any) => void;\***

**参数名称**

| **参数**       | **类型** | **必须** | **说明**                                                     |
| -------------- | -------- | -------- | ------------------------------------------------------------ |
| detailMark     | String   | 是       | 明细表Id、明细表标识                                         |
| initAddRowData | Object   | 否       | 给新增后设置初始值， ***注意：数据的格式，与3.3修改单个值一直、通用\*** |
| config         | Object   | 否       | **所有属性，false：不执行， true：执行，默认系统的，不低于241201基线\****数据联动(含字段联动、函数公式、数据钻取)**数据联动 dataLinkage?: boolean;  显示联动 viewLinkage?: boolean;选项联动 optionLinkage?: boolean; jsApi值变更 jsApiChange?: boolean; |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表fieldId
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取明细内字段fieldId
const detailFieldMark = formSdk.convertFieldNameToId("dhwb_12sr1");
const detailFieldMark2 = formSdk.convertFieldNameToId("dhwb_12sr2");
// 添加行并设置默认值
formSdk.addDetailRow(detailMark, {[detailFieldMark]: {value: "context"}, [detailFieldMark2]: {specialObj: [{id: "7189743128938875416888", name: "名称"}]}})
```



### 5.2 删除明细表指定行/全部行

> ***delDetailRow: (detailMark: string, rowIdMark: string) => void;\***

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                              |
| ------------ | -------- | -------- | ----------------------------------------------------- |
| detailMark   | String   | 是       | 明细表标示，格式field${明细ID}                        |
| rowIndexMark | String   | 是       | 需要删除的行标示，删除全部行:all, 删除部分行：”1,2,3” |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 删除行号,根据rowId
formSdk.delDetailRow(detailMark, "17866566556566");
// 删除全部行
formSdk.delDetailRow(detailMark, "all"); 
```



### 5.3 获取明细表所有行Id

> ***getDetailAllRowIndexStr: (detailMark: string) => string;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**             |
| ---------- | -------- | -------- | -------------------- |
| detailMark | String   | 是       | 明细表Id、明细表标识 |

**返回值** string, 多个用逗号隔开, 如: "803945585040474130,803945585040474136,803945585040474142"

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取明细表行标识、也叫：明细行Id、rowId
const rowIdStr = formSdk.getDetailAllRowIndexStr(detailMark);
// 803945585040474130,803945585040474136,803945585040474142
```



### 5.4 获取明细表总行数

> ***getDetailRowCount(detailMark: string): string;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**             |
| ---------- | -------- | -------- | -------------------- |
| detailMark | String   | 是       | 明细表Id、明细表标识 |

**返回值** number

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 3
const detailRowStr = formSdk.getDetailRowCount(detailMark);
```



### 5.5 获取明细表行下标，根据明细行Id

> ***getDetailRowSerailNum(detailMark: string, rowId: string): string;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                       |
| ---------- | -------- | -------- | ------------------------------ |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID} |
| rowId      | String   | 是       | 明细表行Id、rowId              |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 这是结果的所在行下标：3
const detailRowStr = formSdk.getDetailRowSerailNum(detailMark, "805922304979501066");
```



### 5.6 添加明细时默认复制最后一行记录

> ***setDetailAddUseCopy(detailMark: string, needCopy: boolean): void;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                                    |
| ---------- | -------- | -------- | ------------------------------------------- |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID}              |
| needCopy   | Boolean  | 否       | 是否需要启用复制，true：启用，false：不启用 |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 复制最后一行
formSdk.setDetailAddUseCopy(detailMark, true);
```



### 5.7 根据明细行标识和rowIndex下标，获取rowId行号

> ***getDetailRowIdByIndex: (detailMark: string, rowIndex: number) => string;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                                             |
| ---------- | -------- | -------- | ---------------------------------------------------- |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID}                       |
| rowIndex   | number   | 是       | 明细行下标，从1开始，如：1、2、3; 注：按照显示顺序来 |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
//获取明细表id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取第一行的rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
```



### 5.8 根据明细行标识和rowId行号，获取rowIndex下标

> ***getDetailIndexByRowId: (detailMark: string, rowId: string) => string;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                       |
| ---------- | -------- | -------- | ------------------------------ |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID} |
| rowIndex   | string   | 是       | 明细行Id、rowId                |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取明细表id
const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
// 获取明细表行Id的下标位置
const rowIndex = formSdk.getDetailIndexByRowId(detailMark, '805922304979501066');
```



### 5.9 选中明细指定行/全部行

> ***checkDetailRow(detailMark: string, rowIndexMark: string | undefined, needClearBeforeChecked: boolean | undefined): void;\***

**参数说明**

| **参数**               | **类型** | **必须** | **说明**                                                     |
| ---------------------- | -------- | -------- | ------------------------------------------------------------ |
| detailMark             | String   | 是       | 明细表标示，格式field${明细ID}                               |
| rowIndexMark           | string   | 是       | 需要选中的行标示，选中全部行:all,选中部分行：”805922304979501066,805922304979501067,805922304979501068” |
| needClearBeforeChecked | boolean  | 否       | 是否需要清除已选                                             |

**返回值** void

**示例**

```javascript
// 此方法可灵活使用，依靠参数needClearBeforeChecked可实现清除选中的逻辑  
 
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 明细表id
const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
// 选中所有行
formSdk.checkDetailRow(detailMark, "all");

// 获取第1行rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 选中第一行
formSdk.checkDetailRow(detailMark, oneRowId, true);
// 根据rowId选中指定行
formSdk.checkDetailRow(detailMark, '167954015280618401,167954015280624841');
// 清空其他行且选中当前传入的两行
formSdk.checkDetailRow(detailMark, '167954015280618401,167954015280624841', true);
// 清空所有行
formSdk.checkDetailRow(detailMark, '', true);
```



### 5.10 获取明细表选中行下标

> ***getDetailCheckedRowIndexStr(detailMark: string): string;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                       |
| ---------- | -------- | -------- | ------------------------------ |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID} |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 明细表id
const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
// 获取选中行的rowId;result: 167954015280618401,167954015280624841
formSdk.getDetailCheckedRowIndexStr(detailMark)
```



### 5.11 控制明细数据行的显示及隐藏

> ***controlDetailRowDisplay(detailMark: string, rowIndexMark: string, needHide: boolean): void\***

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                                     |
| ------------ | -------- | -------- | ------------------------------------------------------------ |
| detailMark   | String   | 是       | 明细表标示，格式field${明细ID}                               |
| rowIndexMark | String   | 是       | 需要控制的行标示，全部行:all,部分行：”805922304979501066,805922304979501067,805922304979501068” |
| needHide     | String   | 是       | 是否隐藏行，true:隐藏，false:显示                            |

**返回值** void

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 明细表id
const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
// 设置行隐藏
formSdk.controlDetailRowDisplay(detailMark, '167954015280618401,167954015280624841', true);
```



### 5.12 设置明细表顶部操作菜单

> ***setDetailTopAction: (detailMark: string, actions: TableActionType[]) => void\***

**参数说明**

| **参数**   | **类型**          | **必须** | **说明**                       |
| ---------- | ----------------- | -------- | ------------------------------ |
| detailMark | String            | 是       | 明细表标示，格式field${明细ID} |
| actions    | TableActionType[] | 是       | 菜单列表                       |

**菜单类型**

> ***TableActionType\***

| **参数** | **类型** | **必须** | **说明**                  |
| -------- | -------- | -------- | ------------------------- |
| id       | string   | 是       | 唯一标识, 要符合React语法 |
| type     | string   | 否       | 类型，理论上与id相同      |
| title    | string   | 否       | 标题                      |

**返回值** void

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 明细表id
const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
// 设置明细表菜单
formSdk.setDetailTopAction(detailMark, [{id: 'btn', type: 'btn', title: 'BTN', mode: "text"}, {
    id: 'custom',
    type: 'custom',
    customRender: () => React.createElement("div", {}, "BTN2")
}]);
```



### 5.13 获取明细表数据

> ***getDetailData: (detailMark: string) => any\***
>
> **注：不低于240601基线**
>
> **提示：该API返回的数据包含rowId属性，注意不要把rowId写入到其他明细表的数据中，会造成rowId混乱，导致明细数据无法删除掉**

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                       |
| ---------- | -------- | -------- | ------------------------------ |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID} |



**返回值** object

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 明细表id
const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
// 获取明细表整表数据
formSdk.getDetailData(detailMark);
```



### 5.14 获取明细表某一行数据

> ***getDetailRowData: (detailMark: string, rowId: string) => any\***
>
> **注：不低于240601基线**
>
> **提示：该API返回的数据包含rowId属性，注意不要把rowId写入到其他明细表的数据中，会造成rowId混乱，导致明细数据无法删除掉**

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                       |
| ---------- | -------- | -------- | ------------------------------ |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID} |
| rowId      | string   | 是       | 明细表行Id、rowId              |



**返回值** object

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 明细表id
const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
// 获取第一行的rowId
const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
// 获取明细表第一行的数据
formSdk.getDetailRowData(detailMark, oneRowId);
```



### 5.15 控制明细行check框是否禁用勾选

> ***controlDetailRowDisableCheck(detailMark: string, rowIndexMark: string, disableCheck: boolean) => void\***
>
> **注：不低于240401基线**

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                                     |
| ------------ | -------- | -------- | ------------------------------------------------------------ |
| detailMark   | String   | 是       | 明细表标示，格式field${明细ID}                               |
| rowIndexMark | String   | 是       | 需要控制的行标示，全部行:all,部分行：”805922304979501066,805922304979501067,805922304979501068” |
| disableCheck | String   | 是       | 是否禁用勾选，true:置灰禁止勾选，false:允许勾选”             |

**返回值** void

**示例**

```javascript
   // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
   // 明细表id
   const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
    // 获取第一行的rowId
    const oneRowId = formSdk.getDetailRowIdByIndex(detailMark, 1);
   // 明细表第一行禁用勾选
   formSdk.controlDetailRowDisableCheck(detailMark, oneRowId, true);
   // 明细表所有行禁用勾选
   formSdk.controlDetailRowDisableCheck(detailMark, "all", true);
   // 明细表所有行允许勾选
   formSdk.controlDetailRowDisableCheck(detailMark, "all", false);
```



### 5.16 获取明细表内的明细字段id

> getDetailFieldIds(detailMark: string, prefix?: boolean)=> any
>
> **注：不低于240701基线**

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                                   |
| ---------- | -------- | -------- | ------------------------------------------ |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID}             |
| prefix     | Boolean  | 否       | 返回值是否需要field字符串前缀，默认为false |

**返回值** void

**示例**

```javascript
   // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
   // 明细表id
   const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
   // 获取明细表内的明细字段id, 多个用逗号隔开
   formSdk.getDetailFieldIds(detailMark);
```



### 5.17 设置添加明细时默认使用最后一行的数据

> setDetailAddDefLast(detailMark: string, needCopy: boolean) => void
>
> **注：不低于240701基线**

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                                    |
| ---------- | -------- | -------- | ------------------------------------------- |
| detailMark | String   | 是       | 明细表标示，格式field${明细ID}              |
| needCopy   | Boolean  | 否       | 是否需要启用复制，true：启用，false：不启用 |

**返回值** void

**示例**

```javascript
    // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
   // 明细表id
   const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
    // 开启
    formSdk.setDetailAddUseCopy(detailMark, true);    
    // 关闭
    formSdk.setDetailAddUseCopy(detailMark, true);
```



### 5.18 指定明细行显示排序

> setDetailSortRows(detailMark: string, rowIndexMark: string, orderType: string): void
>
> **注：不低于241101基线**

**参数说明**

| **参数**     | **类型** | **必须** | **说明**                                                  |
| ------------ | -------- | -------- | --------------------------------------------------------- |
| detailMark   | String   | 是       | 明细表标示，格式field${明细ID}                            |
| rowIndexMark | String   | 是       | 明细行号显示顺序，”473044744549114135,473044744549210868” |
| orderType    | String   | 否       | 顺序类型，前后（'before' \| 'after'）， 默认before        |

**返回值** void

**示例**

```javascript
    // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
    // 明细表id
    const detailMark = formSdk.convertFieldNameToId('shm_glsj_mxb1');
    // 指定两行明细显示在前面
    formSdk.setDetailSortRows(detailMark, "473044744549114135,473044744549210868");
    // 指定两行明细显示在前面
    formSdk.setDetailSortRows(detailMark, "473044744549114135,473044744549210868", "before")
    // 指定两行明细显示在最后
    formSdk.setDetailSortRows(detailMark, "473044744549114135,473044744549210868", "after");
```



### 5.19 批量添加明细数据

> **addDetailData: (detailMark: string, detailDatas: any[], config?: WeFormApiOperValueConfig | undefined) => void;**
>
> **注：不低于241201基线**

**参数说明**

| **参数**    | **类型** | **必须** | **说明**                                                     |
| ----------- | -------- | -------- | ------------------------------------------------------------ |
| detailMark  | String   | 是       | 明细表标示，格式field${明细ID}                               |
| detailDatas | array    | 是       | **明细数据数组, 对象格式与3.2一致**                          |
| config      | Object   | 否       | **所有属性，false：不执行， true：执行，默认系统的\****数据联动(含字段联动、函数公式、数据钻取)**数据联动 dataLinkage?: boolean;  显示联动 viewLinkage?: boolean;选项联动 optionLinkage?: boolean; jsApi值变更 jsApiChange?: boolean; |

**返回值** void

**示例**

```javascript
    // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
    // 获取明细表fieldId
    const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
    // 获取明细表内字段fieldId
    const detailFieldId = formSdk.convertFieldNameToId("dhwb_12sr2");
    // 批量添加明细数据
    formSdk.addDetailData(detailMark, [
        {[detailFieldId]: {value: "row11"}},
        {[detailFieldId]: {value: "row22"}}
    ]);
    // 批量添加明细数据，并设置不执行联动
    formSdk.addDetailData(detailMark, [
        {[detailFieldId]: {value: "row11"}},
        {[detailFieldId]: {value: "row22"}}
    ], {dataLinkage: false})
```



**数据结构展示**

> 两行两列结构，可使用【getDetailData】获取已填写数据查看结构

```json
[
    {
        "field1120947715279609858": {
            "value": "11"
        },
        "field1120947715279609859": {
            "value": "12"
        }
    },
    {
        "field1120947715279609858": {
            "value": "21"
        },
        "field1120947715279609859": {
            "value": "21"
        }
    }
]
```



### 5.20 批量更新明细数据

> changeDetailData**: (detailMark: string, detailDatas: any[], config?: WeFormApiOperValueConfig | undefined) => void;**
>
> **注：不低于250101基线**

**参数说明**

| **参数**    | **类型** | **必须** | **说明**                                                     |
| ----------- | -------- | -------- | ------------------------------------------------------------ |
| detailMark  | String   | 是       | 明细表标示，格式field${明细ID}                               |
| detailDatas | array    | 是       | **明细数据数组, 对象格式与3.2一致**，对象中**固定有rowId属性**，详情参见示例； 说明: **如果rowId不存在则生成新的** |
| config      | Object   | 否       | **所有属性，false：不执行， true：执行，默认系统的\****数据联动(含字段联动、函数公式、数据钻取)**数据联动 dataLinkage?: boolean;  显示联动 viewLinkage?: boolean;选项联动 optionLinkage?: boolean; jsApi值变更 jsApiChange?: boolean; |

**返回值** void

**示例**

```javascript
    // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
    // 获取明细表fieldId
    const detailMark = formSdk.convertFieldNameToId("mxbo16sr2");
    // 获取明细表内字段fieldId
    const detailFieldId = formSdk.convertFieldNameToId("dhwb_12sr2");
    // 批量添加明细数据
    formSdk.changeDetailData(detailMark, [
        {rowId:"122456",[detailFieldId]: {value: "row1"}},
        {rowId:"78958", [detailFieldId]: {value: "row2"}}
    ]);
    // 批量添加明细数据，并设置不执行联动
    formSdk.changeDetailData(detailMark, [
        {rowId:"122456",[detailFieldId]: {value: "row1"}},
        {rowId:"78958",[detailFieldId]: {value: "row2"}}
    ], {dataLinkage: false})
```



## 6.表单全局操作

### 6.1 获取当前打开表单的基础信息

> ***getBaseInfo: () => Object;\***

**返回值** object

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
const formInfo = formSdk.getBaseInfo();
console.log(formInfo);
```



### 6.2 可控制显示时间的message信息

> ***showMessage(msg: string, type?: number, duration?: number, isStatic?: boolean): void;\***

**参数说明**

| **参数** | **类型** | **必须** | **说明**                                                     |
| -------- | -------- | -------- | ------------------------------------------------------------ |
| msg      | String   | 是       | 提示信息内容                                                 |
| type     | Number   | 是       | 提示类型，1(警告)、2(错误)、3(成功)，默认为1，不同类型提示信息效果不同 |
| duration | Number   | 是       | 多长时间自动消失，单位秒，默认为1.5秒                        |

**返回值** void

**示例**

```javascript
// 普通提示
window.WeFormSDK.showMessage("This is a success prompt", 3, 2);
```



### 6.3 系统样式的Confirm确认框

> **基于公共组件的\****Dialog.confirm， 如果不满足直接使用Dialog，或咨询公共组：揭志胜**

> ***showConfirm(content: string, okEvent?: () => void, cancelEvent?: () => void, otherInfo?: Object, isStatic?: boolean): void;\***

**参数说明**

| **参数**    | **类型** | **必须** | **说明**             |
| ----------- | -------- | -------- | -------------------- |
| content     | String   | 是       | 确认信息             |
| okEvent     | Function | 是       | 点击确认事件         |
| cancelEvent | Function | 否       | 点击取消事件         |
| otherInfo   | Object   | 否       | 自定义信息(按钮名称) |

**返回值** void

**示例**

```javascript
// 弹确认框的title
window.WeFormSDK.showConfirm("这是一个二次确认框",
    () => {
        // 点击确认回调
    },
    () => {
        // 点击取消回调
    },
    {
        title: "信息确认",        // 弹确认框的title，仅PC端有效
        okText: "需要",          // 自定义确认按钮名称
        cancelText: "不需要"     // 自定义取消按钮名称
    }
);
```



### 6.4 自定义弹框

> ***openCustomDialog(prop:any): any;\***
>
> ***基于公共组件Dialog.confirm组件，如有不满足，请直接使用Dialog弹框，如需要详细案例，请咨询云商店模块\***

**参数说明**

| **参数** | **类型**       | **必须** | **说明**                                         |
| -------- | -------------- | -------- | ------------------------------------------------ |
| content  | string、Object | 是       | 弹框展示内容，字符串或DOM                        |
| icon     | string         | 否       | 弹框图标                                         |
| style    | Object         | 否       | 自定义样式                                       |
| footer   | any[]          | 否       | 底部按钮DOM，多个， 有值不再出现默认按钮         |
| onOk     | Function       | 否       | 点击确认事件，点击会自动关闭，默认确认按钮的事件 |
| onCancel | Function       | 否       | 点击取消事件，点击会默认关闭，默认确认按钮的事件 |
| width    | string、number | 否       | 宽度                                             |
| height   | string、number | 否       | 高度                                             |
| bottom   | string、number | 否       | 底部距离                                         |
| left     | string、number | 否       | 左侧距离                                         |
| right    | string、number | 否       | 右侧距离                                         |

**返回值**

| **参数** | **类型** | **说明** |
| -------- | -------- | -------- |
| destroy  | Function | 销毁弹框 |

**示例**

```javascript
window.WeFormSDK.openCustomDialog({
    content: "This is the pop-up content",
    width: "500px",
    height: "500px"
});

// ecode里面写法自定义按钮，footer属性演示
// 导入UI包的组件
import { Button } from '@weapp/ui';

const onClickCancel = () => dialogComponent?.destroy();
const dialogComponent = window.WeFormSDK.openCustomDialog({
  content: "This is the pop-up content",
  width: "500px",
  height: "500px",
  footer: [<Button title="关闭" type="default" onClick={onClickCancel}>关闭</Button>]
});
```



### 6.5 刷新表单页面

> ***reloadPage: (params?: any) => void;\***

**参数说明**

| **参数** | **类型** | **必须** | **说明**                   |
| -------- | -------- | -------- | -------------------------- |
| params   | Object   | 否       | 自定义参数，覆盖默认参数ID |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
formSdk.reloadPage();
```



### 6.6 扩展提交操作发送给服务端的参数

> ***appendSubmitParam: (params?: any) => void;\***

**参数说明**

| **参数** | **类型** | **必须** | **说明**                   |
| -------- | -------- | -------- | -------------------------- |
| params   | Object   | 否       | 自定义参数，覆盖默认参数ID |

**返回值** 无

**示例**

```javascript
// 获取表单实例
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
formSdk.appendSubmitParam({customParam: {type: "demo"}});
```



### 6.7 触发一次必填验证

> ***verifyFormRequired: (mustAddDetail?: Boolean, fieldRequired?: Boolean) => any;\***

**参数说明**

| **参数**      | **类型** | **必须** | **说明**                           |
| ------------- | -------- | -------- | ---------------------------------- |
| mustAddDetail | Boolean  | 否       | 自是否校验必须新增空明细，默认为是 |
| fieldRequired | Boolean  | 否       | 是否校验字段必填，默认为是         |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 触发一次必填验证
formSdk.verifyFormRequired();
```



### 6.8 页面全局Loading

> ***getLoadingGlobal: () => any;\***

**参数说明** 无

**返回值** 无

**示例**

```javascript
// 启用遮罩loading
WeFormSDK.getLoadingGlobal().start();
// 停止遮罩loading
WeFormSDK.getLoadingGlobal().end();
// 销毁遮罩loading
WeFormSDK.getLoadingGlobal().destroy();
//具体使用根据业务场景需求，正常使用可以直接调用1、3就可以
```



### 6.9 控制表单关闭提示状态

> ***setFormTipCloseStatus: (open: boolean) => void;\***

**参数说明**

| **参数** | **类型** | **必须** | **说明**                                        |
| -------- | -------- | -------- | ----------------------------------------------- |
| open     | Boolean  | 是       | false为关闭弹框提示，true为打开提示，默认为true |

**返回值** void

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 关闭弹框提示
formSdk.setFormTipCloseStatus(false);
```



### 6.10 是否移动端, true表示是e-mobile、微信、钉钉等移动终端，false代表PC端

> ***isMobile(): boolean;\***

**返回值** boolean

**示例**

```javascript
// 方式1， 通过对象静态方法调用，返回根据环境的check
window.WeFormSDK.isMobile()

// 方式2， 通过表单实例的调用，返回表单的isMobile属性
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
formSdk.isMobile();
```



## 7.特定字段类型操作

### 7.1 扩展浏览按钮取数接口参数值

> ***appendBrowserDataUrlParam: (fieldMark: string, jsonParam: any) => void;\***
>
> ***限定条件：仅适用浏览按钮类型 场景：控制浏览按钮可选数据范围，限定范围、依赖表单字段过滤数据范围等;对联想输入范围及弹窗选择范围都生效;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                |
| --------- | -------- | -------- | ------------------------------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id} |
| jsonParam | Object   | 是       | 扩展的url参数，发请求会带上这个对象在中的所有属性       |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("llan", "main", true);
// 加入要扩展参数, 如: {str: "custom"}
formSdk.appendBrowserDataUrlParam(fieldMark, {str: "custom"});
// 加入要扩展参数, 如: {a: "custom", b:"demo", c:{w:"w"}}
formSdk.appendBrowserDataUrlParam(fieldMark, {str: "custom"});
```



### 7.2 获取浏览按钮选项Id值

> ***getBrowserOptionId: (fieldMark: string, splitChar?: string) => string;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                |
| --------- | -------- | -------- | ------------------------------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id} |
| splitChar | String   | 是       | 分隔符，默认是,                                         |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("llan");
// 获取选中的浏览的id
const browserIdStr = formSdk.getBrowserOptionId(fieldMark, ",");
```



### 7.3 获取浏览按钮的显示值

> ***getBrowserShowName: (fieldMark: string, splitChar?: string) => string;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                |
| --------- | -------- | -------- | ------------------------------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id} |
| splitChar | String   | 是       | 分隔符，默认是,                                         |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("llan");
// 获取选中的浏览的名称
const browserNameStr = formSdk.getBrowserShowName(fieldMark, ",");
```



### 7.4 移除选择框字段选项

> ***removeSelectOption: (fieldMark: string, optionKeys: string) => void;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                                                |
| ---------- | -------- | -------- | ------------------------------------------------------- |
| fieldMark  | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id} |
| optionKeys | String   | 是       | 需要移除的Option选项key值，多个以逗号分隔               |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("fxk");
// 移出选中的选项
formSdk.removeSelectOption(fieldMark, '845584790598795269,845584790598795270');
```



### 7.5 获取选择框字段的显示值

> ***getSelectShowName: (fieldMark: string, splitChar?: string) => string;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                |
| --------- | -------- | -------- | ------------------------------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id} |
| splitChar | String   | 是       | 需分隔符，默认是,                                       |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("fxk");
// 获取显示的选项名称
const selectNameStr = formSdk.getSelectShowName(fieldMark, ",");
```



### 7.6 控制选择框字段选项

> ***controlSelectOption: (fieldMark: string, optionKeys: string) => string;\***

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                                                     |
| ---------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark  | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}      |
| optionKeys | String   | 是       | 显示的Option选项key值，多个以逗号分隔；注：如果是明细行，不指定行则列生效 |

**返回值** string

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("fxk");
// 控制仅显示这两个选项
formSdk.controlSelectOption(fieldMark, '845584790598795269,845584790598795270')
```



### 7.7 获取浏览数据、浏览选项对象

> ***getBrowserOptionEntity: (fieldMark: string) => any[];\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                |
| --------- | -------- | -------- | ------------------------------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id} |

**返回值**

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("fxk");
// 获取选项数组， 对象结构: [{id:'xxx', name: 'xxx'}]; 结构同3.3的specialObj入参结构
const optionList = formSdk.getBrowserOptionEntity(fieldMark)
```



### 7.8 控制日期组件的可选日期范围

> ***controlDateRange(fieldMark: string, start: string | number, end?: string | number) => void;\***

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                                     |
| --------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark | string   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}， **注：明细字段设置，对整列生效** |
| start     | string   | 是       | 支持两种格式，第一种标准的日期格式，比如2019-05-28，第二种整数，相比于当前日期往前/后多少天；不含当天传’0’，**注意：应传字符串数字，** |
| end       | string   | 否       | 支持两种格式，第一种标准的日期格式，比如2019-05-28，第二种整数，相比于当前日期往前/后多少天；不含当天传’0’，**注意：应传字符串数字，** |

**返回值** void

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("fxk");
// 控制日期范围, 为当前日期前5天, 至当前日期后3天
formSdk.controlDateRange(fieldMark, '5', '3');
// 控制日期范围, 为2023-08-20, 2023-08-25
formSdk.controlDateRange(fieldMark, '2023-08-20', '2023-08-25');
// 仅控制开始，为当前日期前，不限结束
formSdk.controlDateRange(fieldMark, '0');
// 仅控制结束，为当前日期后，不限开始
formSdk.controlDateRange(fieldMark, undefined, '0');
```



### 7.9 控制选项框禁用选项

> **不低于20250501基线**

> controlOptionDisable: (fieldMark: string, optionKeys: string, flag?: boolean) => void;

**参数说明**

| **参数**   | **类型** | **必须** | **说明**                                                     |
| ---------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark  | String   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}      |
| optionKeys | String   | 是       | 选项key值，多个以逗号分隔；注：如果是明细行，不指定行则列生效 |
| disable    | Boolean  | 否       | 是否禁用，默认为true                                         |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId(\"fxk\");
// 禁用选项
formSdk.controlOptionDisable(fieldMark , '1,2');
// 取消禁用
formSdk.controlOptionDisable(fieldMark , '1,2', false);
```



## 8.容器字段类型操作

### 8.1切换选项卡tab页

> switchTabItem(fieldMark: string, tabIndex: string, type?: string): void

**参数说明**

| **参数**  | **类型** | **必须** | **说明**                                      |
| --------- | -------- | -------- | --------------------------------------------- |
| fieldMark | String   | 是       | 字段Id、字段标识                              |
| tabIndex  | String   | 是       | 下标从1开始，或者指定标签页id，且type需要传id |
| type      | String   | 否       | 默认为index, 指定标签页传id                   |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("llan", "main", true);
// 切换到第三个标签页
formSdk.switchTabItem(fieldMark ,'3');

// 切换到指定标签页
formSdk.switchTabItem(fieldMark ,'gMkj1h9oI6', 'id');
// 注：获取选项卡所有标签的方式, 其中uid属性标识id
formSdk.getFieldInfo(fieldMark ).tabOptionTitle
```



### 8.2 控制选项卡标签页属性: 显隐、禁用

**不低于20250501基线**

> changeTabItemAttr(fieldMark: string, tabIndexStr: string, viewAttr: string): void;

**参数说明**

| **参数**    | **类型** | **必须** | **说明**                                                     |
| ----------- | -------- | -------- | ------------------------------------------------------------ |
| fieldMark   | string   | 是       | 字段Id、字段标识, 格式为: {字段Id}、{字段Id}_{明细行Id}      |
| tabIndexStr | string   | 是       | 下标从1开始，或者指定标签页id，多个用逗号隔开，不能下标和id混合 |
| viewAttr    | string   | 否       | 标签属性,1(禁用)，2（编辑），3（隐藏）                       |

**返回值** 无

**示例**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 获取主表字段fieldId
const fieldMark = formSdk.convertFieldNameToId("llan");
// 禁用第二、三个标签页
formSdk.changeTabItemAttr(fieldMark, "2,3", "1");
// 编辑指定标签页
formSdk.changeTabItemAttr(fieldMark, "mcV7Jb0pss,hlT1D3UlHx", "2");
// 隐藏指定标签页
formSdk.changeTabItemAttr(fieldMark, "mcV7Jb0pss,hlT1D3UlHx", "3");
// 注：获取选项卡所有标签的方式, 其中uid属性标识id
formSdk.getFieldInfo(fieldMark).tabOptionTitle;
```



## 开发必看！！！

#### 开发必看！！！

#### 开发必看！！！

#### 开发必看！！！



> 系统公共组件API跳转链接: [https://www.e-cology.com.cn/ecode/playground/doc/share/view/916733818655342593#2.3.1%20%E7%BB%84%E4%BB%B6%E5%8F%82%E6%95%B0%E5%A4%8D%E5%86%99](https://www.e-cology.com.cn/ecode/playground/doc/share/view/916733818655342593#2.3.1 组件参数复写)

### 表单实例说明

> 相关源码入口：1、表单设计器源码；2、表单设置→自定义ecode开发；
>
> **【250101】集及之后，直接使用formSdk实例**，该实例为闭包实例，可解决多页面打开获取问题，**后续所有API示例，均使用最新的formSdk调用**

```javascript
const info = formSdk.getBaseInfo();
```



### 基线版本变动公示

#### 基线差异变动【241101】 --> 【250101】

> **获取表单实例改动，兼容原有方式，同时支持使用闭包实例：formSdk， 涉及入口：\****1、表单设计器源码；2、表单设置→自定义ecode开发；**
>
> **后续所有API示例，均使用最新的formSdk调用**

```javascript
// 241101及之前, 基于pageSdk的formReady回调, 获取当前的sdk
pageSdk.on('formReady', (args) => {   
    const weFormSdk = window.WeFormSDK.getWeFormInstance();
    const info = weFormSdk.getBaseInfo();
});

// 241201及之后, 直接使用formSdk闭包实例, 无须使用pageSdk的formReady, 不会出现同时打开多个, 取错实例
const info = formSdk.getBaseInfo();
```



## 常见问题

***开发必看！！！\***

***开发必看！！！\***

***开发必看！！！\***

***必看：\***

> **1、在编写JS二开代码时，一定要在表单初始化完成后再获取实例，否则会报错，通过文档1.2所示“pageSdk.on('formReady')”；**
>
> **2、如果是在ecode中编写，一定要确定是在表单初始化完成后，否则会报错，根据实际情况获取；**
>
> **3、\****任何问题，都需要先确保源码JS加载并且有执行，可通过debugger;  alter弹窗及打印信息验证，非常重要！！！**





### **1.说明**

### **2.表单事件注册-常见问题**

#### **注册拦截事件，指定动作执行前触发，并可阻断/放行后续操作**

#### **注册钩子事件，指定动作完成后触发**

#### **注册钩子事件、拦截事件不生效**

> **1、排查控制台是否有报错，一般是因为写的代码报错，或ecode没加载上**
>
> **2、检查是否获取到实例，获取实例前是否绑定异步加载完成的事件: pageSdk.on('formReady', (args) => {});**
>
> **3、检查代码是否注册上，调试控制台执行以下代码，拦截事件看：\****registerInterceptor,** **钩子回调看\****：registerHook**
>
> **javascript**
>
> ```
> WeFormSDK.getWeFormInstance().weFormApi.weFormApiHookFunForm
> ```



### **3.字段基础操作-常见问题**

> 如何找dataKey

1、字段的dataKey， 表单设计器->选中字段->右侧dataKey

![image.png](https://weapp.eteams.cn/api/file/preview?fileId=1061175514257285124&type=imgs)

2、明细表的dataKey， 表单设计器->选中明细表->右侧dataKey； **高级版要双击明细表进去，右侧的dataKey**

![image.png](https://weapp.eteams.cn/api/file/preview?fileId=1061175677503741972&type=imgs)

#### **获取单个字段值**

#### **修改单个字段值**

#### **获取字段值、修改字段值不生效，或者获取、修改的不正确**

> **1、表单无明细字段，检查数据key是否正确、字段id是否获取到、修改值的格式是否正确，选项是浏览入参传数组，其他传value字符串**
>
> **2、表单有明细字段，一般是主表字段和明细字段的数据key有重复，获取字段id的\*****convertFieldNameToId，\*需要传位置标示，主表(main)/具体明细表(明细表Id)； 其他同上一个排查方式**
>
> **3、检查是否模块模块字段，或者字段存在复写**
>
> **4、如果是一个EB页面下，有多张表单的情况，一定要注意获取实例问题，由于异步加载且速度不同，可能会获取错**
>
> > **“\****WeFormSDK.getWeFormInstance()”取的是当前最后一次打开的，由于加载速度不同，可能获取的不固定，如下图，这个页面有两个表单，打开时获取字段id，有时能取到有时取不到，是因为实例获取不对，可以使用getBaseInfo中的formId和dataId来辅助识别**
> >
> > **【241201】及之后，直接使用formSdk示例，该实例为闭包，不会因为异步差异取不到、取错   — 2024年12月**
> >
> > 
> >
> > ![image.png](https://weapp.eteams.cn/papi/file/preview?fileId=1022526297510813698&type=imgs)
> >
> > ![image.png](https://weapp.eteams.cn/papi/file/preview?fileId=1022526327724007440&type=imgs)





### **4.字段事件绑定**



### **其他常见问题**

#### **如何获取明细表内某一字段，整列的数据？**

> **要遍历明细行获取，步骤：1、先获取明细表id；2、获取明细表所有行的rowId；3、遍历所有行，取所有行的该字段数据**

#### **对字段的读写属性，设置编辑时不生效**

> **检查是否为流程只读，不可编辑表单时，不可设置为编辑，隐藏、隐藏行正常使用**

> **检查是否流程字段权限控制**

#### **绑定字段值变更不生效**

> **检查绑定的字段id是否有效**

#### **流程提交保存超时、提示二开代码拦截超时**

> **这是【2.1 注册拦截事件，指定动作执行前触发，并可阻断/放行后续操作】拦截，超过25s未完成会提示，排查是否未按照要求调用【成功：successFn : 失败：failFn】**

#### **流程提交拦截，修改了表单数据保存没生效**

> **检查是否使用的【2.1 注册拦截事件，指定动作执行前触发，并可阻断/放行后续操作:registerCheckEvent】事件，而非流程的提交事件；**

> **检查是否使用的【2.2 注册钩子事件，指定动作完成后触发:registerAction】，这个是执行后的事件**

#### **明细字段值变更后，通过原生JS修改DOM不生效**

> **适当加上setTimeout延时试下，一般是因为事件和DOM刷新是串行的，或者DOM渲染的多还有部分没刷新**



## 案例分享

### 1、复写组件props

#### a、复写组件props

##### **拦截自定义页面的props，并取表单引擎的customParam填充进去**

> **也可以做自定义url**

javascript

```
import { regOvProps } from '@weapp/utils';

regOvProps('weappEbdcoms', 'CustomPage', (props) => {
  console.log(props);
  if(props.formProps?.customParam){
      props.config.url = props.config.url + "?customParam="+JSON.stringify(props.formProps?.customParam);
  }
  return props;
});
```

### 2、拦截保存事件类

#### a、保存前，合计明细人员到主表字段中，含去重

#### **在表单保存前，合计明细人员到主表字段中，含去重**

```javascript
  // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
  // 明细表id
  const tableId = formSdk.convertFieldNameToId("ft_table2");
  // 明细人员字段id
  const mx_fp = formSdk.convertFieldNameToId("mx_ryxz", tableId);
  // 合计主表人员
  const sum = formSdk.convertFieldNameToId("zb_ryxz");

  // 注册保存事件
  formSdk.registerCheckEvent(window.WeFormSDK.OPER_SAVE, (successFn, failFn) => {
    // ...执行定义逻辑
    funSum();
    successFn();
  });

  /**
   * 合计去重
   */
  function funSum() {
    // 取行号
    const rowIds = formSdk.getDetailAllRowIndexStr(tableId)?.split(",")?.filter((a) => a);
    // 二维的数据
    const optionList = rowIds?.map((rowId) => formSdk.getBrowserOptionEntity(`${mx_fp}_${rowId}`))?.flat(1);

    // 去重
    let optionObj = {};
    const allOptions = optionList?.filter((option) => {
      if (!optionObj[option.id]) {
        optionObj[option.id] = option;
        return true;
      }
      return false;
    });
    // 计算合计并写入
    formSdk.changeFieldValue(sum, { specialObj: allOptions });
  }
```



### 3、修改表单值

#### a.塞值附件控件，且可以预览

> **使用changeFieldValue设置的数据， 如果是附件，除了id和name外，还要有个data属性放附件的数据， 例如：**

> **data数据如果没有，从文档附件模块咨询获取接口**

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
formSdk.changeFieldValue('942418934032392194', {
    specialObj:[{
    "id": "942420806814711811",
    "name": "更新sqlserver.sql",
    "data": {
        "fileid": "942420806814711811",
        "name": "更新sqlserver.sql",
        "size": 468,
        "extName": "sql",
        "type": "application/octet-stream",
        "img": false,
        "uploadUser": "3573401395003385295",
        "uploadUserName": "孙浩明",
        "uploadTime": 1702624443868,
        "doc": true,
        "docId": "7780262444391755798",
        "loadlink": "https://test-1301503941.cos.ap-shanghai.myqcloud.com/t82kg113nu/1128a55a-6ea3-4ad3-8b5c-f55d741a9025?sign=q-sign-algorithm%3Dsha1%26q-ak%3DAKIDqcLvPmX4XO8iMjIHoSG3CDXiiXkn8EJD%26q-sign-time%3D1702624444%3B1702628044%26q-key-time%3D1702624444%3B1702628044%26q-header-list%3Dhost%26q-url-param-list%3Dresponse-content-disposition%26q-signature%3D3e6eba57427f58327eb9f999535ae5835384dbfa&response-content-disposition=attachment%3Bfilename%3D%25E6%259B%25B4%25E6%2596%25B0sqlserver.sql",
        "options": [
            {
                "id": "preview",
                "icon": "Icon-custom34-o",
                "content": "预览",
                "moreType": true
            },
            {
                "id": "download",
                "icon": "Icon-download02",
                "content": "下载",
                "moreType": false
            },
            {
                "id": "rename",
                "icon": "Icon-rename",
                "content": "重命名",
                "moreType": true
            },
            {
                "id": "editSecLevel",
                "icon": "Icon-daily-o",
                "content": "修改密级",
                "moreType": true
            },
            {
                "id": "version",
                "icon": "Icon-Unfinished-business-o",
                "content": "历史版本",
                "moreType": true
            },
            {
                "id": "reupload",
                "icon": "Icon-upload_again",
                "content": "替换附件",
                "moreType": true
            },
            {
                "id": "delete",
                "icon": "Icon-delete",
                "content": "删除",
                "moreType": false
            }
        ],
        "uploadType": "common",
        "ban": false,
        "secretLevel": 4,
        "validity": "公开",
        "folderId": 102
    },
    "type": "file"
}]
})
```

 

#### b.多类型字段赋值说明

> 优先选值，使用获取值API取值，查看结构，如getFieldObj

```javascript
// 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 第二级为文本型
formSdk.changeFieldValue('942418934032392194', {
    "specialObj": [
        {
            "id": "0",
            "name": "选项1",
            "data": {
                "content": "第二级是文本型"
            }
        }
    ]
})

// 第二级为选项或浏览型
formSdk.changeFieldValue('942418934032392194', {
    "specialObj": [
        {
            "id": "1",
            "name": "选项2",
            "data": {
                "dataOptions": [
                    {
                        "optionId": "1565607624248883769",
                        "content": "f"
                    },
                    {
                        "optionId": "3573401395003385295",
                        "content": "孙浩明009"
                    }
                ]
            }
        }
    ]
})
```



### 4、字段复写类

#### a.复写明细表的富文本变成按钮， 点击跳转链接

```javascript
  // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
  const fieldMark = formSdk.convertFieldNameToId("dxwb_01vz");
  const tableMark = formSdk.convertFieldNameToId("shm_fjszhc_mxb1");
  // 取所有行的行号
  const rowIds = formSdk.getDetailAllRowIndexStr(tableMark)?.split(",")||[];
  rowIds?.forEach((rowId)=>{
      const url = formSdk.getFieldValue(`${fieldMark}_${rowId}`);
      formSdk.proxyFieldComp(`${fieldMark}_${rowId}`, React.createElement('button', {onClick:()=> window.open(url)}, "点击"), '1');
  });
  // 扩展备注：如果有添加行，绑定添加行事件，再给添加的行复写添加按钮
```



### 5、综合场景类

#### a.根据主表选择在明细中分类、合计

> **使用主表的两个字段做分组， 相同的合并累加，示例中包含动态删除行、添加行、相同分组累加**

```javascript
  // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
  // 获取来源字段、类型、数值
  const sourceTable = formSdk.convertFieldNameToId("sjlr");
  const sourceBm = formSdk.convertFieldNameToId("bmxz_2unw", sourceTable);
  const sourceType = formSdk.convertFieldNameToId("xldxk_k23j", sourceTable);
  const sourceNumber = formSdk.convertFieldNameToId("sz_u6av", sourceTable);
  // 获取目标明细表、字段、类型、数值
  const targetTable = formSdk.convertFieldNameToId("sjzs");
  const targetBm = formSdk.convertFieldNameToId("bmxz_1i4g", targetTable);
  const targetType = formSdk.convertFieldNameToId("xldxk_kw8s", targetTable);
  const targetSum = formSdk.convertFieldNameToId("sz_oue5", targetTable);

  // 来源值变更
  formSdk.bindFieldChangeEvent(`${sourceType},${sourceNumber}`, (data) => {
    countSourceToTarget();
  });
  // 添加行删除行的变化
  formSdk.registerAction(`${window.WeFormSDK.ACTION_ADDROW}${sourceTable}`, (rowIds, data) => {
    countSourceToTarget();
  });
  formSdk.registerAction(`${window.WeFormSDK.ACTION_DELROW}${sourceTable}`, (rowIds, data) => {
    countSourceToTarget();
  });


  /**
   * 分组合计数据
   */
  function countSourceToTarget() {
    let map = {};
    // 按照类型收集来源数据
    const tableDatas = formSdk.getDetailData(sourceTable);
    tableDatas?.forEach((rowData) => {
      const bmData = rowData[sourceBm]?.specialObj?.[0];
      const typeData = rowData[sourceType]?.specialObj?.[0];
      const bm = bmData?.id;
      const type = typeData?.id;
      const num = parseFloat(rowData[sourceNumber]?.value || "0");
      if (type) {
        const itemKey = `${bm}_${type}`;
        if (map[itemKey]) {
          map[itemKey]?.nums?.push(num);
        } else {
          map[itemKey] = {
            bmObj: bmData,
            typeObj: typeData,
            nums: [num]
          };
        }
      }
    });

    const targetDatas = formSdk.getDetailData(targetTable);
    // 对于消失的类型，删除行
    targetDatas?.forEach((rowData) => {
      const bm = rowData[targetBm]?.specialObj?.[0]?.id;
      const type = rowData[targetType]?.specialObj?.[0]?.id;
      if (bm && type) {
        const itemKey = `${bm}_${type}`;
        if (!map[itemKey]) {
          // 删除行号,根据rowId
          formSdk.delDetailRow(targetTable, rowData.rowId);
        }
      } else {
        // 删除行号,根据rowId
        formSdk.delDetailRow(targetTable, rowData.rowId);
      }
    });

    // 更新和新增
    Object.keys(map).forEach((key) => {
      const mapObj = map[key];
      const { nums, bmObj, typeObj } = mapObj || {};
      const sum = nums.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
      // 查找指定行
      const row = targetDatas?.find((rowData) => {
        return typeObj.id === rowData[targetType]?.specialObj?.[0]?.id && bmObj.id === rowData[targetBm]?.specialObj?.[0]?.id;
      })
      // 如果找到行则更新
      if (row) {
        const rowId = row.rowId;
        formSdk.changeFieldValue(`${targetSum}_${rowId}`, { value: sum });
      } else {
        //找不到则添加
        // 添加行并设置默认值
        formSdk.addDetailRow(targetTable, { [targetBm]: { specialObj: [bmObj] }, [targetType]: { specialObj: [typeObj] }, [targetSum]: { value: sum } })
      }
    });
  }
```



#### b.表单保存前，合计明细人员到主表字段中，含去重

> **可以基于此扩展更多，如多个主表合并到一个中**

```javascript
  // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
  // 明细表id
  const tableId = formSdk.convertFieldNameToId("ft_table2");
  // 明细人员字段id
  const mx_fp = formSdk.convertFieldNameToId("mx_ryxz", tableId);
  // 合计主表人员
  const sum = formSdk.convertFieldNameToId("zb_ryxz");

  // 注册保存事件
  formSdk.registerCheckEvent(window.WeFormSDK.OPER_SAVE, (successFn, failFn) => {
    // ...执行定义逻辑
    funSum();
    successFn();
  });

  /**
   * 合计去重
   */
  function funSum() {
    // 取行号
    const rowIds = formSdk.getDetailAllRowIndexStr(tableId)?.split(",")?.filter((a) => a);
    // 二维的数据
    const optionList = rowIds?.map((rowId) => formSdk.getBrowserOptionEntity(`${mx_fp}_${rowId}`))?.flat(1);

    // 去重
    let optionObj = {};
    const allOptions = optionList?.filter((option) => {
      if (!optionObj[option.id]) {
        optionObj[option.id] = option;
        return true;
      }
      return false;
    });
    // 计算合计并写入
    formSdk.changeFieldValue(sum, { specialObj: allOptions });
  }
```



#### c.全局表单给标定字段赋值

> **全局任意表单打开机会，校验标定字段，满足则绑定事件，事件查询接口回显数据，兼容同在主表或明细中，不支持主表、明细混合**

```javascript
// 包含的模块清单
const _inModules = ["formdatareport", "biaoge", "ebuilderform", "ebuildercard"];
// 字段的映射关系
// cardno代表场景；  cardno: "cardno", name: "yhmc"代表必要字段对应的数据key,  toTableKey代表展示数据的明细表key; toAttrRelate代表接口返回属性和明细字段key不一致，转换的方式，如接口的name属性换成username赋值
// _monitorFieldRealte.cardno.toAttrRelate说名， 左侧key对应数仓返回属性名， 右侧对应表单字段key
const _monitorFieldRealte = {
    cardno: {
        name: "name1",
        cardno: "cardno",
        toAttrRelate: {
            name: "name1",
            linkphone: "linkphone",
            birthday: "birthday",
            building_code: "building_code",
            cardno: "cardno",
            community: "community",
            grid: "grid",
            grid_code: "grid_code",
            house_code: "house_code",
            nationid: "nationid",
            residential_address: "residential_address",
            sex: "sex",
            sq_code: "sq_code"
        }
    }
}

// 注：示例为250101基线及以后写法，在ecode中使用window.addEventListener('onFormReady'), 取回调的formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
// 全局表单初始化完成回调
window.addEventListener('onFormReady', function (event) {
    const { formId, module, formSdk } = event.detail || {};
    // 指定模块生效
    if (_inModules.includes(module)) {
        console.log(`表单初始化V2:${formId}_module`, event.detail);
        // 身份信息场景,下层自带check
        bindCardno(formSdk);
    }
});

/**
 * 身份信息场景
 */
function bindCardno(weFormSdk) {
    const _cardnoRelate = _monitorFieldRealte.cardno;
    const _fieldCardno = weFormSdk.convertFieldNameToId(_cardnoRelate.cardno);
    const _fieldName = weFormSdk.convertFieldNameToId(_cardnoRelate.name);
    // 必要字段存在绑定事件
    if (_fieldName && _fieldCardno) {
        // 绑定事件，对主表字段或明细字段绑定
        weFormSdk.bindFieldChangeEvent(`${_fieldCardno},${_fieldName}`, (data) => {
            const {rowId} = data;
            // 校验两个字段是否都有值且身份证是合法的
            const cardno = weFormSdk.getFieldValue(`${_fieldCardno}${rowId ? `_${rowId}` : ""}`);
            const name = weFormSdk.getFieldValue(`${_fieldName}${rowId ? `_${rowId}` : ""}`);
            if (cardno && name && isValidChineseID(cardno)) {
                getDemoData({cardno, name}).then((res) => {
                    const {code, data} = res;
                    // 数据录入明细中
                    if (200 === code && data) {
                        resDataToTarget({weFormSdk, data, rowId, toAttrRelate: _cardnoRelate.toAttrRelate});
                    }
                }).catch((error) => console.log(error));
            }else {
                noAutoClear({weFormSdk, rowId, toAttrRelate: _cardnoRelate.toAttrRelate})
            }
        });
    }
}

/**
 * 数据放入明细中
 */
function resDataToTarget(params) {
    const {rowId, toAttrRelate, data, weFormSdk} = params;
    const curDatas = typeof data === 'string' ? JSON.parse(data) : data;
    const curData = curDatas?.[0];
    if (curData) {
        let rowData = {};
        Object.keys(curData)?.forEach((key) => {
            const _attrId = weFormSdk.convertFieldNameToId(toAttrRelate?.[key] || key);
            if (_attrId) {
                rowData[`${_attrId}${rowId ? `_${rowId}` : ""}`] = {value: curData[key] || ""};
            }
        });
        // 有数据,回填
        if (Object.keys(rowData).length > 0) {
            weFormSdk.changeMoreField(rowData);
        }
    }
}

/**
 * 空值根据配置关系清除
 * 保留扩展点，后续项目可自行实现逻辑
 */
function noAutoClear(params) {
    const {rowId, toAttrRelate, weFormSdk} = params;
    let rowData = {};
    Object.values(toAttrRelate)?.forEach((key) => {
        const _attrId = weFormSdk.convertFieldNameToId(toAttrRelate?.[key] || key);
        if (_attrId) {
            rowData[`${_attrId}${rowId ? `_${rowId}` : ""}`] = {value: ""};
        }
    });
    // 清空数据,回填
    if (Object.keys(rowData).length > 0) {
        weFormSdk.changeMoreField(rowData);
    }
}

/**
 * 实有人口应用根据证件号码和姓名获取人员信息接口
 */
async function getDemoData(params) {
    const { access_token } = await getToken("65");
    console.log(access_token, params);
    // const res = await window.weappUtils.request({
    //     url: 'http://www.demo.cn/demo/demo',
    //     method: 'POST',
    //     params: JSON.stringify(params)
    // });
    // return res;
    // mock数据，正式使用时，把下面的删除，上面注释的放开
    return ({
        "code": 200,
        "data": [
            {
                "birthday": "2024-6-5",
                "building_code": "4403050080010100017",
                "cardno": "XRZhyYpQmzb8z5F6lc1254A==",
                "community": "福光社区",
                "grid": "440305008003014",
                "grid_code": "福光14",
                "house_code": "4403050080010100017000043",
                "linkphone": "CMiBiJ6lCyn8wdsah4h46w==",
                "name": "xxx",
                "nationid": "666",
                "residential_address": "xxx",
                "sex": "2",
                "sq_code": "440305008003"
            }
        ],
        "message": "success"
    })
}

/**
 * 是否合法的中国拱门身份证信息
 */
function isValidChineseID(id) {
    const regex = /^[1-9]\d{5}(18|19|20|21|22)?\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}(\d|[Xx])$/;
    return regex.test(id);
}
```



#### d.明细数据合计到主表、根据主表计算每行明细的百分比

> 可独立使用，也可结合函数联动使用，函数联动设置合计触发、计算百分比

```javascript
  // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
  // 获取字段的fieldId
  const tableId = formSdk.convertFieldNameToId("shm_hssumi_bfbjs");
  // 获取明细字段的数值、数值百分比字段
  const sz_pchp = formSdk.convertFieldNameToId("sz_pchp", tableId);
  const propor = formSdk.convertFieldNameToId("sz_7y6z", tableId);
  // 合计字段
  const bfbhj = formSdk.convertFieldNameToId("bfbhj", "main");

  // 值变更
  formSdk.bindFieldChangeEvent(`${sz_pchp}`, (data) => funSum());
  // 联动带出明细， 如果有联动赋值的话
  formSdk.registerAction(`${window.WeFormSDK.ACTION_DATA_LINKAGE}`, (rowIds, data) => funSum());
  // 添加明细行
  formSdk.registerAction(`${window.WeFormSDK.ACTION_ADDROW}${tableId}`, (rowIds, data) => funSum());
  // 删除明细行
  formSdk.registerAction(`${window.WeFormSDK.ACTION_DELROW}${tableId}`, (rowIds, data) => funSum());

  /**
   * 合计
   */
  function funSum() {
    // 取行号
    const rowIds = formSdk.getDetailAllRowIndexStr(tableId)?.split(",")?.filter((a) => a);
    // 取数据
    const numbers = rowIds?.map((rowId) => formSdk.getFieldValue(`${sz_pchp}_${rowId}`) || "0");
    // 计算合计并写入
    const sum = eval(numbers?.join("+")) || "0";
    formSdk.changeFieldValue(bfbhj, { value: `${sum}` });

    // 计算百分比：这部分可以用函数联动，也可用js计算
    rowIds?.forEach((rowId)=>{
        const num = parseFloat(formSdk.getFieldValue(`${sz_pchp}_${rowId}`) || "0.00");
        formSdk.changeFieldValue(`${propor}_${rowId}`, { value: `${num/sum}` });
    });
  }
```



#### e.监控联动带出的字段，合计到主表，并触发主表的值变更事件

> 可实现明细修改，合计到主表，并触发主表合计的值变更，带出其他明细的数据

```javascript
  // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
  // 指定明细表
  const tableId = formSdk.convertFieldNameToId("ft_htpslc_ddmx");
  // 指定明细的字段
  const mx_fp = formSdk.convertFieldNameToId("ph", tableId, false);
  // 合计到主表字段
  const zb_fd = formSdk.convertFieldNameToId("phpj", 'main');
	
	
  // 字段联动的变更
  formSdk.registerAction(window.WeFormSDK.ACTION_DATA_LINKAGE, (arg) => {
    const { resultFields } = arg?.runData || {};
    // 含有品名
    if (resultFields?.some((fielId) => fielId === mx_fp)) {
      // 合计到主表
      funSum();
    }
  });
  // 钻取带出的变更
  formSdk.registerAction(window.WeFormSDK.ACTION_DATA_RELATE, (arg) => {
    // 含有特定
    if (arg.data.some((detail) => detail.formField.id === mx_fp)) {
      // 合计到主表
      funSum();
    }
  });
  // 手工修改的变更
  formSdk.bindFieldChangeEvent(mx_fp, (data) => {
    funSum();
  });
  
  /**
   * 合计去重
   */
  function funSum() {
    // 取行号
    const rowIds = formSdk.getDetailAllRowIndexStr(tableId)?.split(",")?.filter((a) => a);
    // 二维的数据
    const optionList = rowIds?.map((rowId) => formSdk.getBrowserOptionEntity(`${mx_fp}_${rowId}`))?.flat(1);

    // 去重
    let optionObj = {};
    const allOptions = optionList?.filter((option) => {
      if (!optionObj[option.id]) {
        optionObj[option.id] = option;
        return true;
      }
      return false;
    });
    // 计算合计并写入
    formSdk.changeFieldValue(zb_fd, { specialObj: allOptions });
  }
```



#### f.多个主表的字段选项，合计到一个主表的字段中

```javascript
  // 注：示例为250101基线及以后写法，在表单设计器源码、表单ecode中编写的，可直接使用formSdk，同时保留"window.WeFormSDK.getWeFormInstance()"
  const allFieldId = formSdk.convertFieldNameToId("ryxzjg", 'main');
  const fileFieldKeys = ["ryxz1", "ryxz2", "ryxz3"];
  const fileFieldIds = fileFieldKeys.map((key) => formSdk.convertFieldNameToId(key, 'main'))?.filter((a) => a);
  if (fileFieldIds && fileFieldIds.length > 0) {
    // 载入时先来一次
    concatFile();
    // 绑定事件，对主表字段和明细表的某一行绑定
    const allKey = fileFieldIds.join(',');
    formSdk.bindFieldChangeEvent(allKey, (data) => {
      concatFile();
    });
  }

  // 合计附件
  function concatFile() {
    const fieldDatas = fileFieldIds?.map((fieldId) => formSdk.getBrowserOptionEntity(fieldId))?.flat(1) || [];
    formSdk.changeFieldValue(allFieldId, { specialObj: fieldDatas });
  }
```



## 扩展说明

### 【明细嵌套】功能对应API添加明细行

一、在表单设计器中搭建明细表嵌套并设置相应配置，设置好后保存设计器：

- 父级明细表打开“开启二级明细表”，并设置嵌套父级行标识，可设置行id或者指定某个字段

- 在相应区域拖入明细表作为子级明细，并设置嵌套子级行标识‘

  ![下载](data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3432 1952"%3E%3C/svg%3E)

![preview](data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3432 1952"%3E%3C/svg%3E)



二、通过API添加嵌套明细表的思路：给二级嵌套明细表赋值时，设置子级行标识的值和相应的父级明细的某一行的父级行标识的值相同，即可赋值成功。相应的代码如下：

```javascript
// 获取sdk实例
const formSdk = WeFormSDK.getWeFormInstance()
// 获取二级明细表fieldId
const detailMark = formSdk.convertFieldNameToId("hpfmxbqtcs_mxb2");
// 获取二级明细子级行标识对应的字段fieldId
const detailFieldMark = formSdk.convertFieldNameToId("dxwb_4594");
// 添加行并设置默认值
formSdk.addDetailRow(detailMark, {[detailFieldMark]: {value: "1"}});
```

> 注：必须先有父级明细行，才能给二级明细赋值

![preview (1)](data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3432 1952"%3E%3C/svg%3E)
