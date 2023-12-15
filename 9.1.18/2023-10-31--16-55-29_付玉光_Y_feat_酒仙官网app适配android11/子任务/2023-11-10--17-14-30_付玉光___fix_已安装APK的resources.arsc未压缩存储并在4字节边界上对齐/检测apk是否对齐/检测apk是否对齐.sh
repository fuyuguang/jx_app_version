#!/bin/bash





#resources.arsc

#要验证的APK文件

#apkLocation="./../apk/jiuxian_9.1.18_jiuxianwebsite.apk"
#apkLocation="./../apk/jiuxian_9.1.18_jiuxianwebsite_jiagu.apk"
apkLocation="./../apk/jiuxian_9.1.18_jiuxianwebsite.apk"

#apkLocation="./../执行apk对齐/jiuxian_9.1.18_jiuxianwebsite_studio_aR打包_alignedApk.apk"

currentDir=`pwd`
targetOutFile1="${currentDir}/$(date +%Y-%m-%d)_$(basename ${apkLocation} .apk).txt"


zipalign -c -v 4 "${apkLocation}"  > "${targetOutFile1}"