#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
finishTaskTimeStamp=1702887579
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
taskTypeIndex=
createBranchFlag=_
productManager=周立新
developer=付玉光
tester=
taskName=月
branchVersion=9.1.21
mateDataCreateDate=2023-12-18
mateDataCreateTaskHourMinuteSecond=14-26-42
workDir=/酒仙官网app/9.1.21/2023-12-18--14-26-42_付玉光___feat_月
branchName=feature/feature_fyg_9.1.21_月
preReleaseBranchName=feature/feature_preRelease_9.1.21
renamedFeatureBranchName=
createTaskTime=2023-12-18/14-26-43
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
changedFileList=changedFileList.txt
main=develop
showPatchDetails=false
isCreateBranch=false
generateFileChangedListScriptFile=listChangedFile.sh
generateRenameBranchScriptFile=renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=deleteFeatureBranch.sh
projectMetaData=metaData.txt
taskDescriptionFile=月.md
#开发人员名单
developerGroup=/酒仙官网app/DeveloperGroup.txt
#测试人员名单
testerGroup=/酒仙官网app/TesterGroup.txt
#产品人员名单
productManagerGroup=/酒仙官网app/ProductManagerGroup.txt
#创建分支映射表
branchMapTable=/酒仙官网app/branchCreateTimeMapTable.txt
#项目元数据目录 version_list.txt 文件
projectMetaDataVersionList=/酒仙官网app/version_list.txt
#临时的父级任务列表文件
temTaskListFilePath=/酒仙官网app/tem/taskList/taskList.txt
#任务组层级
taskHierarchyGroup=/酒仙官网app/TaskHierarchyGroup.txt
taskHierarchyNameAbbreviation=level_1
#项目临时数据存放目录
projectTemDir=/酒仙官网app/tem
#项目元数据中 metaData 文件名称，该文件后缀决定生成的任务下metaData文件后缀
metaDataFileName=metaData.sh
changeScopeRelativePath=table/变更影响范围.md
taskDescribeRelativePath=table/描述.md
taskDesc=
changeScope=
metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}

