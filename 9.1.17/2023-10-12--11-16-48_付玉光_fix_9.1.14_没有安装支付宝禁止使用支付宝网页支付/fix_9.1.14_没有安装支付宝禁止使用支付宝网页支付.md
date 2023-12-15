

<center><big><b> fix_9.1.14_没有安装支付宝禁止使用支付宝网页支付 </b></big></center>


------



[TOC]


#### [页面结构及图片地址]()



```
(用于快速定位要改的文件)，用别名的方式，直接定位并复制到该处

```



### [需求]()





### 思路：
请认真核对需求每个界面，及其中的文字描述、并充分理解需求后在开发!





[判断Android设备上是否安装了某款应用的实现方法](https://www.python100.com/html/70440.html)



如果没有安装支付宝就toast提示：

您还没有安装支付宝





android.permission.QUERY_ALL_PACKAGES

api29以上检测其他应用是否安装需要添加权限



[Android 获取手机已安装的应用列表（适配）](https://blog.csdn.net/c6E5UlI1N/article/details/129311768)



[android 11 软件包可见性](https://www.jianshu.com/p/c35adf1543d5)





[oppo 开放平台 Android适配服务](https://open.oppomobile.com/new/developmentDoc/info?id=10724)



[管理软件包可见性](https://developer.android.google.cn/training/basics/intents/package-visibility?hl=zh_cn)

```
adb shell dumpsys package queries
```





[如何在Android 11 上获取已安装应用列表](https://blog.csdn.net/u010844304/article/details/111044338?spm=1001.2101.3001.6650.7&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-7-111044338-blog-132245569.235%5Ev38%5Epc_relevant_sort&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-7-111044338-blog-132245569.235%5Ev38%5Epc_relevant_sort&utm_relevant_index=10)





[Android不同版本读取已安装应用列表权限相关问题](https://blog.csdn.net/g270382086/article/details/115554563?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-115554563-blog-111044338.235^v38^pc_relevant_sort&spm=1001.2101.3001.4242.2&utm_relevant_index=2)





```

```





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

2023-10-12--11-16-48_付玉光_fix_9.1.14_没有安装支付宝禁止使用支付宝网页支付
feature_fyg_9.1.17_fix_9.1.14_没有安装支付宝禁止使用支付宝网页支付

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
[]()
[]()
[]()
[图片或视频路径]()


```


```




[TOC]




```
2023-10-12--11-16-48_付玉光_fix_9.1.14_没有安装支付宝禁止使用支付宝网页支付
feature/feature_fyg_9.1.17_fix_9.1.14_没有安装支付宝禁止使用支付宝网页支付
```




### 酒仙官网app android9.1.17版本【fix_9.1.14_没有安装支付宝禁止使用支付宝网页支付】功能提测


| 提测需求/bug  |   描述          |  开发           |  产品                |      测试           |       完成      |  编号            |  变更影响范围     |   自测    |  提测分支       |  提测时间         |
| ------------ |      ----      |       ----     |      ----            |      ----          |      ----      |  ----            |   ------------  |   ----   |  ------       |  --------        |
|  fix_9.1.14_没有安装支付宝禁止使用支付宝网页支付   |                |  付玉光       |   周立新    |           |       ok       | 2023-10-12/11-16-49  |                 |    ok    | feature/feature_preRelease_9.1.17 |  2023-10-18/10:58:53 |





