#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
finishTaskTimeStamp=1702347776
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
taskTypeIndex=
createBranchFlag=_
productManager=张树静
developer=石毅恒
tester=
taskName=666
branchVersion=9.1.20
mateDataCreateDate=2023-12-12
mateDataCreateTaskHourMinuteSecond=10-22-31
workDir=/酒仙官网app/9.1.20/2023-12-11--19-02-43_付玉光___feat_33333/子任务/2023-12-12--10-22-31_石毅恒___feat_666
#workDir=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.20/2023-12-11--19-02-43_付玉光___feat_33333/子任务/2023-12-12--10-22-31_石毅恒___feat_666
branchName=feature/feature_syh_9.1.20_666
preReleaseBranchName=feature/feature_preRelease_9.1.20
renamedFeatureBranchName=
createTaskTime=2023-12-12/10-22-42
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
changedFileList=changedFileList.txt
main=develop
#gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=false
generateFileChangedListScriptFile=listChangedFile.sh
generateRenameBranchScriptFile=renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=deleteFeatureBranch.sh
projectMetaData=metaData.txt
taskDescriptionFile=666.md
#开发人员名单
developerGroup=/酒仙官网app/DeveloperGroup.txt
#测试人员名单
testerGroup=/酒仙官网app/TesterGroup.txt
#产品人员名单
productManagerGroup=/酒仙官网app/ProductManagerGroup.txt
#创建分支映射表
branchMapTable=/酒仙官网app/branchCreateTimeMapTable.txt
#项目元数据目录
projectMetaDataVersionList=/酒仙官网app/version_list.txt
#临时的父级任务列表文件
temTaskListFilePath=/酒仙官网app/tem/taskList/taskList.txt
#任务组层级
taskHierarchyGroup=/酒仙官网app/TaskHierarchyGroup.txt
taskHierarchyNameAbbreviation=level_2
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

