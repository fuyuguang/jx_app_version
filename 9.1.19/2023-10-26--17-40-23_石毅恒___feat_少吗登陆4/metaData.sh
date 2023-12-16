#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
projectName=酒仙官网app
taskTypeNameAbbreviation=feat
workDir=/酒仙官网app/9.1.19/2023-10-26--17-40-23_石毅恒___feat_少吗登陆4
taskTypeIndex=
createBranchFlag=_
productManager=周立新
tester=
developerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/DeveloperGroup.txt
testerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/TesterGroup.txt
productManagerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/ProductManagerGroup.txt
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-10-26
mateDataCreateTaskHourMinuteSecond=17-40-23
renamedFeatureBranchName=
createTaskTime=2023-10-26/17-40-24
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
metaDataPath=metaData.txt
branchVersion=9.1.19
taskHierarchyNameAbbreviation=level_1
developer=石毅恒
taskName=少吗登陆4
taskDescriptionFile=少吗登陆4.md
branchName=feature/feature_syh_9.1.19_少吗登陆4
preReleaseBranchName=feature/feature_preRelease_9.1.19
finishTaskTimeStamp=1698369208
subTaskCount=0
taskRowspan=2




metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}
