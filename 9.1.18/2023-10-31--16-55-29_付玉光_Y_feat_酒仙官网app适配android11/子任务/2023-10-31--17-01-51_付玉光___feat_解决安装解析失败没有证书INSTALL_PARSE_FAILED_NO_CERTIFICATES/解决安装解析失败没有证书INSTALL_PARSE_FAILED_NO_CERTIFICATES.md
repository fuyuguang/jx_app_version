

<center><big><b> 解决安装解析失败没有证书INSTALL_PARSE_FAILED_NO_CERTIFICATES </b></big></center>


------



[TOC]


#### [页面结构及图片地址]()



```
(用于快速定位要改的文件)，用别名的方式，直接定位并复制到该处

```



### [需求]()



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

2023-10-31--17-01-51_付玉光___feat_解决安装解析失败没有证书INSTALL_PARSE_FAILED_NO_CERTIFICATES
feature_fyg_9.1.18_解决安装解析失败没有证书INSTALL_PARSE_FAILED_NO_CERTIFICATES

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



[android - 什么是 INSTALL_PARSE_FAILED_NO_CERTIFICATES 错误？ - 堆栈溢出](https://stackoverflow.com/questions/2914105/what-is-install-parse-failed-no-certificates-error)

[运行App 出现INSTALL_PARSE_FAILED_NO_CERTIFICATES报错_我看世界的博客-CSDN博客](https://blog.csdn.net/qq_43013648/article/details/119356279)

```
如果你的targetSdkVersion修改到30，那么你就必须要加上v2签名才行。否则	    无法安装和更新

```





[无法上传 targetSdkVersion 为 30 的签名 apk | 那些遇到过的问题](https://qa.1r1g.com/sf/ask/4427265951/)

对于那些在命令行上构建 Cordova 项目的简短回答：您需要从 to 切换`jarsigner`并`apksigner`相应地设置命令。注意：你需要在`zipalign` *之前* `apksigner`运行，这与我们过去使用它的方式不同`jarsigner`。这是一个例子：



```
zipalign -f 4 platforms/android/app/build/outputs/apk/release/myapp-release-unsigned.apk myapp.apk

apksigner sign --ks my-ks.keystore --ks-pass file:my-passfile.txt --v1-signing-enabled true --v2-signing-enabled true myapp.apk

```





[]()
[]()
[]()
[图片或视频路径]()


```


```




[TOC]




```
2023-10-31--17-01-51_付玉光___feat_解决安装解析失败没有证书INSTALL_PARSE_FAILED_NO_CERTIFICATES
feature/feature_fyg_9.1.18_解决安装解析失败没有证书INSTALL_PARSE_FAILED_NO_CERTIFICATES
```




### 酒仙官网app android9.1.18版本【解决安装解析失败没有证书INSTALL_PARSE_FAILED_NO_CERTIFICATES】功能提测


| 提测需求/bug  |   描述          |  开发           |  产品                |      测试           |       完成      |  编号            |  变更影响范围     |   自测    |  提测分支       |  提测时间         |
| ------------ |      ----      |       ----     |      ----            |      ----          |      ----      |  ----            |   ------------  |   ----   |  ------       |  --------        |
|  解决安装解析失败没有证书INSTALL_PARSE_FAILED_NO_CERTIFICATES   |                |  付玉光       |   周立新    |           |       ok       | 2023-10-31/17-01-58  |                 |    ok    | feature/feature_preRelease_9.1.18 |  2023-11-08/16:25:04 |





