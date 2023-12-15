



Jenkins 环境配置



```

java -jar ./buildConfig/testt.jar ./build/apk/ jiuxianwebsite ./buildConfig/app.properties app.channels2 ./release.keystore "./shell/" "/usr/local/android-sdk-linux/build-tools/30.0.2/zipalign  -f -v 4" "/usr/local/android-sdk-linux/build-tools/30.0.2/apksigner"

java -jar ./buildConfig/channelupdateInfo.jar ./build/apk/ http://m.jiuxian.com/mobile/android/update/ ./buildConfig/app.properties $JOB_NAME

sudo cp -f -r ./build/apk/* /storage/web/yanfa/data/release

```







```

我在电脑上执行如下命令：
sh ./jiagu ./jiuxian_9.1.18_jiuxianwebsite.apk ./jiuxian_9.1.18_jiuxianwebsite1.apk ./base.conf
报错：
./jiagu: cannot execute binary file
知道是什么原因吗？
./jiagu我看的有可执行权限


mac电脑需要安装相应软件，其中 apt-get 找不到安装，需要  fink的支持，但fink没有对应的新版本安装


```









[优酷Android包瘦身治理思路全解 - 知乎](https://zhuanlan.zhihu.com/p/534047040)



[Android11 resources.arsc不支持压缩问题解决](https://www.dandroid.cn/18649)
[android11适配 - 大安卓](https://www.dandroid.cn/18649)




[Google I/O 2016 笔记：APK 瘦身的正确姿势 - 知乎](https://zhuanlan.zhihu.com/p/21543787)



[resources.arsc压缩会影响性能吗？ · Issue #84 · shwenzhang/AndResGuard](https://github.com/shwenzhang/AndResGuard/issues/84)



[【精选】android-加壳加固_android aar 保护 lisence-CSDN博客](https://blog.csdn.net/yangxuan0261/article/details/128047927)



```

直接把 apk 当成 zip 解压到一个 目录 a 中

让后对 dex, so 加固处理

然后把 目录 a 用 zip 压缩为 apk 文件

压缩过程中, resources.arsc 文件不能压缩, 要以文档形式存储 ZIP_STORED, 
不然会出现这个错误 
[安装到 安卓 11+ (API 级别 30) 机子未 4 字节对齐 或者 resources.arsc 被压缩了]
(#安装到 安卓 11+ (API 级别 30) 机子未 4 字节对齐 或者 resources.arsc 被压缩了)

对压缩好的 apk 进行 4 字节对齐
zipalign.exe -p -f -v 4 I:/unalign.apk I:/align.apk

对 4 字节对齐好的 apk, 用 apksigner (不是 jarsigner) 进行签名.
java -jar apksigner.jar sign -verbose --v1-signing-enabled false --v2-signing-enabled true --ks "E:/test_jks.jks" --ks-key-alias test_alias --ks-pass pass:test_pass --key-pass pass:test_pass --out I:/signed.apk --in I:/align.apk



```







```

安装到 安卓 11+ (API 级别 30) 机子未 4 字节对齐 或者 resources.arsc 被压缩了
报错: adb: failed to install xxx.apk: Failure [-124: Failed parse during installPackageLI: Targeting R+ (version 30 and above) requires the resources.arsc of installed APKs to be stored uncompressed and aligned on a 4-byte boundary]

这里有有可能有两个问题

resources.arsc 被压缩了

解决办法: 在压缩 apk 目录文件时, 对 resources.arsc 特别处理, 不进行压缩

默认 zip 压缩类型是 ziplib.ZIP_DEFLATED, 需要针对这个文件设置为 ziplib.ZIP_STORED, Python 参考代码

# 压缩 srcDir 目录为 dstFile
def zipDir(srcDir: str, dstFile: str, mode: int = ziplib.ZIP_DEFLATED, isIncludeParent: bool = True):
    with ziplib.ZipFile(dstFile, 'w', mode) as zip:
        pDir = isIncludeParent and os.path.dirname(srcDir) or srcDir
        for root, dirs, files in os.walk(srcDir):
            for file in files:
                absDir = os.path.join(root, file)
                relativeDir = absDir.replace(pDir, "")
                if "resources.arsc" in relativeDir: # 特殊处理这个文件
                    zip.write(absDir, relativeDir, ziplib.ZIP_STORED)
                else:
                    zip.write(absDir, relativeDir)



apk 包未 4 字节对齐
签名前, 4 字节对齐一下, 然后再签名
zipalign -p -f -v 4 in_unalign.apk out_align.apk



```














[（原创）Android apk应用加固、字节对齐、二次签名全流程](https://www.xjx100.cn/news/503257.html?action=onClick)




```



adb -s 9fde7e2e install /Users/fuyuguang/Downloads/jiuxian_9.1.18_jiuxianwebsite1.apk 
Performing Streamed Install



adb: failed to install /Users/fuyuguang/Downloads/jiuxian_9.1.18_jiuxianwebsite1.apk: 
Failure [-124: Failed parse during installPackageLI: 

Targeting R+ (version 30 and above) requires the resources.arsc of installed APKs to be 
stored uncompressed and aligned on a 4-byte boundary]


针对 R+（版本 30 及更高版本）要求已安装 APK 的 resources.arsc 未压缩存储并在 4 字节边界上对齐




```







[APP 加固添加签名后无法安装_zipalign -p-CSDN博客](https://blog.csdn.net/Misdirection_XG/article/details/125336074)



```

zipalign -p -f -v 4 未对齐(jarsigner已签名)APK文件 生成的APK文件 

zipalign -p -f -v 4 .\myapp1.apk .\myapp2.apk 



```





验证对齐

```

zipalign -c -v 4 要验证的APK文件 

```







使用 zipalign 工具进行对齐，再用 apksigner 重新签名就行了



zipalign 和 apksigner 都由Google官方提供,安装 Android 环境的时候就装好了，使用时需要先配置环境变量， 

zipalign 和 apksigner 在 Android SDK/build-tools/SDK版本/目录









[Zipalign对Apk文件进行存档对齐 - 简书](https://www.jianshu.com/p/91017e6a2ff0)



```

-c ：检查.apk文件是否zipalign优化过

-f ：覆盖已经存在的文件

-p ：页面对其存储对象文件

-v ：输出优化后的详细信息 xx.apk

-z ：将使用Zopfli

```









[Targeting R+ (version 30 and above) ...-CSDN博客](https://blog.csdn.net/qq_40837613/article/details/129814782)



```

这时候 需要使用zipalign进行对齐
zipalign介绍
题主是mac电脑 在使用命令行时 一直搜索不到 zipalign
建议直接去
sdk目录下/build-tools/版本号/zipalign  拷贝到  sdk目录下/tools/zipalign 即可使用
使用方法


如需对齐 1.apk 并将其保存为 2.apk，请运行以下命令：
 

zipalign -p -f -v 4 1.apk 2.apk
如需确认 3.apk 的对齐方式，请运行以下命令：

zipalign -c -v 4 3.apk
对齐完成后不再使用 jarsigner 签名，而是用 apksigner。在 sdk目录下/build-tools 中可以找到

/// apksigner sign --ks (签名地址) --ks-key-alias (别名) --out (签名后的apk地址) (待签名apk地址)
apksigner sign --ks android.keystore --ks-key-alias androidkey  --out  11.apk  22.apk
```











[【精选】Targeting R+ (version 30 and above) requires the resources.arsc of installed APKs to be stored uncom_学无止境-T的博客-CSDN博客](https://blog.csdn.net/qq_23045311/article/details/125814795)





#### 执行对齐的时机

```

zipalign
zipalign 是一种 zip 归档文件对齐工具。它可确保归档中的所有未压缩文件相对于文件开头都是对齐的。这样一来，您便可直接通过 mmap(2) 访问这些文件，而无需在 RAM 中复制相关数据并减少了应用的内存用量。


在将 APK 文件分发给最终用户之前，应该先使用 zipalign 进行优化。如果您使用 Android Studio 进行构建，则此步骤会自动完成。本文档适用于自定义构建系统的维护者。

注意：您必须在应用构建过程中的两个特定时间点之一使用 zipalign，具体在哪个时间点使用，取决于您所使用的应用签名工具：


如果您使用的是 apksigner，只能在为 APK 文件签名之前执行 zipalign。


如果您在使用 apksigner 为 APK 签名之后对 APK 做出了进一步更改，签名便会失效。



如果您使用的是 jarsigner，只能在为 APK 文件签名之后执行 zipalign。



```

















>我刚适配了android 30 ,打包后用adb install apk 安装apk报如下这个错，请用中文告诉我，产生这个问题的原因和解决方案

> Failure [-124: Failed parse during installPackageLI: Targeting R+ (version 30 and above) requires the resources.arsc of >installed APKs to be stored uncompressed and aligned on a 4-byte boundary]





````



这个错误是由于在适配Android 30及以上版本时，APK的resources.arsc文件需要以未压缩的形式存储，并按照4字节边界对齐。
导致安装APK时出现解析失败的问题。 
产生这个问题的原因是在构建APK时，resources.arsc文件被压缩或对齐方式不正确，导致无法正确解析。 
要解决这个问题，
你可以尝试以下解决方案：  
1. 确保你的构建工具和构建脚本是最新的，并且使用Android Gradle插件7.0.0及以上版本。 
2. 在应用的build.gradle文件中添加以下配置：

```
groovy



android {
    // 其他配置项...
    aaptOptions {
        noCompress "resources.arsc"
    }
}
```

这个配置将禁用对resources.arsc文件的压缩，确保它以未压缩的形式存储。   3. 重新构建APK并尝试安装。 



````











在Android的build.gradle文件中，通过指定 `noCompress "resources.arsc"` 配置，

可以禁止对resources.arsc文件进行压缩。这个配置的作用是确保resources.arsc文件以未压缩的形式存储在生成的APK中。   

resources.arsc文件是Android应用的资源表文件，包含了应用的所有资源信息，如布局、字符串、图像等。在构建APK时，通常会对资源文件进行压缩，以减小APK的体积。然而，

在Android 30及以上版本中，要求resources.arsc文件必须以未压缩的形式存储，并按照4字节边界对齐。

   通过在build.gradle文件中添加 `noCompress "resources.arsc"` 配置，告诉构建系统不要对resources.arsc文件进行压缩。

这样，生成的APK中的resources.arsc文件将以未压缩的形式存储，以满足Android 30及以上版本的要求。   这个配置项通常用于解决"Targeting R+ (version 30 and above) requires the resources.arsc of installed APKs to be stored uncompressed and aligned on a 4-byte boundary"这类错误，确保resources.arsc文件的正确存储格式。









​	



这个错误是由于在适配Android 30及以上版本时，APK的resources.arsc文件需要以未压缩的形式存储，并按照4字节边界对齐。导致安装APK时出现解析失败的问题。   产生这个问题的原因是在构建APK时，resources.arsc文件被压缩或对齐方式不正确，导致无法正确解析。

要解决这个问题，你可以尝试以下解决方案：   1. 确保你的构建工具和构建脚本是最新的，并且使用Android Gradle插件7.0.0及以上版本。   2. 在应用的build.gradle文件中添加以下配置：















>如何检测APK的resources.arsc文件是否按照4字节边界对齐，请给出方案并用中文解释？

```
要检测APK的resources.arsc文件是否按照4字节边界对齐，可以使用以下方案： 
 
1. 将APK文件更名为.zip文件，例如将"app.apk"更名为"app.zip"。 
 
2. 解压缩该.zip文件，得到一个包含资源文件的文件夹。 
 
3. 在解压后的文件夹中，找到并打开"resources.arsc"文件。 
 
4. 使用二进制文件编辑器（如Hex编辑器）打开"resources.arsc"文件。 
 
5. 检查文件的字节偏移量（offset），确保每个资源条目的起始位置都是4的倍数。可以通过检查每个资源条目的起始位置是否能被4整除来判断。 
 
6. 如果所有资源条目的起始位置都能被4整除，则说明resources.arsc文件按照4字节边界对齐。如果存在起始位置不能被4整除的资源条目，则说明resources.arsc文件没有按照4字节边界对齐。 
 
通过这个方案，你可以手动检测APK的resources.arsc文件是否按照4字节边界对齐。请注意，这是一种手动的方法，对于大型APK文件或自动化检测，可能需要使用专门的工具或脚本来进行检测。

```









> zipalign -p -f -v 4 1.apk 2.apk  

>这行命令的作用是什么? 执行这个命令后能否确保apk文件按4字节边界对齐？

>如下这个命令的作用是什么？

>zipalign -c -v 4 3.apk

>用中文具体回答我

```

这行命令  zipalign -p -f -v 4 1.apk 2.apk  的作用是

将名为  1.apk  的APK文件按照4字节边界对齐，并生成一个名为  2.apk  的新APK文件。 
 
执行这个命令后，确保生成的  2.apk  文件按照4字节边界对齐。这是因为  
-p  参数指定了对齐操作， 
-f  参数表示强制覆盖现有的输出文件， 
-v  参数用于显示详细的操作日志，而  
4  参数表示对齐边界为4字节。 
 
另外，这个命令  zipalign -c -v 4 3.apk  的作用是
检查名为  3.apk  的APK文件是否按照4字节边界对齐。 
 
通过执行这个命令，会显示详细的操作日志（ -v  参数），并检查  3.apk  文件是否按照4字节边界对齐（ -c  参数）。
如果文件已经按照4字节边界对齐，则命令会显示成功的消息，否则会显示相应的错误消息。 
 
请注意，这两个命令都是使用  zipalign  工具，用于对APK文件进行对齐操作。
对齐操作可以提高应用在Android设备上的性能和效率。



```











> 这行命令  zipalign  -f -v 4 1.apk 2.apk  的作用是   ?加和不加-p的区别是什么？请用中文回答



```

这行命令  zipalign -f -v 4 1.apk 2.apk  的作用是

将名为  1.apk  的APK文件按照4字节边界对齐，并生成一个名为  2.apk  的新APK文件。 
 
加上  -p  参数的区别是

-p  参数会保留输入文件的原始时间戳，即生成的新APK文件的时间戳与输入文件保持一致。
如果不加  -p  参数，则生成的新APK文件的时间戳会被更新为当前时间。 
 
总结起来， zipalign  命令用于对APK文件进行对齐操作，确保文件按照指定的边界对齐。
通过加上  -p  参数，可以保留输入文件的时间戳，而不加  -p  参数会更新时间戳为当前时间。

```







> 请用中文翻译，并告诉我每个参数的作用

Zip alignment utility
Copyright (C) 2009 The Android Open Source Project

Usage: zipalign [-f] [-p] [-v] [-z] <align> infile.zip outfile.zip
       zipalign -c [-p] [-v] <align> infile.zip

  <align>: alignment in bytes, e.g. '4' provides 32-bit alignment
  -c: check alignment only (does not modify file)
  -f: overwrite existing outfile.zip
  -p: page-align uncompressed .so files
  -v: verbose output
  -z: recompress using Zopfli



```

Zip对齐工具 
版权所有 (C) 2009 Android开源项目 
用法: zipalign [-f] [-p] [-v] [-z] <align> infile.zip outfile.zip 
       zipalign -c [-p] [-v] <align> infile.zip 
  <align>: 对齐值（以字节为单位），例如 '4' 表示32位对齐 
  -c: 仅检查对齐情况（不修改文件） 
  -f: 覆盖已存在的outfile.zip 
  -p: 对未压缩的.so文件进行页面对齐 
  -v: 显示详细输出 
  -z: 使用Zopfli重新压缩 
 
每个参数的作用如下： 
- <align>: 对齐值，指定以字节为单位的对齐边界。例如，'4' 表示32位对齐。 
- -c: 仅检查对齐情况，不修改文件。用于检查文件是否已按照指定对齐边界对齐。 
- -f: 覆盖已存在的outfile.zip文件。如果输出文件已存在，将强制覆盖。 
- -p: 对未压缩的.so文件进行页面对齐。用于对未压缩的共享库文件进行页面对齐操作。 
- -v: 显示详细输出。显示更多的操作日志信息。 
- -z: 使用Zopfli算法重新压缩文件。Zopfli是一种高效的压缩算法，用于提高压缩文件的效率。 
 
这些参数可以根据需要进行组合使用，以进行不同的操作和配置。

```









我使用jenkins打出的包resources.arsc是未压缩的，但经过你们的加固工具后resources.arsc变成压缩的了， 加固后的apk我之前就做过4字节对齐操作， 现在我们的app 需要适配android 11 ，我做完适配后用你们的加固工具打出的apk,往手机上安装时报：

Failure [-124: Failed parse during installPackageLI: Targeting R+ (version 30 and above) requires the resources. installed APKs to be stored uncompressed and aligned on a 4-byte boundary]

加固后的apk我已经用工具验证了确实是经过4字节对齐的，同时我也发现使用你们的加固工具加固后apk中 resources.arsc文件就已经变成压缩的了，

所以想问一下你们，加固工具加什么参数可以指定不压缩 resources.arsc 文件？







./gradlew :jiuxian:installDebug



```
2023-11-10--17-14-30_付玉光___fix_已安装APK的resources.arsc未压缩存储并在4字节边界上对齐
feature/feature_fyg_9.1.18_已安装APK的resources.arsc未压缩存储并在4字节边界上对齐
```




### 酒仙官网app android9.1.18版本【已安装APK的resources.arsc未压缩存储并在4字节边界上对齐】功能提测


| 提测需求/bug  |   描述          |  开发           |  产品                |      测试           |       完成      |  编号            |  变更影响范围     |   自测    |  提测分支       |  提测时间         |
| ------------ |      ----      |       ----     |      ----            |      ----          |      ----      |  ----            |   ------------  |   ----   |  ------       |  --------        |
|  已安装APK的resources.arsc未压缩存储并在4字节边界上对齐   |                |  付玉光       |   周立新    |      赵亚彬     |       ok       | 2023-11-10/17-14-47  |                 |    ok    | feature/feature_preRelease_9.1.18 |  2023-11-13/11:26:58 |





