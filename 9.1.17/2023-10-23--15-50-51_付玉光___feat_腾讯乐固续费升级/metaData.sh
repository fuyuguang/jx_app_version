#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
branchMapTable=/酒仙官网app/branchCreateTimeMapTable.txt
productManagerGroup=/酒仙官网app/ProductManagerGroup.txt
testerGroup=/酒仙官网app/TesterGroup.txt
developerGroup=/酒仙官网app/DeveloperGroup.txt
workDir=/酒仙官网app/9.1.17/2023-10-23--15-50-51_付玉光___feat_腾讯乐固续费升级
taskTypeIndex=
createBranchFlag=_
productManager=周立新
developer=付玉光
tester=
taskName=腾讯乐固续费升级
branchVersion=9.1.17
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-10-23
mateDataCreateTaskHourMinuteSecond=15-50-51
branchName=feature/feature_fyg_9.1.17_腾讯乐固续费升级
preReleaseBranchName=feature/feature_preRelease_9.1.17
renamedFeatureBranchName=
createTaskTime=2023-10-23/15-50-51
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
changedFileList=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-23--15-50-51_付玉光___feat_腾讯乐固续费升级/changedFileList.txt
main=develop
gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=false
generateFileChangedListScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-23--15-50-51_付玉光___feat_腾讯乐固续费升级/listChangedFile.sh
generateRenameBranchScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-23--15-50-51_付玉光___feat_腾讯乐固续费升级/renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-23--15-50-51_付玉光___feat_腾讯乐固续费升级/deleteFeatureBranch.sh
projectMetaData=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/metaData.txt
taskDescriptionFile=腾讯乐固续费升级.md
metaDataPath=/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.17/2023-10-23--15-50-51_付玉光___feat_腾讯乐固续费升级/metaData.txt

metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}
