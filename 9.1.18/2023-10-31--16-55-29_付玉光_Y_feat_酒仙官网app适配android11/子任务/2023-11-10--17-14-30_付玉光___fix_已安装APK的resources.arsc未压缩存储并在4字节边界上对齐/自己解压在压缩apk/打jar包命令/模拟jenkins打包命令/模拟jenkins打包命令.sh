#!/bin/bash

pwd



#java -jar ./buildConfig/testt.jar ./build/apk/ jiuxianwebsite ./buildConfig/app.properties app.channels1 ./jiuxian/release.keystore
#java -jar ./ChannelUtils.jar ./build/apk/ jiuxianwebsite ./app.properties app.channels1 ./release.keystore
#java -jar ./testt.jar ./build/apk/ jiuxianwebsite ./app.properties app.channels1 ./release.keystore


#java -jar ./testt.jar ./build/apk/ jiuxianwebsite ./app.properties app.channels1 ./release.keystore "/Users/fuyuguang/jiuxian_studio/shell/" "/Users/fuyuguang/Downloads/android-sdk-macosx/build-tools/30.0.2/zipalign  -f -v 4" "/Users/fuyuguang/Downloads/android-sdk-macosx/build-tools/30.0.2/apksigner"
java -jar ./testt.jar ./build/apk/ jiuxianwebsite ./app.properties app.channels1 ./release.keystore "./shell/" "/usr/local/android-sdk-linux/build-tools/30.0.2/zipalign  -f -v 4" "/usr/local/android-sdk-linux/build-tools/30.0.2/apksigner"


#/usr/local/android-sdk-linux/build-tools/30.0.2/zipalign  -f -v 4 ./build/apk/jiuxian_${appVersion}/channels/jiuxian_${appVersion}_${channel}_jiagu.apk ./build/apk/jiuxian_${appVersion}/channels/jiuxian_${appVersion}_${channel}_zipAlign.apk
#/usr/local/android-sdk-linux/build-tools/30.0.2/apksigner sign --ks ./jiuxian/release.keystore --min-sdk-version=17 --v1-signing-enabled true --v2-signing-enabled true --ks-key-alias jiuxian_alias --ks-pass pass:415263 --key-pass pass:415263 --out ./build/apk/jiuxian_${appVersion}/channels/jiuxian_${appVersion}_${channel}.apk --in ./build/apk/jiuxian_${appVersion}/channels/jiuxian_${appVersion}_${channel}_zipAlign.apk


#            JIAGU_DIR = args[5];
#            ZIPALIGN_PATH = args[6];
#            APKSIGNER_PATH = args[7];