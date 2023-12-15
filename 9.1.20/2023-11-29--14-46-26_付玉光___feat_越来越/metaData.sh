#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
finishTaskTimeStamp=1702345562
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
taskTypeIndex=
createBranchFlag=_
productManager=周立新
developer=付玉光
tester=
taskName=越来越
branchVersion=9.1.20
developerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/DeveloperGroup.txt
testerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/TesterGroup.txt
productManagerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/ProductManagerGroup.txt
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-11-29
mateDataCreateTaskHourMinuteSecond=14-46-26
workDir=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.20/2023-11-29--14-46-26_付玉光___feat_越来越
branchName=feature/feature_fyg_9.1.20_越来越
preReleaseBranchName=feature/feature_preRelease_9.1.20
renamedFeatureBranchName=
createTaskTime=2023-11-29/14-46-27
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
taskDescriptionFile=越来越.md
#项目元数据目录
projectMetaDataVersionList=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/version_list.txt
#临时的父级任务列表文件
temTaskListFilePath=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/tem/taskList/taskList.txt
#任务组层级
taskHierarchyGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/TaskHierarchyGroup.txt
taskHierarchyNameAbbreviation=level_1
#项目临时数据存放目录
projectTemDir=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/tem
metaDataFileName=metaData.sh
changeScopeRelativePath=table/变更影响范围.md
taskDescribeRelativePath=table/描述.md
taskDesc=
changeScope=

#空，没有带参数，就运行操作台，否则不允许
if [ -z "$1" ]; then
  metaDataPath=${workDir}/${metaDataFileName}
  metaDataActionConsole ${metaDataPath}
fi


subTaskCount=1
taskRowspan=2
