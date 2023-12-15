#!/bin/bash

#!/bin/bash

currentDir=`pwd`

targetOutFile1="${currentDir}/$(basename `git rev-parse --show-toplevel`)_$(date +%Y-%m-%d)_.txt"
targetOutFile2="${currentDir}/$(basename `git rev-parse --show-toplevel`)_$(date +%Y-%m-%d)_.txt"
# > "${targetOutFile1}"
# > "${targetOutFile2}"


apkLocation="./../apk/jiuxian_9.1.18_jiuxianwebsite_studio_aR打包.apk"
unalignedApk=${apkLocation}
targetApk="$(basename ${unalignedApk} .apk)_alignedApk.apk"
zipalign -p -f -v 4 "${unalignedApk}" ${targetApk}

