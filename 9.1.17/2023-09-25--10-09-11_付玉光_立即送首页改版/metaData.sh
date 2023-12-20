#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
projectName=酒仙官网app
productManager=孔宁宁
branchMapTable=/酒仙官网app/branchCreateTimeMapTable.txt
productManagerGroup=/酒仙官网app/ProductManagerGroup.txt
developerGroup=/酒仙官网app/DeveloperGroup.txt
workDir=/酒仙官网app/9.1.17/2023-09-25--10-09-11_付玉光_立即送首页改版
developer=付玉光
projectMetaData=metaData.txt
taskName=立即送首页改版
branchVersion=9.1.17
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-09-25
mateDataCreateTaskHourMinuteSecond=10-09-11
branchName=feature/feature_fyg_9.1.17_立即送首页改版
preReleaseBranchName=feature/feature_preRelease_9.1.17
renamedFeatureBranchName=
createTaskTime=2023-09-25/10-09-11
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
changedFileList=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-09-25--10-09-11_付玉光_立即送首页改版/changedFileList.txt
main=develop
gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=true
generateFileChangedListScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-09-25--10-09-11_付玉光_立即送首页改版/listChangedFile.sh
generateRenameBranchScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-09-25--10-09-11_付玉光_立即送首页改版/renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-09-25--10-09-11_付玉光_立即送首页改版/deleteFeatureBranch.sh
finishTaskTimeStamp=1696835444

metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}
subTaskCount=1
taskRowspan=2
