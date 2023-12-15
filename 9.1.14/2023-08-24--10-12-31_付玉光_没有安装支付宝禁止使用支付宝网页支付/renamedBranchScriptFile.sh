#!/bin/sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh
source "/Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/workFlowUtil.sh"

  metaDataFile=metaData.txt

  oldWorkDir=$(grep -w "workDir" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  projectName=$(grep -w "projectName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  productManager=$(grep -w "productManager" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  developerGroup=$(grep -w "developerGroup" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  productManagerGroup=$(grep -w "productManagerGroup" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #  父工作目录
  workDirParent=$(grep -w "workDirParent" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  mateDataCreateDate=$(grep -w "mateDataCreateDate" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  mateDataCreateTaskHourMinuteSecond=$(grep -w "mateDataCreateTaskHourMinuteSecond" "${metaDataFile}" | awk -F "=" '{ print $2 }')

  nl "$developerGroup"
  #  生成了developer和 developerNameAbbreviation  变量
  buildDeveloperName $developerGroup


  echo "请填写任务的名称"
  read -p "任务名称 ❓ : " taskName
  echo "taskName=${taskName}。"
  if [ "$taskName" = "" ]; then
      echo "😭 任务名称 不允许为空，请重新运行"
      exit 1
  fi


  read -p "分支名 ❓ : " branchVersion
  echo "branchVersion=${branchVersion}。"
  if [ "$branchVersion" = "" ]; then
      echo " 😭 分支名 不允许为空，请重新运行"
      exit 1
  fi

  workDir="${workDirParent}/${projectName}/${branchVersion}/${mateDataCreateDate}--${mateDataCreateTaskHourMinuteSecond}_${developer}_${taskName}"
  mkdir -p -- "${workDir}"
  echo "workDir=${workDir}"


  preReleaseBranchName=$(grep -w "preReleaseBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  createTaskTime=$(grep -w "createTaskTime" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  emailFileName=$(grep -w "emailFileName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  createTestEmailScriptName=$(grep -w "createTestEmailScriptName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchMapTable=$(grep -w "branchMapTable" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  main=$(grep -w "main" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  android_studio_root=$(grep -w "android_studio_root" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  showPatchDetails=$(grep -w "showPatchDetails" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  isCreateBranch=$(grep -w "isCreateBranch" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  changedFileList="${workDir}/changedFileList.txt"
  generateFileChangedListScriptFile="${workDir}/listChangedFile.sh"
  generateRenameBranchScriptFile="${workDir}/renamedBranchScriptFile.sh"
  generateDeleteFeatureBranchScriptFile="${workDir}/deleteFeatureBranch.sh"




  branchName=$(grep -w "branchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
#  renamedFeatureBranchName=$(grep -w "renamedFeatureBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  renamedFeatureBranchName="feature/feature_${developerNameAbbreviation}_${branchVersion}_${taskName}"

  if [ -z "${renamedFeatureBranchName}" ];then
    macos_show_dialog "请填充metaDataFile.txt文件中renamedFeatureBranchName项"
    echo "$?"
    exit 0
  fi

  echo " ✍️ 你输入的分支名是：${renamedFeatureBranchName} 确定要执行重命名操作吗 no/yes ❓"

  read -p " 确定要执行重命名命令吗 ❓： "  toExecuteCommand
  if [ "${toExecuteCommand}" != "yes" ];then
    exit 0
  fi

  cd ${android_studio_root}


  #[Git大小写不敏感引发的血案](https://juejin.cn/post/6979105615541075999)
  #[git分支名字大小写的问题？](https://segmentfault.com/q/1010000009620846)
  #[Shell中字符串比较忽略大小写的问题](https://www.coonote.com/shell-note/shell-ignores-case.html)
  #-q静默的方式，即不会产生输出，成功则0返回0，刚好走if的条件分支，非常巧妙！
  #-i 匹配字符串，但忽略大小写 -w 按照单词进行精确匹配
  if echo "${branchName}" | grep -qwi "${renamedFeatureBranchName}"
  then
      echo "❌ git 重命名分支名是不区分大小写的，请重命名为名字😃
        例如 timeDialog 不能重命名为 TimeDialog，报fatal: A branch named 'feature/feature_ld_1.1.1_TimeDialog' already exists.
        删除本地分支时也不区分大小写，但删除远端分支时区分大小写 如：error: unable to delete 'feature/feature_ld_1.1.1_diglOG': remote ref does not exist ❗️"
      exit 0
  else
      echo "分支非大小写重命名，检测通过✅"
  fi


  rsync -av --delete "${oldWorkDir}/" "${workDir}/"


  metaDataPath="${workDir}/metaData.txt"
  echo "projectName=${projectName}
  productManager=${productManager}
  developer=${developer}
  taskName=${taskName}
  branchVersion=${branchVersion}
  developerGroup=${developerGroup}
  productManagerGroup=${productManagerGroup}
  workDirParent=${workDirParent}
  mateDataCreateDate=${mateDataCreateDate}
  mateDataCreateTaskHourMinuteSecond=${mateDataCreateTaskHourMinuteSecond}
  workDir=${workDir}
  branchName=${renamedFeatureBranchName}
  preReleaseBranchName=${preReleaseBranchName}
  renamedFeatureBranchName=""
  createTaskTime="${mateDataCreateDate}/10-12-31"
  emailFileName=${emailFileName}
  createTestEmailScriptName=${createTestEmailScriptName}
  branchMapTable=${branchMapTable}
  changedFileList=${changedFileList}
  main=${main}
  android_studio_root=${android_studio_root}
  showPatchDetails=${showPatchDetails}
  isCreateBranch=${isCreateBranch}
  generateFileChangedListScriptFile=${generateFileChangedListScriptFile}
  generateRenameBranchScriptFile=${generateRenameBranchScriptFile}
  generateDeleteFeatureBranchScriptFile=${generateDeleteFeatureBranchScriptFile}" > "${metaDataPath}"


  #a1.先重命名本地分支
  git branch -m ${branchName} ${renamedFeatureBranchName}


  #a2.删除远程分支
  git push -d origin ${branchName}


  #a3.上传新修改名称的本地分支
  git push origin ${renamedFeatureBranchName}


  #a4.修改后的本地分支关联远程分支
  git push --set-upstream origin ${renamedFeatureBranchName}




#  #  把之前手动加的renamedFeatureBranchName给重置了
#  sed -i '' "s#${renamedFeatureBranchName}#""#" "${metaDataFile}"
#  #  把branchName 赋值新分支名 
#  sed -i '' "s#${branchName}#${renamedFeatureBranchName}#" "${metaDataFile}"

