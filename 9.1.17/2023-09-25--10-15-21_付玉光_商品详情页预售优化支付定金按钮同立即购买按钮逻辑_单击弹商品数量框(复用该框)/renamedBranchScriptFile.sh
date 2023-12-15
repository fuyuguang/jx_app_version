#!/bin/bash

source "/Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh"
source "/Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/workFlowUtil.sh"

#  currentDir=/Users/fuyuguang/jiuxian_studio
#  echo "当前目录为： ${currentDir}"
#  cd "${currentDir}"

  metaDataFile=metaData.txt
  metaDataFile=$(readlink -f "${metaDataFile}")

  oldWorkDir=$(grep -w "workDir" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  projectName=$(grep -w "projectName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  productManager=$(grep -w "productManager" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  developerGroup=$(grep -w "developerGroup" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  productManagerGroup=$(grep -w "productManagerGroup" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #  父工作目录
  workDirParent=$(grep -w "workDirParent" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  mateDataCreateDate=$(grep -w "mateDataCreateDate" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  mateDataCreateTaskHourMinuteSecond=$(grep -w "mateDataCreateTaskHourMinuteSecond" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  gitProjectRootPath=$(grep -w "gitProjectRootPath" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchName=$(grep -w "branchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')

  #进入到 git 管理的目录后才能判断某分支是否存在，此处不能使用 git rev-parse 来获取 git的根路径，因为当前路径不一定在 受git管理的目录下
  cd ${gitProjectRootPath}


#  if git rev-parse --verify "${branchName}" >/dev/null 2>&1; then
#     echo "分支 "${branchName}" 存在"
#  else
#      echo "本地分支 "${branchName}" 不存在,无法重命名"
#      macos_show_dialog "❌  本地分支 "${branchName}" 不存在,无法重命名"
#      exit 10
#  fi

  #为了方便后期整理笔记，当本地分支不存在时，也允许用户，重置目录位置和变量分支信息等
  hasLocalBranch=true
  if git rev-parse --verify "${branchName}" >/dev/null 2>&1; then
     echo "分支 "${branchName}" 存在"
  else
      echo "本地分支 "${branchName}" 不存在,无法重命名"
      execResult=$(macos_show_dialog "❌  本地分支 "${branchName}" 不存在,无法重命名")
        if [ "${execResult}" = "button returned:好" ]; then
            echo "${resultString}"
            execResult=$(macos_show_dialog " 你是要 整理目录结构吗  🚀 ❓ ")
            if [ "${execResult}" = "button returned:好" ]; then
               echo "开始移动目录"
               hasLocalBranch=false
            else
                exit 10
            fi
        else
            exit 10
        fi
  fi



  nl "$developerGroup"
  #  生成了developer和developerNameAbbreviation 变量
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


  preReleaseBranchName=$(grep -w "preReleaseBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  createTaskTime=$(grep -w "createTaskTime" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  emailFileName=$(grep -w "emailFileName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  createTestEmailScriptName=$(grep -w "createTestEmailScriptName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchMapTable=$(grep -w "branchMapTable" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  main=$(grep -w "main" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  showPatchDetails=$(grep -w "showPatchDetails" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  isCreateBranch=$(grep -w "isCreateBranch" "${metaDataFile}" | awk -F "=" '{ print $2 }')


  workDir="${workDirParent}/${projectName}/${branchVersion}/${mateDataCreateDate}--${mateDataCreateTaskHourMinuteSecond}_${developer}_${taskName}"


  changedFileList="${workDir}/changedFileList.txt"
  generateFileChangedListScriptFile="${workDir}/listChangedFile.sh"
  generateRenameBranchScriptFile="${workDir}/renamedBranchScriptFile.sh"
  generateDeleteFeatureBranchScriptFile="${workDir}/deleteFeatureBranch.sh"



  #重新组装新的分支名
  renamedFeatureBranchName="feature/feature_${developerNameAbbreviation}_${branchVersion}_${taskName}"

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



#  read -p " 你输入的分支名是：${renamedFeatureBranchName}   确定要执行重命名操作吗 no/yes ❓： "  toExecuteCommand
#  if [ "${toExecuteCommand}" != "yes" ];then
#    exit 0
#  fi


  #hasLocalBranch 默认为true,当为false时，也支持用户重命名分支信息
  if [ ${hasLocalBranch} = "true" ]; then
    #a1.先重命名本地分支
    git branch -m ${branchName} ${renamedFeatureBranchName}
    if((0 != $?))
      then
        macos_show_dialog "❌ 新分支名  ${renamedFeatureBranchName} 不合法"
        exit
    fi

    #a2.删除远程分支
    git push -d origin ${branchName}


    #a3.上传新修改名称的本地分支
    git push origin ${renamedFeatureBranchName}


    #a4.修改后的本地分支关联远程分支
    git push --set-upstream origin ${renamedFeatureBranchName}
  fi

  mkdir -p -- "${workDir}"
  echo "workDir=${workDir}"

  rsync -av --delete "${oldWorkDir}/" "${workDir}/"
  result=$?
  if [ "${result}" -eq 0 ]; then
      echo "rsync 同步成功 结果为：${result}"
    else
      echo "rsync 同步失败 结果为：${result}"
      macos_show_dialog "❌ rsync 同步失败 结果为：${result}"
      exit
  fi

  rm -rf "${oldWorkDir}"


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
createTaskTime="${mateDataCreateDate}/10-15-21"
emailFileName=${emailFileName}
createTestEmailScriptName=${createTestEmailScriptName}
branchMapTable=${branchMapTable}
changedFileList=${changedFileList}
main=${main}
gitProjectRootPath=${gitProjectRootPath}
showPatchDetails=${showPatchDetails}
isCreateBranch=${isCreateBranch}
generateFileChangedListScriptFile=${generateFileChangedListScriptFile}
generateRenameBranchScriptFile=${generateRenameBranchScriptFile}
generateDeleteFeatureBranchScriptFile=${generateDeleteFeatureBranchScriptFile}" > "${metaDataPath}"

cd "${workDir}"

#  #  把之前手动加的renamedFeatureBranchName给重置了
#  sed -i '' "s#${renamedFeatureBranchName}#""#" "${metaDataFile}"
#  #  把branchName 赋值新分支名 
#  sed -i '' "s#${branchName}#${renamedFeatureBranchName}#" "${metaDataFile}"

