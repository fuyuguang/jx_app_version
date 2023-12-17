#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
projectName=酒仙官网app
productManager=付玉光
branchMapTable=/酒仙官网app/branchCreateTimeMapTable.txt
productManagerGroup=/酒仙官网app/ProductManagerGroup.txt
developerGroup=/酒仙官网app/DeveloperGroup.txt
workDir=/酒仙官网app/9.1.17/2023-10-10--18-51-25_付玉光_学习BackgroundLibrary库
developer=付玉光
taskName=学习BackgroundLibrary库
branchVersion=9.1.17
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-10-10
mateDataCreateTaskHourMinuteSecond=18-51-25
branchName=feature/feature_fyg_9.1.17_学习BackgroundLibrary库
preReleaseBranchName=feature/feature_preRelease_9.1.17
renamedFeatureBranchName=
createTaskTime=2023-10-10/18-51-25
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
changedFileList=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-10--18-51-25_付玉光_学习BackgroundLibrary库/changedFileList.txt
main=develop
gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=false
generateFileChangedListScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-10--18-51-25_付玉光_学习BackgroundLibrary库/listChangedFile.sh
generateRenameBranchScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-10--18-51-25_付玉光_学习BackgroundLibrary库/renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-10--18-51-25_付玉光_学习BackgroundLibrary库/deleteFeatureBranch.sh
projectMetaData=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/metaData.txt
taskDescriptionFile=学习BackgroundLibrary库.md
metaDataPath=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-10--18-51-25_付玉光_学习BackgroundLibrary库/metaData.txt

metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}
