

<center><big><b> Tablayout和Item间距如何设置问题 </b></big></center>


------



[TOC]


#### [页面结构及图片地址]()



```
(用于快速定位要改的文件)，用别名的方式，直接定位并复制到该处

```



### 需求





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

2023-10-10--09-19-52_付玉光_Tablayout和Item间距如何设置问题
feature_fyg_9.1.17_Tablayout和Item间距如何设置问题

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




[Tablayout设置间距](https://blog.csdn.net/qq_37142785/article/details/110550184)

[Android TabLayout 自定义Tab样式后宽度无法调整问题](https://www.jianshu.com/p/dc451e1a3144)

```text
记录处理方法：
直接在布局中给Tablayout 设置
app:tabMaxWidth="200dp"
app:tabMinWidth="20dp"

只要给他设置最大和最小宽度后，接着在设置
app:tabPaddingStart="12dp"或者
app:tabPaddingEnd="12dp"
调整panding 间距就可以了

```


[取消Tablayout的光标、设置TextView上下的间距](https://www.jianshu.com/p/76ecf8ed802c)



 // 隐藏Tablayout的光标

直接在tablayout中设置以下属性

app:tabIndicatorHeight="@dimen/dp_0"



//设置TextView字体上下间距

android:lineSpacingExtra="@dimen/dp_10"



[]()
[]()
[]()

```


```




[TOC]

