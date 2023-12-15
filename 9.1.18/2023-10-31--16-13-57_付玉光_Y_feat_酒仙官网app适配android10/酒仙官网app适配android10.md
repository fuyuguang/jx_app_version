

<center><big><b> 酒仙官网app适配android10 </b></big></center>


------



[TOC]


#### [页面结构及图片地址]()



```
(用于快速定位要改的文件)，用别名的方式，直接定位并复制到该处

```



### [需求]()





我android 项目的targetSdkVersion为28，现在需要指定为29，请用中文告诉我项目中都需要做哪些适配，每个适配具体的解决方案是什么



```

好的，将targetSdkVersion从28升级到29需要进行一些适配工作。以下是一些常见的适配问题以及解决方案： 
 
1. 行为变更：Android 29引入了一些行为变更，需要注意以下几点： 
   - 隐式Intent的限制：如果你的应用使用了隐式Intent启动其他应用的组件，需要确保目标应用的targetSdkVersion也为29或更高，否则可能会出现启动失败的情况。 
   - 非SDK接口限制：Android 29限制了对非SDK接口的访问，如果你的应用使用了非SDK接口，需要使用官方提供的替代方案或者标记为兼容模式。 
   - 文件共享：Android 29对应用之间的文件共享进行了限制，需要使用FileProvider来共享文件。 
 
2. 权限变更：Android 29对一些敏感权限进行了限制，需要进行适配： 
   - 运行时权限：确保你的应用在运行时正确请求和处理权限，特别是对于存储权限的使用。 
   - 安装未知来源应用权限：Android 29限制了对安装未知来源应用的权限，需要使用新的API来请求该权限。 
 
3. 后台限制：Android 29对后台服务的限制更加严格，需要注意以下几点： 
   - 后台任务限制：确保你的应用在后台执行任务时遵循新的限制，如使用JobScheduler来替代后台服务。 
   - 后台位置访问：如果你的应用需要在后台访问位置信息，需要使用新的API，并请求后台位置访问权限。 
 
4. UI适配：Android 29引入了一些UI变化，需要进行相应的适配工作： 
   - Dark Mode适配：如果你的应用支持Dark Mode，需要确保在Android 29上正确显示暗色主题。 
   - 导航手势：Android 29引入了全面屏导航手势，需要确保你的应用在使用手势导航时正常工作。 
 
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

2023-10-31--16-13-57_付玉光_Y_feat_酒仙官网app适配android10
feature_fyg_9.1.18_酒仙官网app适配android10

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
[]()


[Android 10 适配攻略，你适配了吗？ - 子傲代码魔法-小鑫的技术流水账](https://www.ziaostudio.com/android-10-%E9%80%82%E9%85%8D%E6%94%BB%E7%95%A5%EF%BC%8C%E4%BD%A0%E9%80%82%E9%85%8D%E4%BA%86%E5%90%97%EF%BC%9F.html)



[总结系列-Android10适配-蒲公英云](https://www.dandelioncloud.cn/article/details/1601914980083646466)





[(87条消息) Android 10适配要点，作用域存储_郭霖的专栏-CSDN博客_android10存储适配](https://guolin.blog.csdn.net/article/details/105419420)

[]()

[guolindev/ScopedStorageDemo：演示范围存储如何在 Android 11 上工作并向后兼容以前的版本。](https://github.com/guolindev/ScopedStorageDemo)





[android 10 适配_百度搜索](https://www.baidu.com/s?wd=android%2010%20%E9%80%82%E9%85%8D&rsv_spt=1&rsv_iqid=0xcf1ba5c800190d38&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&rqlang=cn&tn=baiduhome_pg&rsv_dl=tb&rsv_enter=1&oq=targetSdkVersion%2520%253A%252029%25E9%2580%2582%25E9%2585%258D&rsv_btype=t&inputT=6119&rsv_t=953290LlXn2UOPk61XM0EyNNRNeoiKt%2BV7kgj0fDdU11AMOPhfZQvHXzM3Wsb%2B3pF07m&rsv_sug3=42&rsv_sug1=46&rsv_sug7=100&rsv_pq=f10d325d000a54a4&rsv_sug2=0&rsv_sug4=12712)

[(87条消息) 关于Android 10.0适配，看这篇就够了_冯旭的博客-CSDN博客_android10适配](https://blog.csdn.net/weixin_40611659/article/details/95174124)

[Android 10 适配攻略，你适配了吗？ - 简书](https://www.jianshu.com/p/1c32bf2d9339)

[Android 开发者  |  Android Developers](https://developer.android.google.cn/about/versions/10)

[user-interface-samples/PreferencesKotlin at master · android/user-interface-samples](https://github.com/android/user-interface-samples/tree/master/PreferencesKotlin)

[Android 10 中的隐私权变更  |  Android 开发者  |  Android Developers](https://developer.android.google.cn/about/versions/10/privacy/changes)

[访问共享存储空间中的媒体文件  |  Android 开发者  |  Android Developers](https://developer.android.google.cn/training/data-storage/shared/media)

[MediaStore.Files  |  Android Developers](https://developer.android.google.cn/reference/android/provider/MediaStore.Files)




[图片或视频路径]()


```


```




[TOC]







Android11以上可以通过isExternalStorageManager来处理

```

if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
    if (Environment.isExternalStorageManager()) {
    } else {
    }
}



```







从相册选择图片换头像报错：



```


FATAL EXCEPTION: main
    Process: com.jiuxianapk.ui, PID: 32146
    java.lang.RuntimeException: Failure delivering result ResultInfo{who=null, request=2, result=-1, data=Intent { dat=content://media/external_primary/images/media/10885 flg=0x1 }} to activity {com.jiuxianapk.ui/com.jiuxian.client.ui.MyUserInfoActivity2}: java.lang.SecurityException: UID 10412 does not have permission to content://media/external_primary/images/media/10885 [user 0]
    	at android.app.ActivityThread.deliverResults(ActivityThread.java:5517)
    	at android.app.ActivityThread.handleSendResult(ActivityThread.java:5556)
    	at android.app.servertransaction.ActivityResultItem.execute(ActivityResultItem.java:54)
    	at android.app.servertransaction.ActivityTransactionItem.execute(ActivityTransactionItem.java:45)
    	at android.app.servertransaction.TransactionExecutor.executeCallbacks(TransactionExecutor.java:135)
    	at android.app.servertransaction.TransactionExecutor.execute(TransactionExecutor.java:95)
    	at android.app.ActivityThread$H.handleMessage(ActivityThread.java:2348)
    	at android.os.Handler.dispatchMessage(Handler.java:106)
    	at android.os.Looper.loopOnce(Looper.java:233)
    	at android.os.Looper.loop(Looper.java:344)
    	at android.app.ActivityThread.main(ActivityThread.java:8191)
    	at java.lang.reflect.Method.invoke(Native Method)
    	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:584)
    	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:1034)
    Caused by: java.lang.SecurityException: UID 10412 does not have permission to content://media/external_primary/images/media/10885 [user 0]
    	at android.os.Parcel.createExceptionOrNull(Parcel.java:2442)
    	at android.os.Parcel.createException(Parcel.java:2426)
    	at android.os.Parcel.readException(Parcel.java:2409)
    	at android.os.Parcel.readException(Parcel.java:2351)
    	at android.app.IActivityTaskManager$Stub$Proxy.startActivity(IActivityTaskManager.java:2284)
    	at android.app.Instrumentation.execStartActivity(Instrumentation.java:1766)
    	at android.app.Activity.startActivityForResult(Activity.java:5489)
    	at androidx.activity.ComponentActivity.startActivityForResult(ComponentActivity.java:575)
    	at android.app.Activity.startActivityForResult(Activity.java:5442)
    	at androidx.activity.ComponentActivity.startActivityForResult(ComponentActivity.java:561)
    	at com.jiuxian.client.ui.MyUserInfoActivity2.startPhotoZoom(MyUserInfoActivity2.kt:420)
    	at com.jiuxian.client.ui.MyUserInfoActivity2.onActivityResult(MyUserInfoActivity2.kt:455)
    	at android.app.Activity.dispatchActivityResult(Activity.java:8487)
    	at android.app.ActivityThread.deliverResults(ActivityThread.java:5510)
    	at android.app.ActivityThread.handleSendResult(ActivityThread.java:5556) 
    	at android.app.servertransaction.ActivityResultItem.execute(ActivityResultItem.java:54) 
    	at android.app.servertransaction.ActivityTransactionItem.execute(ActivityTransactionItem.java:45) 
    	at android.app.servertransaction.TransactionExecutor.executeCallbacks(TransactionExecutor.java:135) 
    	at android.app.servertransaction.TransactionExecutor.execute(TransactionExecutor.java:95) 
    	at android.app.ActivityThread$H.handleMessage(ActivityThread.java:2348) 
    	at android.os.Handler.dispatchMessage(Handler.java:106) 
    	at android.os.Looper.loopOnce(Looper.java:233) 
    	at android.os.Looper.loop(Looper.java:344) 
    	at android.app.ActivityThread.main(ActivityThread.java:8191) 
    	at java.lang.reflect.Method.invoke(Native Method) 
    	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:584) 
    	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:1034) 
    	
```




















```
2023-10-31--16-13-57_付玉光_Y_feat_酒仙官网app适配android10
feature/feature_fyg_9.1.18_酒仙官网app适配android10
```




### 酒仙官网app android9.1.18版本【酒仙官网app适配android10】功能提测


| 提测需求/bug  |   描述          |  开发           |  产品                |      测试           |       完成      |  编号            |  变更影响范围     |   自测    |  提测分支       |  提测时间         |
| ------------ |      ----      |       ----     |      ----            |      ----          |      ----      |  ----            |   ------------  |   ----   |  ------       |  --------        |
|  酒仙官网app适配android10   |                |  付玉光       |   周立新    |           |       ok       | 2023-10-31/16-13-59  |                 |    ok    | feature/feature_preRelease_9.1.18 |  2023-11-08/16:38:04 |





