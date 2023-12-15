#!/bin/bash
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/gitListChangedFilesLastNDays.sh


#gitListChangedFilesLastNDays "./metaData.txt"


fileName="branch.txt"
currentDir=`pwd`
cd ${android_studio_root}
targetOutFile="${currentDir}/$(basename `git rev-parse --show-toplevel`)_$(date +%Y-%m-%d)_${fileName}"
targetOutFile1="${currentDir}/$(basename `git rev-parse --show-toplevel`)_$(date +%Y-%m-%d)_branch-a.txt"
# > "${targetOutFile}"


git branch > ${targetOutFile}
git branch -r > ${targetOutFile1}

