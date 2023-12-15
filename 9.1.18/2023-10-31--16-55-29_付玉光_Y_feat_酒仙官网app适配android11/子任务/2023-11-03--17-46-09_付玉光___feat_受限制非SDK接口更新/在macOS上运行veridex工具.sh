

#[如需在 macOS 上运行 veridex 工具，请按以下步骤操作：](https://developer.android.google.cn/distribute/best-practices/develop/restrictions-non-sdk-interfaces?hl=zh-cn#feature-request)

exeFileLoc="./runtime-refs_heads_main-appcompat/veridex-mac/appcompat.sh"
yourAppDir="${android_studio_root}/jiuxian/build/outputs/apk/debug"
yourAppName="jiuxian_9.1.18_jiuxianwebsite.apk"

./${exeFileLoc} --dex-file="${yourAppDir}/${yourAppName}" > report.txt

