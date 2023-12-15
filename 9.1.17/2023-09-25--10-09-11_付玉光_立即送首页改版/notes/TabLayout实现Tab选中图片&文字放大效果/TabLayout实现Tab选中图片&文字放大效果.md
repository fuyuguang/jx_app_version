

<center><big><b> TabLayout实现Tab选中图片&文字放大效果 </b></big></center>


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

2023-10-20--15-15-32_付玉光___note_TabLayout实现Tab选中图片&文字放大效果
feature_fyg_9.1.17_TabLayout实现Tab选中图片&文字放大效果

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
[tabLayout添加自定义图片并支持选中缩放变大效果](/Users/fuyuguang/Github/UI/material-components-android)

[TabLayout实现Tab选中图片&文字放大效果](https://www.jianshu.com/p/c8ea7d2025be)
[]()
[选项卡布局](https://developer.android.com/reference/com/google/android/material/tabs/TabLayout)
[TabLayout 文字/图标/背景动画](https://blog.csdn.net/yukun314/article/details/108918352)
[]()
[Design库-TabLayout仿京东商品详情Tab](https://www.jianshu.com/p/116f87abdaea)

[Android Tablayout 自定义Tab布局的使用案例](https://pythonjishu.com/thqiigbduzkbyvy/)
```text
for (int i = 0; i < tabLayout.getTabCount(); i++) {
    TabLayout.Tab tab = tabLayout.getTabAt(i);
    if (tab != null) {
        tab.setCustomView(R.layout.tab_layout_icon);
        ImageView tabIcon = tab.getCustomView().findViewById(R.id.tab_icon);
        tabIcon.setImageResource(ICON_RESID[i]);
    }
}

```
[自定义TabLayout，神奇效果竟是这么简单！](https://mp.weixin.qq.com/s?__biz=MzA5MzI3NjE2MA==&mid=2650250665&idx=1&sn=0bc1698f153c25b73b29b3cbe8c58734&chksm=88636cc6bf14e5d0a9a8eb7cfff1c069496d1d7c14d2c37a7b9679abc9061164e9ad985463d5&scene=27)
[]()
[BottomNavigationViewEx](https://github.com/ittianyu/BottomNavigationViewEx)
[]()
[]()
[]()
[本地项目BottomNavigationViewEx](/Users/fuyuguang/Github/UI/NavigationView)
[]()
[]()
[图片或视频路径]()


```


```




[TOC]


