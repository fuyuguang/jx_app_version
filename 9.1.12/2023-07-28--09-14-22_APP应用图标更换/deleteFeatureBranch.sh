#!/bin/bash
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/listChangedFile.sh

  metaDataFile="/Users/fuyuguang/jiuxian_studio/doc/付玉光笔记/1todo_list/2023-07-28--09-14-22_APP应用图标更换/metaData.txt"
  preReleaseBranchName=$(grep -w "preReleaseBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchName=$(grep -n -w "branchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  deleteBranchName="${branchName}"

  sh listChangedFile.sh
  cd ${android_studio_root}
  read -p " ⚠️ 该操作会导致你 ${deleteBranchName} 分支被删除，可能导致你白忙一场，请谨慎操作 " AreYouSureDeleteBranch

  if [ ${AreYouSureDeleteBranch} != "yes" ]; then
   exit 0
  fi

  git checkout ${preReleaseBranchName}
  git branch -d ${deleteBranchName}
  git push origin --delete ${deleteBranchName}


  #删除包含 finishTaskTime= 关键字的行   sed -i "" "//d" ./data/test
  sed -i "" "/finishTaskTime=/d" "${metaDataFile}"

  #[Mac Shell脚本中使用echo的-n参数不生效](https://blog.csdn.net/zhi_cike/article/details/77853585)
  #[Makefile echo -n' 不起作用](https://stackoverflow.com/questions/11675070/makefile-echo-n-not-working)
  echo "finishTaskTime=$(date +%Y-%m-%d/%H-%M-%S)" >> "${metaDataFile}"

