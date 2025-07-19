
## 目录

- [1 系统要求](#1-系统要求)
  - [1.1 AppId](#11-appid)
  - [1.2 AppSecret](#12-appsecret)
  - [1.3 PublicKey](#13-publickey)
  - [1.4 AppPrivateKey](#14-appprivatekey)
  - [1.5 AppPublicKey](#15-apppublickey)
  - [1.6 BaseUrl](#16-baseurl)
- [2 SDK集成准备](#2-sdk集成准备)
  - [2.1 SDK下载](#21-sdk下载)
  - [2.2 SDK集成和配置](#22-sdk集成和配置)
- [3 API接口调用说明](#3-api接口调用说明)
  - [3.1 API调用初始化](#31-api调用初始化)
  - [3.2 调用API服务接口说明](#32-调用api服务接口说明)
  - [3.3 配置文件说明](#33-配置文件说明)
  - [3.4 API调用例子](#34-api调用例子)
  - [3.5 正常和异常的返回结构](#35-正常和异常的返回结构)
- [4 文件上传下载使用说明](#4-文件上传下载使用说明)
  - [4.1 文件上传下载对象初始化](#41-文件上传下载对象初始化)
  - [4.2 文件上传接口说明](#42-文件上传接口说明)
  - [4.3 文件下载接口说明](#43-文件下载接口说明)
  - [4.4 配置文件说明](#44-配置文件说明)
  - [4.5 文件上传下载调用例子](#45-文件上传下载调用例子)
- [5 加签验签调用说明](#5-加签验签调用说明)
  - [5.1 加签验签对象初始化](#51-加签验签对象初始化)
  - [5.2 加签接口说明](#52-加签接口说明)
  - [5.3 验签接口说明](#53-验签接口说明)
  - [5.4 配置文件说明](#54-配置文件说明)
  - [5.5 加签验签接口调用例子](#55-加签验签接口调用例子)
- [6 H5免登接口调用说明](#6-h5免登接口调用说明)
  - [6.1 H5免登调用初始化](#61-h5免登调用初始化)
  - [6.2 调用H5免登服务接口说明](#62-调用h5免登服务接口说明)
  - [6.3 配置文件说明](#63-配置文件说明)
  - [6.4 API调用例子](#64-api调用例子)
- [7 银企回单文件下载](#7-银企回单文件下载)
  - [7.1 获取回单文件下载信息](#71-获取回单文件下载信息)
  - [7.2 下载回单文件](#72-下载回单文件)
  - [7.3 查询下载进度](#73-查询下载进度)
- [8 银企账管+产品](#8-银企账管产品)
  - [8.1 适用客户及场景](#81-适用客户及场景)
  - [8.2 SDK接入特殊处理](#82-sdk接入特殊处理)
- [9 附录：错误码规范](#9-附录错误码规范)
  - [9.1 公共错误码](#91-公共错误码)
  - [9.2 业务错误码](#92-业务错误码)

## 文档修订记录

| 序号 | 修订内容 | 修订日期 | 版本号 | 修订人 | 审核人 |
|------|----------|----------|--------|--------|--------|
| 1 | 平安SDK说明文档编写 | 2020/9/4 | 1.0.0 | 叶清林 | |
| 2 | 删除bcpkix-jdk15on-1.64.jar依赖；修改pom的openSDK的artifactId；补充截图；补充SDK下载 | 2020/9/4 | 1.0.1 | 叶清林 | |
| 3 | 更改了sdk的jar版本信息；对示例图解以及文字描述做了更新；对应用公私钥的生成方式做了补充 | 2021/01/21 | 1.0.3 | 伍延璋 | |
| 4 | 更改了sdk依赖的jar包版本信息；修改应用私钥的生成方式描述；对3.1SDK初始化方法,3.2调用API服务示例进行更新 | 2021/02/03 | 1.0.4 | 张春杰 | |
| 5 | 更新SDK集成和配置；更新调用说明：支持一个SDK支持多套配置文件 | 2021/04/22 | 1.0.5 | 钟士武 | |
| 6 | 兼容JDK1.6；支持多配置文件 | 2021/4/29 | 1.0.6 | 左川宇 | |
| 7 | 修复操作系统编码为GBK情况的乱码问题；版本号调整为1.8.49 | 2021/7/07 | 1.0.7 | 李海丰 | |
| 8 | 支持零售wefile文件(SDK1.8.71 版本以上) | 2021/10/20 | 1.0.8 | 左川宇 | |
| 9 | 支持批量回单下载 | 2021/11/4 | 1.0.8 | 伍延璋 | |
| 10 | 修正文档错误地方 | 2021/11/23 | 1.0.9 | 李海丰 | |
| 11 | 添加第八章账管+说明 | 2022.02.22 | 1.0.9 | 赖伟清 | |
| 12 | 文件上传下载新增支持银企直联文件场景 | 2022.04.20 | 1.0.10 | 赖伟清 | |
| 13 | 直联场景文件上传下载SDK优化 | 2022.06.28 | 1.0.11 | 赖伟清 | |
| 14 | 添加3.5正常和异常的返回报文结构；添加附录错误码 | 2022/8/4 | 1.0.12 | 李玲 | |
| 15 | SdkSignature 方法protected 改为public，可初始化多次配置文件；初始化失败，重试间隔默认5分钟，客户也可按需设置重试时间 | 2022/9/22 | 1.0.13 | 伍延璋 | |

## 1 系统要求

使用开放平台的java sdk需要jdk1.6或以上的支持，会使用以下的公共类库，请留意您的应用在导入开放平台的sdk后是否会出现以上类库的兼容性问题。

**必须导入的JAR包：**
- 开放平台应用：`api-sdk-1.8.63.jar`
- 基础包：
  - `bcprov-jdk15on-1.64.jar`（jdk1.8）或 `bcprov-jdk15to18.1.64.jar`（jdk1.6）
  - `fastjson-1.2.83.jar`

> **注意：** 以下1.1-1.6所述参数信息均会在开放银行针对各客户发出的邮件附件`config.properties`文件中体现，直接使用即可。

### 1.1 AppId

AppId是应用Id，每个客户会生成一个唯一的AppId，在接入开放平台后作为身份标识。

### 1.2 AppSecret

AppSecret也由开放平台单独颁发，AppSecret总是随同AppId一起分发，一个AppId对应一个AppSecret。

AppSecret涉及你存储资料的安全问题，所以请妥善保存你的AppSecret，不要泄漏给第三方，如发生泄露可以在开放平台门户进行重置将原来AppSecret作废，重新生成。

### 1.3 PublicKey

PublicKey是开放平台公钥。公钥可以用来验证返回报文数据的身份，防止其他人假冒开放平台向你发送数据。还可以通过公钥对开发平台加签过来的报文解密。

### 1.4 AppPrivateKey

AppPrivateKey是应用私钥，私钥可以用来把密文解密成明文。

### 1.5 AppPublicKey

AppPublicKey是应用公钥，跟AppPrivateKey【应用私钥】是一对的。

### 1.6 BaseUrl

BaseUrl为开放银行接入URL，在接入时需要上送。

## 2 SDK集成准备

### 2.1 SDK下载

在开放银行门户文档中心/企业文档中心/SDK资源/SDK资源下载。

> **说明：** SDK包一般会跟随接入邮件，线下提供，文件名例如：`SDK-1.9.89-20220922.zip`

### 2.2 SDK集成和配置

开发者在应用工程中引入SDK包进行集成，把SDK包放入到JAVA工程目录`src/main/resources/lib/`下

修改`pom.xml`添加jar依赖：

#### JDK1.6依赖Jar

```xml
<dependency>
    <groupId>org.bouncycastle</groupId>
    <artifactId>bcprov-jdk15to18</artifactId>
    <version>1.64</version>
</dependency>
<dependency>
    <groupId>com.pingan.openbank</groupId>
    <artifactId>api-sdk</artifactId>
    <version>1.8.63</version>
    <scope>system</scope>
    <systemPath>
        ${project.basedir}/src/main/resources/lib/api-sdk.1.8.63.jar
    </systemPath>
</dependency>
```

#### JDK1.8依赖Jar

```xml
<dependency>
    <groupId>org.bouncycastle</groupId>
    <artifactId>bcprov-jdk15on</artifactId>
    <version>1.64</version>
</dependency>
<dependency>
    <groupId>com.pingan.openbank</groupId>
    <artifactId>api-sdk</artifactId>
    <version>1.8.63</version>
    <scope>system</scope>
    <systemPath>
        ${project.basedir}/src/main/resources/lib/api-sdk.1.8.63.jar
    </systemPath>
</dependency>
```

SDK中不单独提供配置类，需要开发者在应用工程中自行配置AppId、AppSecret、AppPrivateKey、PublicKey、API网关地址等。

## 3 API接口调用说明

### 3.1 API调用初始化

获取OpenBankClient实例化

| 方法名 | 参数说明 |
|--------|----------|
| `ApiClient.getInstance()` | 默认从`conf/config.properties`读取配置项内容。文件名和目录不能变。 |
| `ApiClient.getInstance(String configPath)` | 上送单个配置文件相对目录。例如`conf/config_01.properties` |
| `ApiClient.getInstance(Properties properties)` | 解析后文件对象（Properties）：先读取出单个配置文件为Properties对象 |
| `ApiClient.getInstance(Set<String> configPaths)` | 集合（Set）：上送多个配置文件 |

### 3.2 调用API服务接口说明

| 方法名 | 参数名 | 参数说明 |
|--------|--------|----------|
| `OpenBankClient.invoke(SdkRequest sdkRequest)` | `appId` | 应用ID。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `configFilePath` | 配置文件路径。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送。<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `interfaceName` | 请求接口路径。例如`/V1.0/getAcountDate` |
| | `body` | 请求接口报文内容。JSON格式 |
| | `extraHeaders` | 请求接口额外头部信息，默认不需要上送 |

> **注意：** `interfaceName=/V1.0/接口文档里面的path或者服务ID`

### 3.3 配置文件说明

配置文件对接时统一提供

#### 1）存放目录：
配置文件统一放到`src/main/resources/conf/`目录下。
例如：`src/main/resources/conf/config.properties`

#### 2）字段说明：

| 字段名 | 字段描述 | 是否必填 | 备注 |
|--------|----------|----------|------|
| `appPrivateKey` | 应用私钥 | 是 | |
| `publicKey` | 平台公钥 | 是 | |
| `appId` | 应用ID | 是 | |
| `appSecret` | 应用密码 | 是 | |
| `baseUrl` | 接入开放银行URL | 是 | |
| `encrypt` | 是否对报文加密 | 否 | 默认为true必须加密，不加密上送false |
| `encryptMethod` | 加密方式 | 否 | Encrypt为true时必填。默认值SM4 |
| `signMethod` | 加签方式 | 否 | 默认为SM2。其他加签方式视具体情况使用，RSA-加签；CA-证书文件加签 |
| `pfxPath` | 证书文件路径 | 否 | 加签方式为CA时必填，路径统一放到`src/main/resources/conf`目录下。证书文件对接时统一提供 |
| `pfxPwd` | 证书文件密码 | 否 | 加签方式为CA时必填，密码对接时统一提供 |
| `CAType` | 证书文件类型 | 否 | 加签方式为CA时必填。枚举值如下：<br/>RSA_SOFT-RSA证书<br/>SM2_SOFT-SM2证书 |

### 3.4 API调用例子

#### 1）单配置文件

```java
String configProperties = "conf/config.properties";
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient apiClient = ApiClient.getInstance(configProperties);
//拼接请求报文
JSONObject requestBody = new JSONObject();
requestBody.put("appId","1234");
requestBody.put("serialNo","100002004");
requestBody.put("channelCode","Y3358");
//封装请求对象
SdkRequest sdkRequest = new SdkRequest();
//指定配置文件
sdkRequest.setConfigFilePath(configProperties);
//指定接口
sdkRequest.setInterfaceName("/V1.0/V1/getAcountDate");
//设置请求报文
sdkRequest.setBody(requestBody);
//调用接口请求
HttpResult result = apiClient.invoke(sdkRequest);
```

#### 2）多配置文件

```java
//设置多个配置文件
Set<String> configSet = new HashSet<>();
configSet.add("conf/config_001.properties");
configSet.add("conf/config_002.properties");
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient apiClient = ApiClient.getInstance(configSet);
//拼接请求报文
JSONObject requestBody = new JSONObject();
requestBody.put("appId","1234");
requestBody.put("serialNo","100002004");
requestBody.put("channelCode","Y3358");
//封装请求对象
SdkRequest sdkRequest = new SdkRequest();
//指定当前接口使用的配置文件
sdkRequest.setConfigFilePath("conf/config_001.properties");
//指定接口
sdkRequest.setInterfaceName("/V1.0/V1/getAcountDate");
//设置请求报文
sdkRequest.setBody(requestBody);
//调用接口请求
HttpResult result = apiClient.invoke(sdkRequest);
```

### 3.5 正常和异常的返回结构

#### 3.5.1 正常返回报文示例
所有报文内容统一在Data节点里：

```json
{
    "Data": {
        "BizParm1": "value1",
        "BizParm2": "value2",
        "Array": [
            {
                "ListParam1": "listValue1",
                "ListParam2": "listValue2"
            }
        ]
    }
}
```

#### 3.5.2 异常响应报文示例

```json
{
    "Code": "",
    "Message": "",
    "Errors": [
        {
            "ErrorCode": "",
            "ErrorMessage": ""
        }
    ],
    "ExtendData": {}
}
```

#### 报文字段说明

| 字段英文名 | 字段中文名 | 描述 |
|------------|------------|------|
| `Code` | 公共错误码 | |
| `Message` | 公共错误信息 | |
| `ErrorCode` | 业务错误码 | |
| `ErrorMessage` | 业务错误信息 | |
| `ExtendData` | 业务报文 | |

## 4 文件上传下载使用说明

### 4.1 文件上传下载对象初始化

获取OpenBankClient实例化

| 方法名 | 参数说明 |
|--------|----------|
| `ApiClient.getInstance()` | 默认从`conf/config.properties`读取配置项内容。文件名和目录不能变。 |
| `ApiClient.getInstance(String configPath)` | 上送单个配置文件相对目录。例如`conf/config_01.properties` |
| `ApiClient.getInstance(Properties properties)` | 解析后文件对象（Properties）：先读取出单个配置文件为Properties对象 |
| `ApiClient.getInstance(Set<String> configPaths)` | 集合（Set）：上送多个配置文件 |

### 4.2 文件上传接口说明

| 方法名 | 参数名 | 参数说明 |
|--------|--------|----------|
| `OpenBankClient.fileUpload(FileRequest fileRequest)` | `String appId` | 应用ID。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `String configFilePath` | 配置文件路径。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送。<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `File file` | 待上传的文件 |
| | `String filePathName` | 文件上传存储服务器文件路径 |
| | `String container` | 文件类型<br/>01：UDMP(默认)非必填<br/>02：wefile |

### 4.3 文件下载接口说明

| 方法名 | 参数名 | 参数说明 |
|--------|--------|----------|
| `OpenBankClient.fileDownload(FileRequest fileRequest)` | `String appId` | 应用ID。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `String configFilePath` | 配置文件路径。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送。<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `String fileNo` | 文件上传成功后返回文档编号或者查询接口返回的filepath |
| | `String filePathName` | 文件下载存储路径（带文件名的绝对路径） |
| | `String container` | 文件类型<br/>01：UDMP(默认)非必填<br/>02：wefile<br/>04：银企直联文件 |

### 4.4 配置文件说明

配置文件对接时统一提供

#### 1）存放目录：
配置文件统一放到`src/main/resources/conf/`目录下。
例如：`src/main/resources/conf/config.properties`

#### 2）字段说明：

| 字段名 | 字段描述 | 是否必填 | 备注 |
|--------|----------|----------|------|
| `appPrivateKey` | 应用私钥 | 是 | |
| `publicKey` | 平台公钥 | 是 | |
| `appId` | 应用ID | 是 | |
| `appSecret` | 应用密码 | 是 | |
| `enableProxy` | 是否使用代理模式 | 否 | true：使用代理模式转发<br/>false或者为空：直接转发 |
| `proxyHost` | 代理IP地址 | 否 | 代理模式为true必填 |
| `proxyPort` | 代理端口 | 否 | 代理模式为true必填 |
| `fileUploadUrl` | 上传URL地址 | 否 | 调用上传方法时必填 |
| `fileDownLoadUrl` | 下载URL地址 | 否 | 调用下载方法时必填 |
| `container` | 后台文件存储系统 | 否 | 01：UDMP(默认)非必填<br/>02：wefile<br/>仅对接零售二三类开户业务需要设置为<br/>04：银企直联文件 |

### 4.5 文件上传下载调用例子

#### 1）上传调用例子

```java
String config = "conf/config.properties";
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient fileClient = ApiClient.getInstance(config);
//封装请求对象
FileRequest fileRequest = new FileRequest();
//指定上传读取配置文件
fileRequest.setConfigFilePath(config);
//设置需要上传文件内容
fileRequest.setFile(new File("D:\\test\\test.txt"));
//设置文件上传服务器文件路径
fileRequest.setFilePathName("/ejzb/test.txt");
//调用接口请求
String fileNo = fileClient.fileUpload(fileRequest);
```

#### 2）下载调用例子

```java
String config = "conf/config.properties";
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient fileClient = ApiClient.getInstance(config);
//封装请求对象
FileRequest fileRequest = new FileRequest();
//指定下载读取配置文件
fileRequest.setConfigFilePath(config);
//设置文档编号
fileRequest.setFileNo("UDMP-667cd2078c8e4cec302c77222d702abce310492c8e-a36218c7-20210511071640-00000001");
//设置文件下载本地文件路径
fileRequest.setFilePathName("D:\\test.txt");
//调用接口请求
fileClient.fileDownLoad(fileRequest);
```

## 5 加签验签调用说明

### 5.1 加签验签对象初始化

获取OpenBankClient实例化

| 方法名 | 参数说明 |
|--------|----------|
| `ApiClient.getInstance()` | 默认从`conf/config.properties`读取配置项内容。文件名和目录不能变。 |
| `ApiClient.getInstance(String configPath)` | 上送单个配置文件相对目录。例如`conf/config_01.properties` |
| `ApiClient.getInstance(Properties properties)` | 解析后文件对象（Properties）：先读取出单个配置文件为Properties对象 |
| `ApiClient.getInstance(Set<String> configPaths)` | 集合（Set）：上送多个配置文件 |

### 5.2 加签接口说明

| 方法名 | 参数名 | 参数说明 |
|--------|--------|----------|
| `OpenBankClient.outRespSign(SignRequest signRequest)` | `String appId` | 应用ID。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `String configFilePath` | 配置文件路径。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送。<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `boolean sortable` | 待加签报文是否排序。true=是，false=否。默认为false |
| | `String bizData` | 待加签的业务报文 |

### 5.3 验签接口说明

| 方法名 | 参数名 | 参数说明 |
|--------|--------|----------|
| `OpenBankClient.outReqVerify(SignRequest signRequest)` | `String appId` | 应用ID。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `String configFilePath` | 配置文件路径。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送。<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `boolean sortable` | 待加签报文是否排序。true=是，false=否。默认为false |
| | `String bizData` | 待加签的业务报文 |
| | `String sign` | 签名数据 |

### 5.4 配置文件说明

配置文件对接时统一提供

#### 1）存放目录：
配置文件统一放到`src/main/resources/conf/`目录下。
例如：`src/main/resources/conf/config.properties`

#### 2）字段说明：

| 字段名 | 字段描述 | 是否必填 | 备注 |
|--------|----------|----------|------|
| `appPrivateKey` | 应用私钥 | 是 | |
| `publicKey` | 平台公钥 | 是 | |
| `appId` | 应用ID | 是 | |

### 5.5 加签验签接口调用例子

#### 1）加签例子

```java
String config = "conf/config.properties";
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient signClient = ApiClient.getInstance(config);
//封装请求对象
SignRequest signRequest = new SignRequest();
//指定加签读取配置文件
signRequest.setConfigFilePath(config);
//设置待加签业务报文
JSONObject requestBody = new JSONObject();
requestBody.put("ApplySeqNo", "30000010057");
requestBody.put("channelCode","FBZ008");
requestBody.put("billType", "0");
signRequest.setBizData(requestBody);
//调用接口请求
String signData = signClient.outRespSign(signRequest);
```

#### 2）验签例子

```java
String config = "conf/config.properties";
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient signClient = ApiClient.getInstance(config);
//封装请求对象
SignRequest signRequest = new SignRequest();
//指定验签读取配置文件
signRequest.setConfigFilePath(config);
//plainText 请求报文即待验签内容，先不要做任何转换（包括json.parse，json.tojsonString之类的），验签成功后再格式化或者转换对象
signRequest.setBizData(plainText); 
signRequest.setSign("eyJraWQiOiJjY2YzYjZjMS02NGViLTQ0YjctYmZmZS0xOTM1ZDEzZDhiMDUiLCJ0eXAiOiJKV1QiLCJlbmMiOiJTTTQiLCJhbGciOiJTTTIifQ");
//调用接口请求
boolean checkFlag = signClient.outReqVerify(signRequest);
```

## 6 H5免登接口调用说明

### 6.1 H5免登调用初始化

获取OpenBankClient实例化

| 方法名 | 参数说明 |
|--------|----------|
| `H5Client.getInstance()` | 默认从`conf/config.properties`读取配置项内容。文件名和目录不能变。 |
| `H5Client.getInstance(String configPath)` | 上送单个配置文件相对目录。例如`conf/config_01.properties` |
| `H5Client.getInstance(Properties properties)` | 解析后文件对象（Properties）：先读取出单个配置文件为Properties对象 |
| `H5Client.getInstance(Set<String> configPaths)` | 集合（Set）：上送多个配置文件 |

### 6.2 调用H5免登服务接口说明

| 方法名 | 参数名 | 参数说明 |
|--------|--------|----------|
| `OpenBankClient.invoke(SdkRequest sdkRequest)` | `appId` | 应用ID。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `configFilePath` | 配置文件路径。<br/>1）一个应用只配置单个`config_*.properties`时，不需要上送。<br/>2）一个应用配置了多个`config_1.properties`、`config_2.properties`等时需要上送该接口归属对应的应用ID或者对应的文件路径 |
| | `interfaceName` | H5接口H5id |
| | `body` | 请求接口报文内容。JSON格式 |
| | `extraHeaders` | 请求接口额外头部信息，默认不需要上送 |

> **注意：** `interfaceName`：在开放银行门户申请调用H5的H5 id（接入时邮件中也会提供）

### 6.3 配置文件说明

配置文件对接时统一提供

#### 1）存放目录：
配置文件统一放到`src/main/resources/conf/`目录下。
例如：`src/main/resources/conf/config.properties`

#### 2）字段说明：

| 字段名 | 字段描述 | 是否必填 | 备注 |
|--------|----------|----------|------|
| `appPrivateKey` | 应用私钥 | 是 | |
| `publicKey` | 平台公钥 | 是 | |
| `appId` | 应用ID | 是 | |
| `appSecret` | 应用密码 | 是 | |
| `baseUrl` | 接入开放银行URL | 是 | |
| `encrypt` | 是否对报文加密 | 否 | 默认为true必须加密，不加密上送false |
| `encryptMethod` | 加密方式 | 否 | Encrypt为true时必填。默认值SM4 |
| `signMethod` | 加签方式 | 否 | 默认为SM2。其他加签方式视具体情况使用，RSA-加签 |

### 6.4 API调用例子

#### 1）单配置文件

```java
String configProperties = "conf/config.properties";
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient h5Client = H5Client.getInstance(configProperties);
//拼接请求报文
JSONObject requestBody = new JSONObject();
requestBody.put("coUserId","1234");
requestBody.put("coUserPhoneNumber","1350020XXXX");
//封装请求对象
SdkRequest sdkRequest = new SdkRequest();
//指定配置文件
sdkRequest.setConfigFilePath(configProperties);
//设置H5id
sdkRequest.setInterfaceName("0f717039-e897-4a5f-8671-c5faf864f207");
//设置请求报文
sdkRequest.setBody(requestBody);
//调用接口请求
HttpResult result = h5Client.invoke(sdkRequest);
```

#### 2）多配置文件

```java
//设置多个配置文件
Set<String> configSet = new HashSet<>();
configSet.add("conf/config_001.properties");
configSet.add("conf/config_002.properties");
//实例化API对象，一个应用只需要初始化一次即可
OpenBankClient h5Client = H5Client.getInstance(configSet);
//拼接请求报文
JSONObject requestBody = new JSONObject();
requestBody.put("coUserId","1234");
requestBody.put("coUserPhoneNumber","1350020XXXX");
//封装请求对象
SdkRequest sdkRequest = new SdkRequest();
//指定当前接口使用的配置文件
sdkRequest.setConfigFilePath("conf/config_001.properties");
//设置H5id
sdkRequest.setInterfaceName("0f717039-e897-4a5f-8671-c5faf864f207");
//设置请求报文
sdkRequest.setBody(requestBody);
//调用接口请求
HttpResult result = h5Client.invoke(sdkRequest);
```

## 7 银企回单文件下载

配置文件需添加：
```properties
queryOrderFileUrl=http://…../boapFile/queryOrderFile
fileDownLoadOrderFileUrl=http://…./boapFile/downloadOrderFile
```

### 7.1 获取回单文件下载信息

#### 请求参数GetFile：

| 字段名称 | 字段类型 | 是否必填 | 描述 |
|----------|----------|----------|------|
| `account` | string | Y | 银企账号 |
| `appId` | string | N | AppId,非必填 |
| `txnCode` | String | N | 非必填(已经没用了) |
| `beginDate` | String | N | 查询开始日期(yyyyMMdd) |
| `endDate` | String | N | 查询结束日期(yyyyMMdd) |

#### 响应参数FileRsp：

| 字段名称 | 字段类型 | 是否必填 | 描述 |
|----------|----------|----------|------|
| `code` | string | Y | 状态码200成功 |
| `msg` | string | Y | 返回消息,如: 操作成功！ |
| `data` | List<> | Y | 下载文件参数 |

```java
ApiClient apiClient = ApiClient.getInstance(configPaths);
GetFile file = new GetFile();
file.setAccount("15000166042948");  //银企账号
file.setBeginDate("20210917");  //查询开始日期
file.setEndDate("20210930");  //查询结束日期
FileRsp result = apiClient.queryOrderFile(file);
```

### 7.2 下载回单文件

#### 请求参数：

| 字段名称 | 字段类型 | 是否必填 | 描述 |
|----------|----------|----------|------|
| `appId` | string | N | appId,非必填 |
| `orderFiles` | String | Y | 下载文件参数 |
| `downPath` | String | Y | 本地文件存储路径(绝对路径) |
| `configFilePath` | String | N | 配置文件路径(多配置时使用) |

#### 响应参数：
返回一个线程名称,可以用于查询文件下载的进度。

```java
OrderFileRequest orderFileRequest = new OrderFileRequest();
orderFileRequest.setDownPath("D:\\ProgramFiles\\download11");
orderFileRequest.setOrderFiles(orderFiles);
String taskName = apiClient.orderFileDownload(orderFileRequest);
```

### 7.3 查询下载进度

| 字段名称 | 字段类型 | 是否必填 | 描述 |
|----------|----------|----------|------|
| `appId` | string | N | appId,非必填 |
| `taskName` | String | Y | 下载线程名称 |
| `downPath` | String | Y | 下载路径 |

```java
ProgressRequest progressRequest = new ProgressRequest();
progressRequest.setTaskName(taskName);
progressRequest.setDownPath(path);
apiClient.queryProgress(progressRequest);
```

## 8 银企账管+产品（接入账管+产品必读）

### 8.1 适用客户及场景

#### 合作平台：
第三方服务商提供的各类平台比：如用友财务云、金蝶云、票据平台、融资平台等，提供为平台用户提供各类服务，需要对接各家银行开放银行。

#### 技术服务商平台：
平台技术服务商（如云账房、金蝶、用友、腾讯等）开发代账软件，出售给代账公司使用。

#### 适用场景：
在平台用户授权同意的情况下，合作平台通过银行开放银行获取平台用户的账户信息、票据信息、融资信息等各类信息，通过平台进行转账支付、票据操作、融资操作等业务处理。

账管+接口提供的功能需要企业客户登录平安银行企业网银（https://ebank.sdb.com.cn/corporbank/logon_basic.jsp）进行对应的授权。

银行需要给资金云平台"开放银行类交易"下的"余额查询、明细查询、单笔付款网银审批申请和进度查询"。

### 8.2 SDK接入特殊处理

针对以账管+模式接入的客户，SDK接口调用时需在请求扩展头中上送"ZuID（租户ID）和PlatformID（平台ID）"，外联客户代码、PlatformID、ZuID的解释如下：

- **外联客户代码**：银企直联客户号，和我行签约银行账管+服务的主体服务商（线下签约）。
- **PlatformID**：平台ID，需要和银行线下申请签约入驻为开放银行账管+ 平台ID，ID号需要保持一致，长度30位内（非必须）。
- **ZuID**：租户ID，平台ID下服务的租户ID，由合作方系统自定义编码，长度30位内。（非必须）。

三者的关系，租户属于PlatformID平台，平台归属外联客户代码。外联客户（直联客户）需要对发起的PlatformID、租户ID的准确性负责。

#### 扩展头上送"ZuID（租户ID）和PlatformID（平台ID）"方式如下：

```java
//实例化SDK请求对象sdkRequest
SdkRequest sdkRequest = new SdkRequest();
//定义一个Map用于用于存放请求扩展头键值对
Map<String, String> extraHeaders = new HashMap<>();
//设置PlatformID（平台ID），key固定为"PlatformID"，值修改为客户对应值即可
extraHeaders.put("PlatformID", "PID10010");
//设置ZuID（租户ID），key固定为"ZuID"，值修改为客户对应值即可
extraHeaders.put("ZuID", "ZuID-openbank-001");
//扩展头Map设置到SDK请求对象sdkRequest中
sdkRequest.setExtraHeaders(extraHeaders);
```

#### 接口调用demo如下：

```java
//实例化SDK请求对象sdkRequest
SdkRequest sdkRequest = new SdkRequest();
String path = "/V1.0/bedl/CorAcctBalanceQuery";
sdkRequest.setInterfaceName(path);

JSONObject requestBody = new JSONObject();
requestBody.put("MrchCode", "00301090000002222000");
requestBody.put("Account", "15000134178410");
requestBody.put("CcyCode", "RMB");
sdkRequest.setBody(requestBody);

Map<String, String> extraHeaders = new HashMap<>();
//设置PlatformID（平台ID）
extraHeaders.put("PlatformID", "PID10010");
//设置ZuID（租户ID）
extraHeaders.put("ZuID", "ZuID-openbank-001");
sdkRequest.setExtraHeaders(extraHeaders);

HttpResult httpResult = apiClient.invoke(sdkRequest);
```

## 9 附录：错误码规范

### 9.1 公共错误码

| Code | Message | 描述 |
|------|---------|------|
| 000000 | 处理成功 | |
| E20000 | 服务不可用 | 通讯层面报错：属于未知异常，需要接入方跟开放银行核实后再确定是否可以重新发起。 |
| E30000 | 调用权限不足 | 加签加密、验签验密问题：明确失败，核实原因后，可以重新发起 |
| E30001 | Authorization头字段缺失或令牌无效、公钥证书序列号有误、Token不存在、Token失效、Token有误，验证失败，请做开发者认证、客户未迁移、用户认证不存在、应用未审核、服务未发布、用户未实名认证、用户未签约、服务未签约 | 权限或者数据问题：明确失败，核实原因后，可以重新发起 |
| E30002 | 令牌的作用域不正确,或者违反了安全策略. | 获取Token异常：明确失败，核实原因后，可以重新发起 |
| E30003 | 第三方应用内试图使用不受支持的方法访问资源 | 请求地址API路径错误，请求通讯类型错误：明确失败，核实原因后，可以重新发起 |
| E40000 | 缺少必传参数 | 参数问题：明确失败，核对上送参数，可以重新发起 |
| E40001 | 无效的参数 | 参数问题：核对上送参数，可以重新发起 |
| E50000 | 业务处理失败（通讯成功） | BU通讯成功，但是返回业务报错：业务系统失败，需要跟业务系统核实后再确定处理方案 |
| E60000 | API网关或内部服务错误 | 网关其他内部错误：属于未知异常，需要接入方跟开放银行核实后再确定是否可以重新发起 |

### 9.2 业务错误码

| ErrorCode | ErrorMsg | 错误处理方式 |
|-----------|----------|--------------|
| SERVICE_NOT_AVAILABLE | 服务暂时不可用 | 网关调用BU系统服务出现异常，通知相关人员排查Cat监控 |
| PARA_INVALID | 业务请求参数无效 | ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| INTERNAL_SERVICE_ERROR | 内部服务错误 | 网关内部组件或者程序异常，通知相关人员排查Cat监控 |
| UNPACK_ERROR | 拆包异常 | 报文异常，导致拆包报错，通知相关人员排查Cat监控 |
| PACK_ERROR | 拼包异常 | 报文异常，导致拼包报错，通知相关人员排查Cat监控 |
| SYSINFO_NOT_EXIST | 服务系统参数不存在 | API绑定系统参数在ZK上不存在，通知相关人员排查ZK数据 |
| RCDINFO_NOT_EXIST | RCD报文参数不存在 | API对于的报文字段映射配置在ZK上不存在，通知相关人员排查ZK数据 |
| SDK_SERVICE_ERROR | SDK内部通讯异常 | 网关内部通讯异常，通知相关人员排查Cat监控 |
| OpenId-Connect.Server.Error | 安全内部服务错误 | 安全服务未正常启动成功，通知相关人员排查 |
| OB.Auth.Check.Token.Failed | Authorization头字段缺失或令牌无效 | ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| OB.Auth.Check.Token.Param.Error | 无效的参数 | ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| OB.Auth.Check.Token.Lack.Permission | 调用权限不足 | 校验API或者应用权限异常，ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| OB.Auth.Get.Token.Failed | 令牌的作用域不正确,或者违反了安全策略 | 获取Token异常，ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| OB.Auth.Singed&Encryption.Failed | 调用权限不足 | 加签处理异常，ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| OB.Auth.Singed&decrypt.Failed | 调用权限不足 | 验签处理异常，ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| OB.Auth.Checktoken&Singed&decrypt.Failed | Authorization头字段缺失或令牌无效 | 校验Token时异常，ErrorMsg一般会有具体参数提示错误，只要反馈具体提示错误给相关人员排查即可 |
| DK0000 | 系统异常 | 网关P返回超时，通知相关人员排查Cat监控 |
| DK1530 | 场景不可用 | API下线了，通知相关人员排查 |
| DK1541 | 无提供者节点列表 | 网关P端服务停用，通知相关人员排查 |
| DK1553 | 场景流量达到最大值 | API关联的流控达到了最大值，触发控制。通知相关人员排查 |
| DK1561 | 熔断器熔断 | API关联的熔断达到了熔断阀值，服务断开。通知相关人员排查 |
| 3201 | 与服务提供方通讯异常 | 网关调用后端系统，后端系统服务不可用。通知相关人员排查 |
| 3202 | 与服务提供方创建连接失败 | 网关调用后端系统，后端系统服务不可用。通知相关人员排查 |
| 3211 | 发送数据到服务提供方异常 | 网关调用后端系统，后端系统服务不可用。通知相关人员排查 |
| 3212 | 发送数据到服务提供方超时 | 网关调用后端系统，后端系统服务不可用。通知相关人员排查 |
| 3901 | ESB会话超时 | 网关内部模块调用超时，通知相关人员排查 |