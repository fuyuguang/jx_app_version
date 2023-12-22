#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
projectTemDir=/酒仙官网app/tem
taskHierarchyGroup=/酒仙官网app/TaskHierarchyGroup.txt
temTaskListFilePath=/酒仙官网app/tem/taskList/taskList.txt
projectMetaDataVersionList=/酒仙官网app/version_list.txt
branchMapTable=/酒仙官网app/branchCreateTimeMapTable.txt
productManagerGroup=/酒仙官网app/ProductManagerGroup.txt
testerGroup=/酒仙官网app/TesterGroup.txt
developerGroup=/酒仙官网app/DeveloperGroup.txt
workDir=/酒仙官网app/9.1.19/2023-12-05--17-38-54_付玉光___feat_统计方法运行时间项目回顾
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
taskTypeIndex=
createBranchFlag=_
productManager=周立新
developer=付玉光
tester=
taskName=统计方法运行时间项目回顾
branchVersion=9.1.19
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-12-05
mateDataCreateTaskHourMinuteSecond=17-38-54
branchName=feature/feature_fyg_9.1.19_统计方法运行时间项目回顾
preReleaseBranchName=feature/feature_preRelease_9.1.19
renamedFeatureBranchName=
createTaskTime=2023-12-05/17-38-55
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
changedFileList=changedFileList.txt
main=develop
gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=false
generateFileChangedListScriptFile=listChangedFile.sh
generateRenameBranchScriptFile=renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=deleteFeatureBranch.sh
projectMetaData=metaData.txt
taskDescriptionFile=统计方法运行时间项目回顾.md
#项目元数据目录
#临时的父级任务列表文件
#任务组层级
taskHierarchyNameAbbreviation=level_1
#项目临时数据存放目录
metaDataFileName=metaData.sh
changeScopeRelativePath=table/变更影响范围.md
taskDescribeRelativePath=table/描述.md
taskDesc=
changeScope=
metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}


