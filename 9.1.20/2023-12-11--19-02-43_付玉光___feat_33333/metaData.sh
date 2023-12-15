#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
finishTaskTimeStamp=1702347776
preReleaseBranchName=feature/feature_preRelease_9.1.20
branchName=feature/feature_fyg_9.1.20_33333
workDir=/酒仙官网app/9.1.20/2023-12-11--19-02-43_付玉光___feat_33333
taskDescriptionFile=33333.md
taskName=33333
developer=付玉光
taskHierarchyNameAbbreviation=level_1
branchVersion=9.1.20
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
taskTypeIndex=
createBranchFlag=_
productManager=周立新
tester=
developerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/DeveloperGroup.txt
testerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/TesterGroup.txt
productManagerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/ProductManagerGroup.txt
#workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-12-11
mateDataCreateTaskHourMinuteSecond=19-02-43
renamedFeatureBranchName=
createTaskTime=2023-12-11/19-02-44
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
branchMapTable=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/branchCreateTimeMapTable.txt
changedFileList=changedFileList.txt
main=develop
gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=false
generateFileChangedListScriptFile=listChangedFile.sh
generateRenameBranchScriptFile=renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=deleteFeatureBranch.sh
projectMetaData=metaData.txt
#项目元数据目录
projectMetaDataVersionList=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/version_list.txt
#临时的父级任务列表文件
temTaskListFilePath=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/tem/taskList/taskList.txt
#任务组层级
taskHierarchyGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/TaskHierarchyGroup.txt
#项目临时数据存放目录
projectTemDir=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/tem
metaDataFileName=metaData.sh
changeScopeRelativePath=table/变更影响范围.md
taskDescribeRelativePath=table/描述.md
taskDesc=
changeScope=
metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
echo "metaDataPath=${metaDataPath}"
metaDataActionConsole ${metaDataPath}

subTaskCount=2
taskRowspan=3
