#!/bin/bash

#!/bin/bash

currentDir=`pwd`

#targetOutFile1="${currentDir}/模拟jenkins打包命令/ChannelUtils.jar"
targetOutFile1="${currentDir}/模拟jenkins打包命令/testt.jar"



cd ~
#cd "./jiuxian_studio/updateutil/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes"
cd "./jiuxian_studio/updateutil/build/intermediates/javac/debug/classes"
#/Users/fuyuguang/jiuxian_studio/updateutil/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes
pwd

#对命令 jar -cvfe MainClass1.jar com.xxx.MainClass com/ 做一个小小的解释:
#-c  打包
#-v 输出详细信息(可有可无)
#-f 指定文件名字
#-e 指定入口类
#MainClass1.jar 打包生成的文件名
#com.xxx.MainClass 就是要写入到MANIFEST.MF文件中的 Main-class: 后面的类名
#com/ 被打包的目录
jar -cvfe ChannelUtils.jar com.jiuxian.channel.ChannelUtil ./

cp ChannelUtils.jar "${targetOutFile1}"


