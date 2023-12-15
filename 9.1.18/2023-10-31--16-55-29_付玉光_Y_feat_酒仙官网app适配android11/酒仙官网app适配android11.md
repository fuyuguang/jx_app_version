

<center><big><b> 酒仙官网app适配android11 </b></big></center>


------



[TOC]


#### [页面结构及图片地址]()



```
(用于快速定位要改的文件)，用别名的方式，直接定位并复制到该处

```



### [需求]()







我android 项目的targetSdkVersion为29，现在需要指定为30，请用中文告诉我项目中都需要做哪些适配，每个适配具体的解决方案是什么



```
好的，将targetSdkVersion从29升级到30需要进行一些适配工作。以下是一些常见的适配问题以及解决方案： 
 
1. 行为变更：Android 30引入了一些行为变更，需要注意以下几点： 
   - 存储访问框架：Android 30对外部存储的访问进行了限制，需要使用新的存储访问框架，如使用 Storage Access Framework 或者 MediaStore 来访问文件。 
   - 后台位置访问：如果你的应用需要在后台访问位置信息，需要使用新的API，并请求后台位置访问权限。 
 
2. 权限变更：Android 30对一些敏感权限进行了限制，需要进行适配： 
   - 存储权限：确保你的应用在运行时正确请求和处理存储权限，特别是对于外部存储的使用。 
   - 安装未知来源应用权限：Android 30限制了对安装未知来源应用的权限，需要使用新的API来请求该权限。 
 
3. 后台限制：Android 30对后台任务的限制更加严格，需要注意以下几点： 
   - 后台启动限制：确保你的应用在后台启动其他应用的时候遵循新的限制，如使用 PackageManager.setApplicationCategoryHint() 方法来设置应用的启动类别。 
   - 后台服务限制：Android 30对后台服务的限制更严格，需要使用 JobScheduler 或者 WorkManager 来替代后台服务。 
 
4. 用户界面适配：Android 30引入了一些用户界面的变化，需要进行相应的适配工作： 
   - 悬浮窗口权限：如果你的应用需要使用悬浮窗口，需要请求悬浮窗口权限，并使用新的API来显示悬浮窗口。 
   - 导航手势：Android 30引入了全面屏导航手势，需要确保你的应用在使用手势导航时正常工作。 
 
这只是一些常见的适配问题和解决方案，具体的适配工作还需要根据你的项目具体情况进行。希望对你有所帮助！



```









### 思路：
请认真核对需求每个界面，及其中的文字描述、并充分理解需求后在开发!



### 接口信息




[接口地址]()


```


```




### UI


[UI地址]()


请认真核对UI每个界面，及其中的文字描述、控件样式特效等。
具体包括每个控件的文字大小，背景颜色及形状，是否加粗，等变化。

【实现开发中需要截图app中的该页面和UI图作对比，找差异】


###### a,1
###### a,2
###### a,3
###### a,4
###### a,5
###### a,6
###### a,7
###### a,8
###### a,




### 文案


```


```



需求或UI中的文本描述 例：
```


```




开发的activity 类名，布局文件名，布局id,属性等，涉及到多个文件的改动，就复制一份出来
```
a1, 类名
打开当前页面的activity或fragment后 按快捷键  【shift+Alt+Command+c】或【shift+Command+c】 复制类名



a2,布局名
打开当前页面的activity或fragment后 按快捷键  【Ctrl+Command+UP】显示和当前界面关联的布局 或android 清单文件
    选中要变更的布局后 按快捷键复制布局名到此处

a3,该布局变更的id或属性


a4,该布局变更的文章描述
      从UI图中获取


a5,新增类、view布局、图片、方法、bean对象起名的记录



```


### 待完成的功能


```


```





### bug改动点


##### a,1
[]()




##### a,2
[]()




##### a,3
[]()




### 提交说明

```

2023-10-31--16-55-29_付玉光_Y_feat_酒仙官网app适配android11
feature_fyg_9.1.18_酒仙官网app适配android11

写上日期
分支名
提交说明，提交以一个小功能或完整的功能为一个单位进行commit,不然提交记录会变的杂乱无章，不好回顾历史及归档，经量以rebase的方式合并

a,1
a,2
a,3
a,4
a,5
a,6
a,7
a,8
a,9

```




### 知识网，此处只是知识体系的引用目录路径，具体还需要你建立知识体系目录 通过命令 别名mcm或mcs



[汇总：中国谷歌开发者重要网站（不定期更新） - 知乎](https://zhuanlan.zhihu.com/p/26111363)




[行为变更：以 Android 11 为目标平台的应用](https://developer.android.google.cn/about/versions/11/behavior-changes-all?hl=zh-cn)

[Android 开发者 | Android 11 中的隐私权](https://developer.android.google.cn/about/versions/11/privacy?hl=zh-cn)

[android_各版本](https://developer.android.google.cn/about/versions?hl=zh-cn)


[PermissionX现在支持Java了！还有Android 11权限变更讲解](https://guolin.blog.csdn.net/article/details/106746958)



[(95条消息) Android 11新特性，Scoped Storage又有了新花样_guolin的博客-CSDN博客](https://blog.csdn.net/guolin_blog/article/details/113954552)



[拖不得了，Android 11最全适配指南奉上 - 知乎](https://zhuanlan.zhihu.com/p/275758740)

[(95条消息) Android使用MediaStore获取手机上的文件_yann02的博客-CSDN博客_mediastore](https://blog.csdn.net/yann02/article/details/92844364)

[Environment.isExternalStorageManager()_百度搜索](https://www.baidu.com/s?wd=Environment.isExternalStorageManager()&rsv_spt=1&rsv_iqid=0xb7ae4b6600000f69&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=0&rsv_dl=tb&rsv_sug3=1&rsv_btype=i&inputT=1219&rsv_sug4=1219)

[(95条消息) Android 11 应用兼容性适配,看这篇就够了_冯旭_Android的博客-CSDN博客_安卓11兼容老软件办法](https://blog.csdn.net/weixin_40611659/article/details/108747227)


[MANAGE_EXTERNAL_STORAGE_百度搜索](https://www.baidu.com/s?wd=MANAGE_EXTERNAL_STORAGE&rsv_spt=1&rsv_iqid=0x980fc29d0000b9ca&issp=1&f=8&rsv_bp=0&rsv_idx=2&ie=utf-8&tn=baiduhome_pg)




[MANAGE_EXTERNAL_STORAGE_百度搜索](https://www.baidu.com/s?wd=MANAGE_EXTERNAL_STORAGE&rsv_spt=1&rsv_iqid=0xd6d8fe4f000b5416&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=1&rsv_dl=tb&rsv_sug3=1&rsv_sug2=0&rsv_btype=i&inputT=329&rsv_sug4=330)

[拖不得了，Android 11最全适配指南奉上 - 知乎](https://zhuanlan.zhihu.com/p/275758740)

[android:requestLegacyExternalStorage="true"_百度搜索](https://www.baidu.com/s?wd=android%3ArequestLegacyExternalStorage%3D%22true%22&rsv_spt=1&rsv_iqid=0xfc7d4dda000001a4&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=1&rsv_dl=ib&rsv_sug2=0&rsv_btype=i&inputT=7&rsv_sug4=7)

[Android 开发者  |  Android Developers](https://developer.android.google.cn/about/versions/10)

[Android 开发者  |  Android Developers](https://developer.android.google.cn/about/versions/10/privacy)

[]()
[]()
[]()
[图片或视频路径]()


```


```




[TOC]




```
2023-10-31--16-55-29_付玉光_Y_feat_酒仙官网app适配android11
feature/feature_fyg_9.1.18_酒仙官网app适配android11
```




### 酒仙官网app android9.1.18版本【酒仙官网app适配android11】功能提测


| 提测需求/bug  |   描述          |  开发           |  产品                |      测试           |       完成      |  编号            |  变更影响范围     |   自测    |  提测分支       |  提测时间         |
| ------------ |      ----      |       ----     |      ----            |      ----          |      ----      |  ----            |   ------------  |   ----   |  ------       |  --------        |
|  酒仙官网app适配android11   |                |  付玉光       |   周立新    |           |       ok       | 2023-10-31/16-55-31  |                 |    ok    | feature/feature_preRelease_9.1.18 |  2023-11-08/16:37:56 |





