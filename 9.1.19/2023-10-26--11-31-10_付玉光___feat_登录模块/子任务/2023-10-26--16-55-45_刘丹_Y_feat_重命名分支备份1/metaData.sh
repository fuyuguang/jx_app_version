#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
workDir=/酒仙官网app/9.1.19/2023-10-26--11-31-10_付玉光___feat_登录模块/子任务/2023-10-26--16-55-45_刘丹_Y_feat_重命名分支备份1
taskTypeIndex=
createBranchFlag=Y
productManager=周立新
tester=
developerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/DeveloperGroup.txt
testerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/TesterGroup.txt
productManagerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/ProductManagerGroup.txt
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-10-26
mateDataCreateTaskHourMinuteSecond=16-55-45
renamedFeatureBranchName=
createTaskTime=2023-10-26/16-55-50
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
branchMapTable=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/branchCreateTimeMapTable.txt
changedFileList=changedFileList.txt
main=develop
gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=true
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
metaDataPath=metaData.txt
finishTaskTimeStamp=1698312466
subTaskCount=0
taskRowspan=2
branchVersion=9.1.19
taskHierarchyNameAbbreviation=level_2
developer=刘丹
taskName=重命名分支备份1
taskDescriptionFile=重命名分支备份1.md
branchName=feature/feature_ld_9.1.19_重命名分支备份1
preReleaseBranchName=feature/feature_preRelease_9.1.19
finishTaskTime=2023-10-27/15-06-54


metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}