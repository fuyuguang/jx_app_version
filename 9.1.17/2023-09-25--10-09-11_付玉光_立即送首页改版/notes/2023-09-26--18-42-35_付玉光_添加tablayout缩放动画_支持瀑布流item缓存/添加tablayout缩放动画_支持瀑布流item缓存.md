

<center><big><b> 添加tablayout缩放动画_支持瀑布流item缓存 </b></big></center>


------



[TOC]


#### [页面结构及图片地址]()



```
(用于快速定位要改的文件)，用别名的方式，直接定位并复制到该处

```



### [需求](http://localhost:63342/hdtyi8ly6zpl9km61jh7k6xk9eit3all1lfxh/jiuxian_studio/doc/1%E7%89%88%E6%9C%AC/%E9%85%92%E4%BB%99%E5%AE%98%E7%BD%91app/9.1.17/9.1.17%E7%89%88%E6%9C%AC%E6%80%BB%E7%BB%93/APP:%E5%B0%8F%E7%A8%8B%E5%BA%8F:%E6%96%B0%E5%AE%A2%E6%B4%BB%E5%8A%A8%E9%9C%80%E6%B1%82_v2/index.html#lh=1&id=9b6owo&p=app9_1_17%E7%89%88%E6%9C%AC_%E5%B0%8F%E7%A8%8B%E5%BA%8F%E9%9C%80%E6%B1%82)



```
banner:
不限制尺寸，后台新增两套不同尺寸广告位，广告位分优先级，优先显示小尺寸banner
后台新增两套不同尺寸广告位，广告位分优先级，优先显示小尺寸banner

活动促销:

1、去掉划线价；
2、商品名称展示一行；
3、整体位置尺寸缩小，以UI为准；
4、相关联广告位，如背景图尺寸对应调整尺寸；



1、自营预售商品不展示关联商品（服务端控制，pc/wap/app/小程序都不展示）；

2、app预售商品点击支付定金新增弹窗逻辑；



推荐标题：
1、大于等于两个tab时增加切换下划线；
2、切换选中tab时，图片可放大

1、支持tab切换，最大可设置8个；
2、tab内容为后台 广告位图片 配置，高度宽度尺寸依据UI稿；
3、第一个tab商品为原有逻辑，其他tab商品运营在广告位管理-o2o相关配置-新增商品配置中自行设置，商品数量不做限制；
4、若tab均未配置，tab行隐藏，第一个tab下商品自动上移



```





### 思路：
请认真核对需求每个界面，及其中的文字描述、并充分理解需求后在开发!



### 接口信息



[接口地址]()

[立即送推荐](http://showdoc.9ijx.com/index.php?s=/43&page_id=797)


```



```




### UI

[UI地址](https://lanhuapp.com/web/#/item/project/stage?tid=2bfe6305-22be-4657-8002-077892423dbe&pid=ade3e812-abd9-4f88-85f4-8492cf94f2f8)



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

2023-09-26--18-42-35_付玉光_添加tablayout缩放动画_支持瀑布流item缓存
feature_fyg_9.1.17_添加tablayout缩放动画_支持瀑布流item缓存

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

[详解Android使用CoordinatorLayout+AppBarLayout实现拉伸顶部图片功能](https://cloud.tencent.com/developer/article/1719434)









```

view设置透明度alpha和setBackground的区别


添加混淆防止RecyclerView中属性字段被混淆
添加混淆配置修复RecyclerView反射属性mOverScroller报错问题


Tablayout和Item间距如何设置问题
```












[TOC]









































```
  1 feat(): 立即送首页改 &立即送提交订单地址优化                                                                                                                                               
  2 
  3 a,1
  4 不限制尺寸，后台新增两套不同尺寸广告位，广告位分优先级，优先显示小尺寸banner
  5 a,2
  6 1、去掉划线价；
  7 2、商品名称展示一行；
  8 3、整体位置尺寸缩小，以UI为准；
  9 4、相关联广告位，如背景图尺寸对应调整尺寸；
 10 a,3
 11 推荐标题：
 12 1、支持tab切换，最大可设置8个；
 13 2、tab内容为后台 广告位图片 配置，高度宽度尺寸依据UI稿；
 14 3、第一个tab商品为原有逻辑，其他tab商品运营在广告位管理-o2o相关配置-新增商品配置中自行设置，商品数量不做限制；
 15 4、若tab均未配置，tab行隐藏，第一个tab下商品自动上移
 16 a,4
 17 1、大于等于两个tab时增加切换下划线；
 18 2、切换选中tab时，图片可放大
 19 a,5
 20 推荐商品：
 21 1、商品图片前景图放大且支持瀑布流；
 22 2、按钮新增加购、选规格、立即购买；
 23 3、新增促销标签：限时抢购、限量优惠、买赠、满减、开业领酒
 24 3.1促销互斥关系：
 25 活动促销、买赠、满减三促销间不互斥，
 26 限量优惠与以上三促销均互斥；
 27 开业领酒与以上促销互斥不展示
 28 3.2促销展示优先级：开业领酒>买赠>限量优惠>满减>活动促销；
 29 a,6
 30 1、买赠促销位置：商品图片/商品价格下方（依据UI稿）；
 31 2、买赠促销展示促销标签，及赠品商品图片，赠品大于3个支持左右滑动；
 32 3、点击任意区域跳转商品详情页；
 33 a,7
 34 开业领酒商品点击立即购买跳转提交订单
 35 a,8
 36 去完善收货信息优化：
 37 1、出现场景：a 无可配送收货地址/b 或收货地址列表内最近可配送地址和当前定位距离>500m，以上两种场景自动填充当前定位地址，需完善收货信息；
 38 2、优化：
 39 去完善收货信息内容突出展示，并新增提示：已为您推荐定位地址，请先完善收货人信息，去完善按钮；
 40 3、收货信息完善完成，返回提交订单页该提示消失；未完善返回提交订单页依然显示该提示；
 41 弹窗优化：
 42 1、保留去完善按钮，隐藏取消按钮；
 43 2、点击空白处，弹窗可关闭；
 44 3、点击去完善按钮跳转新增收货地址页（保持原有逻辑）；
 45 
 46 BREAKING CHANGE:增加view复用功能
 
 
 
 
 
 
 
 
 
 
 
 
 
 
//                            PreSellParam preSellParam = new PreSellParam();
//                            preSellParam.isPreSell = mProductDetail.isPreSellProduct() ? "1" : "0";
//                            preSellParam.mProductId = String.valueOf(mProductDetail.mProId);
//                            preSellParam.buyNum = String.valueOf(getChoiceNumber());
//                            String shopId = mProductDetail.mShopBean != null ? String.valueOf(mProductDetail.mShopBean.shopId) : null;
//                            int xinkeType = mProductDetail.mXinKeType;
//                            int isReservation = 0;
//                            if (mProductDetail.isReservationProduct()) {
//                                isReservation = 1;
//                            }
//                            if (mProductDetail.isO2OReservationProduct()) {
//                                isReservation = 2;
//                            }
//
//                            gotoOrderCommitActivity(null, preSellParam, false, null, isReservation, mLiveId, mAnchorId, shopId, xinkeType);







storeDetail.mCode == 9




private void buy(int num) {

 
 
```

