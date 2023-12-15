#!/bin/bash
source "/Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh"
source "/Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/workFlowUtil.sh"
source "/Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_alert.sh"

#  currentDir=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem
#  echo "当前目录为： ${currentDir}"
#  cd "${currentDir}"

  metaDataFile=metaData.txt
  metaDataFile=$(readlink -f "${metaDataFile}")

  oldWorkDir=$(grep -w "workDir" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  projectName=$(grep -w "projectName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  productManager=$(grep -w "productManager" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  developerGroup=$(grep -w "developerGroup" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  productManagerGroup=$(grep -w "productManagerGroup" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #  父工作目录 任务目录父目录
  workDirParent=$(grep -w "workDirParent" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  mateDataCreateDate=$(grep -w "mateDataCreateDate" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  mateDataCreateTaskHourMinuteSecond=$(grep -w "mateDataCreateTaskHourMinuteSecond" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  gitProjectRootPath=$(grep -w "gitProjectRootPath" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchName=$(grep -w "branchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #老的任务名称，+ .md = 老的md文件名称
  oldTaskName=$(grep -w "taskName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #老的md文件名称
  oldTaskDescriptionFile=$(grep -w "taskDescriptionFile" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #任务层级文件
  taskHierarchyGroup=$(grep -w "taskHierarchyGroup" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #临时的父级任务列表文件
  temTaskListFilePath=$(grep -w "temTaskListFilePath" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #指定上次的开发人员
  oldDeveloper=$(grep -w "developer" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #取出该任务的层级，如果是父任务，需判断该目录下是否有子任务，有的话，提示：暂不支持有子任务的父任务重命名
  taskHierarchyNameAbbreviation=$(grep -w "taskHierarchyNameAbbreviation" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #项目元数据列出版本目录文件存放路径
  projectMetaDataVersionList=$(grep -w "projectMetaDataVersionList" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #测试人员
  tester=$(grep -w "tester" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  #任务提测时间
  finishTaskTimeStamp=$(grep -w "finishTaskTimeStamp" "${metaDataFile}" | awk -F "=" '{ print $2 }')

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
               #echo "开始整理目录结构"
               hasLocalBranch=false
            else
                exit 10
            fi
        else
            exit 10
        fi
  fi



#  if [ -d "${oldWorkDir}/子任务" ]; then
#      echo "子任务目录存在"
#      if [ -n "$(ls -A "${oldWorkDir}/子任务")" ]; then
#              echo "子任务文件夹不为空，有子任务，不允许重命名"
#              macos_show_alert "😭 暂不支持 有子任务的父任务 重命名"
#              exit
#      else
#          echo "子任务文件夹为空"
#      fi
#  else
#      echo "子任务文件夹存在"
#  fi

#  if [[ -n "${taskHierarchyNameAbbreviation}" ]]; then
#    echo "任务层级不为空,如果有子任务就不允许重命名"
#  fi



  projectWorkDir=${workDirParent}/${projectName}
  #让用户选择版本号
  selectProjectVersion "${projectWorkDir}" "${projectMetaDataVersionList}"
  echo "projectVersion=${projectVersion}"
  if [ "${projectVersion}" = "new version" ]; then
    read -p "输入版本号 ❓ : " branchVersion
    echo "branchVersion=${branchVersion}。"
    if [ "$branchVersion" = "" ]; then
        echo " 😭 版本号 不允许为空，请重新运行"
        exit 1
    fi
  else
      echo ""
      branchVersion=${projectVersion}
  fi

  nl "${taskHierarchyGroup}"
  #生成了【任务层级名称】和【层级名称缩写变量】 taskHierarchyName 和 taskHierarchyNameAbbreviation
  buildTaskHierarchy "${taskHierarchyGroup}"


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


#  read -p "分支名 ❓ : " branchVersion
#  echo "branchVersion=${branchVersion}。"
#  if [ "$branchVersion" = "" ]; then
#      echo " 😭 分支名 不允许为空，请重新运行"
#      exit 1
#  fi


  preReleaseBranchName=$(grep -w "preReleaseBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  createTaskTime=$(grep -w "createTaskTime" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  emailFileName=$(grep -w "emailFileName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  createTestEmailScriptName=$(grep -w "createTestEmailScriptName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchMapTable=$(grep -w "branchMapTable" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  main=$(grep -w "main" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  showPatchDetails=$(grep -w "showPatchDetails" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  isCreateBranch=$(grep -w "isCreateBranch" "${metaDataFile}" | awk -F "=" '{ print $2 }')

  createBranchFlag=$(grep -w "createBranchFlag" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  taskTypeNameAbbreviation=$(grep -w "taskTypeNameAbbreviation" "${metaDataFile}" | awk -F "=" '{ print $2 }')


  taskDirName="${mateDataCreateDate}--${mateDataCreateTaskHourMinuteSecond}_${developer}_${createBranchFlag}_${taskTypeNameAbbreviation}_${taskName}"

  #指定之前的任务目录名，对应之前的开发者和任务名
  oldTaskDirName="${mateDataCreateDate}--${mateDataCreateTaskHourMinuteSecond}_${oldDeveloper}_${createBranchFlag}_${taskTypeNameAbbreviation}_${oldTaskName}"

  #workDir="${workDirParent}/${projectName}/${branchVersion}/${mateDataCreateDate}--${mateDataCreateTaskHourMinuteSecond}_${developer}_${createBranchFlag}_${taskTypeNameAbbreviation}_${taskName}"
  #workDir="${workDirParent}/${projectName}/${branchVersion}/${taskDirName}"

  #新加内容
  echo "taskHierarchyNameAbbreviation=${taskHierarchyNameAbbreviation}"
  if [ "${taskHierarchyNameAbbreviation}" = "level_1" ]; then
    echo "任务层级为1层"
    workDir="${workDirParent}/${projectName}/${branchVersion}/${taskDirName}"
    mkdir -p -- "${workDir}"
    echo "workDir=${workDir}"

  else
    echo "任务层级为2层，让用户选择父任务的目录"

    workDir="${workDirParent}/${projectName}/${branchVersion}"
    mkdir -p -- "${workDir}"
    #A为父任务，任务目录名为xx，现重命名为子任务，那么不允许A移动到当前所在的xx目录中，使用  -e "${oldTaskDirName}" 的作用是过滤掉当前所在的父任务目录
    echo "tree "${workDir}"  -L 1 -d -i --noreport | grep -v -e "${workDir}"  -e "${oldTaskDirName}""
    tree "${workDir}"  -L 1 -d -i --noreport | grep -v -e "${workDir}"  -e "${oldTaskDirName}"> "${temTaskListFilePath}"

    nl "${temTaskListFilePath}"
    #生成了 parentTaskDirName  变量
    selectParentTaskName "${temTaskListFilePath}"

    workDir="${workDir}/${parentTaskDirName}/子任务/${taskDirName}"
    mkdir -p -- "${workDir}"
    echo "workDir=${workDir}"

  fi


  changedFileList="changedFileList.txt"
  generateFileChangedListScriptFile="listChangedFile.sh"
  generateRenameBranchScriptFile="renamedBranchScriptFile.sh"
  generateDeleteFeatureBranchScriptFile="deleteFeatureBranch.sh"



  #重新组装新的分支名
  renamedFeatureBranchName="feature/feature_${developerNameAbbreviation}_${branchVersion}_${taskName}"

  #[Git大小写不敏感引发的血案](https://juejin.cn/post/6979105615541075999)
  #[git分支名字大小写的问题？](https://segmentfault.com/q/1010000009620846)
  #[Shell中字符串比较忽略大小写的问题](https://www.coonote.com/shell-note/shell-ignores-case.html)
  #-q静默的方式，即不会产生输出，成功则0返回0，刚好走if的条件分支，非常巧妙！
  #-i 匹配字符串，但忽略大小写 -w 按照单词进行精确匹配
  if echo "${branchName}" | grep -qwi "${renamedFeatureBranchName}"
  then
      echo " 用户可能只是改了一下版本号，没有改分支名称，这个时候终止程序，不合理？
        ❌ git 重命名分支名是不区分大小写的，请重命名为名字😃
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

  #重命名文件
  mv -f "${workDir}/${oldTaskDescriptionFile}" "${workDir}/${taskName}.md"

  metaDataPath="${workDir}/metaData.txt"

#重命名分支时把preReleaseBranchName分支名也一起修改
preReleaseBranchName="feature/feature_preRelease_${branchVersion}"

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
createTaskTime="${mateDataCreateDate}/${mateDataCreateTaskHourMinuteSecond}"
emailFileName=${emailFileName}
createTestEmailScriptName=${createTestEmailScriptName}
branchMapTable=${branchMapTable}
changedFileList=${changedFileList}
main=${main}
gitProjectRootPath=${gitProjectRootPath}
showPatchDetails=${showPatchDetails}
isCreateBranch=${isCreateBranch}
createBranchFlag=${createBranchFlag}
taskTypeNameAbbreviation=${taskTypeNameAbbreviation}
generateFileChangedListScriptFile=${generateFileChangedListScriptFile}
generateRenameBranchScriptFile=${generateRenameBranchScriptFile}
generateDeleteFeatureBranchScriptFile=${generateDeleteFeatureBranchScriptFile}
#测试人员
tester=${tester}
#任务提测时间
finishTaskTimeStamp=${finishTaskTimeStamp}
#项目元数据列出版本目录文件存放路径
projectMetaDataVersionList=${projectMetaDataVersionList}
#markdown文件名
taskDescriptionFile=${taskName}.md
#任务层级文件
taskHierarchyGroup=${taskHierarchyGroup}
#任务层级，标识是子任务还是父任务
taskHierarchyNameAbbreviation=${taskHierarchyNameAbbreviation}
#临时的父级任务列表文件
temTaskListFilePath=${temTaskListFilePath}
metaDataPath=metaData.txt" > "${metaDataPath}"

cd "${workDir}"

#  #  把之前手动加的renamedFeatureBranchName给重置了
#  sed -i '' "s#${renamedFeatureBranchName}#""#" "${metaDataFile}"
#  #  把branchName 赋值新分支名 
#  sed -i '' "s#${branchName}#${renamedFeatureBranchName}#" "${metaDataFile}"



if [ -d "${workDir}/子任务" ]; then
      echo "子任务目录存在"
      if [ -n "$(ls -A "${workDir}/子任务")" ]; then
              echo "子任务文件夹不为空，有子任务， 尝试重命名 子任务 medatata文件中workDir属性值"
              #重新统计父任务中子任务的metadata文件个数
              echo "重新统计父任务中子任务的metadata文件个数"
              #temTaskListFilePath 只是为了使用方便，项目中应该定义一个用于缓存数据的公共临时文件
              find "${workDir}/子任务" -maxdepth 2 -type f -name "metaData.txt"
              find "${workDir}/子任务" -maxdepth 2 -type f -name "metaData.txt" > "${temTaskListFilePath}"
              #子任务的metadata文件信息按照文件的绝对路径排序
              sort "${temTaskListFilePath}" -o "${temTaskListFilePath}"
              while read -r subTaskMetaDataFileItem; do
                  #subTaskMetaDataFileAbsFilePath=
                  subTaskMetaDataFileAbsFilePath=$(readlink -f  ${subTaskMetaDataFileItem})
                  #subTaskMetaDataFileName=$(basename ${subTaskMetaDataFileAbsFilePath})
                  subTaskWorkDirName=$(getFolderNameNameFromPath "${subTaskMetaDataFileAbsFilePath}" "1")
                  #新的工作目录=新的/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.19/2023-10-26--10-56-42_付玉光_Y_feat_首页改版/子任务/2023-10-26--10-57-43_付玉光___feat_首页banner开发/子任务 + 子任务工作目录名
                  newSubTaskWorkDirPath="${workDir}/子任务/${subTaskWorkDirName}"
                  #删除老的工作目录替换新的工作目录
                  sed -i '' '/^workDir=/d' "${subTaskMetaDataFileAbsFilePath}"
                  echo "workDir=${newSubTaskWorkDirPath}" >> "${subTaskMetaDataFileAbsFilePath}"
              done < "${temTaskListFilePath}"
      else
          echo "子任务文件夹为空"
      fi
else
    echo "子任务文件夹存在"
fi

