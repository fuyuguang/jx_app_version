[行为变更：以 Android 11 为目标平台的应用  |  Android 开发者  |  Android Developers](https://developer.android.google.cn/about/versions/11/behavior-changes-11?hl=zh-cn)



### 现在需要 APK 签名方案 v2

对于以 Android 11（API 级别 30）为目标平台，且目前仅使用 APK 签名方案 v1 签名的应用，现在还必须使用 [APK 签名方案 v2](https://source.android.google.cn/security/apksigning/v2?hl=zh-cn) 或更高版本进行签名。用户无法在搭载 Android 11 的设备上安装或更新仅通过 APK 签名方案 v1 签名的应用。

如需验证您的应用是否已使用 APK 签名方案 v2 或更高版本进行签名，您可以在命令行中使用 [Android Studio](https://developer.android.google.cn/studio/publish/app-signing?hl=zh-cn#sign_release) 或 [`apksigner`](https://developer.android.google.cn/studio/command-line/apksigner?hl=zh-cn) 工具。

**注意**：为支持运行旧版 Android 的设备，除了使用 APK 签名方案 v2 或更高版本为您的 APK 签名之外，您还应继续使用 APK 签名方案 v1 进行签名。



```
2023-11-03--17-33-17_付玉光___feat_必须使用APK签名方案v2
feature/feature_fyg_9.1.18_必须使用APK签名方案v2
```




### 酒仙官网app android9.1.18版本【必须使用APK签名方案v2】功能提测


| 提测需求/bug  |   描述          |  开发           |  产品                |      测试           |       完成      |  编号            |  变更影响范围     |   自测    |  提测分支       |  提测时间         |
| ------------ |      ----      |       ----     |      ----            |      ----          |      ----      |  ----            |   ------------  |   ----   |  ------       |  --------        |
|  必须使用APK签名方案v2   |                |  付玉光       |   周立新    |           |       ok       | 2023-11-03/17-33-19  |                 |    ok    | feature/feature_preRelease_9.1.18 |  2023-11-08/16:26:37 |





