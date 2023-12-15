[Android 11 中的权限更新  |  Android 开发者  |  Android Developers](https://developer.android.google.cn/about/versions/11/privacy/permissions?hl=zh-cn#auto-reset)





## 电话号码

Android 11 更改了您的应用在读取电话号码时使用的与电话相关的权限。

如果您的应用以 Android 11 或更高版本为目标平台，并且需要访问以下列表中显示的电话号码 API，则必须请求 [`READ_PHONE_NUMBERS`](https://developer.android.google.cn/reference/kotlin/android/Manifest.permission?hl=zh-cn#read_phone_numbers) 权限，而不是 `READ_PHONE_STATE` 权限。

- [`TelephonyManager`](https://developer.android.google.cn/reference/kotlin/android/telephony/TelephonyManager?hl=zh-cn#getline1number) 类和 [`TelecomManager`](https://developer.android.google.cn/reference/kotlin/android/telecom/TelecomManager?hl=zh-cn#getline1number) 类中的 `getLine1Number()` 方法。
- [`TelephonyManager`](https://developer.android.google.cn/reference/kotlin/android/telephony/TelephonyManager?hl=zh-cn) 类中不受支持的 `getMsisdn()` 方法。

如果您的应用声明 `READ_PHONE_STATE` 以调用前面列表中的方法以外的方法，您可以继续在所有 Android 版本中请求 `READ_PHONE_STATE`。不过，如果您仅对前面列表中的方法使用 `READ_PHONE_STATE` 权限，请按以下方式更新您的清单文件：

1. 更改 `READ_PHONE_STATE` 的声明，以使您的应用仅在 Android 10（API 级别 29）及更低版本中使用该权限。
2. 添加 `READ_PHONE_NUMBERS` 权限。

以下清单声明代码段演示了此过程：

```xml
<manifest>
    <!-- Grants the READ_PHONE_STATE permission only on devices that run
         Android 10 (API level 29) and lower. -->
    <uses-permission android:name="READ_PHONE_STATE"
                     android:maxSdkVersion="29" />
    <uses-permission android:name="READ_PHONE_NUMBERS" />
</manifest>
```



```
2023-11-03--17-16-50_付玉光___feat_获取电话号码API须请求READ_PHONE_NUMBERS权限
feature/feature_fyg_9.1.18_获取电话号码API须请求READ_PHONE_NUMBERS权限
```




### 酒仙官网app android9.1.18版本【获取电话号码API须请求READ_PHONE_NUMBERS权限】功能提测


| 提测需求/bug  |   描述          |  开发           |  产品                |      测试           |       完成      |  编号            |  变更影响范围     |   自测    |  提测分支       |  提测时间         |
| ------------ |      ----      |       ----     |      ----            |      ----          |      ----      |  ----            |   ------------  |   ----   |  ------       |  --------        |
|  获取电话号码API须请求READ_PHONE_NUMBERS权限   |                |  付玉光       |   周立新    |           |       ok       | 2023-11-03/17-16-53  |                 |    ok    | feature/feature_preRelease_9.1.18 |  2023-11-08/16:26:02 |





