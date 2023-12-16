#!/bin/bash
source ${shell_script_loc}/workFlowUtil.sh
projectName=酒仙官网app
productManager=周立新
workDir=/酒仙官网app/9.1.19/2023-10-26--11-31-10_付玉光___feat_登录模块
developer=付玉光
taskName=登录模块
branchVersion=9.1.19
developerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/DeveloperGroup.txt
productManagerGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/ProductManagerGroup.txt
workDirParent=/Users/fuyuguang/jiuxian_studio/doc/1版本
mateDataCreateDate=2023-10-26
mateDataCreateTaskHourMinuteSecond=11-31-10
branchName=feature/feature_fyg_9.1.19_登录模块
preReleaseBranchName=feature/feature_preRelease_9.1.19
renamedFeatureBranchName=
createTaskTime=2023-10-26/11-31-10
emailFileName=test_email.md
createTestEmailScriptName=appendTestEmail.sh
branchMapTable=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/branchCreateTimeMapTable.txt
changedFileList=changedFileList.txt
main=develop
gitProjectRootPath=/Users/fuyuguang/jiuxian_studio
showPatchDetails=false
isCreateBranch=false
createBranchFlag=_
taskTypeNameAbbreviation=feat
generateFileChangedListScriptFile=listChangedFile.sh
generateRenameBranchScriptFile=renamedBranchScriptFile.sh
generateDeleteFeatureBranchScriptFile=deleteFeatureBranch.sh
#测试人员
tester=
#任务提测时间
#项目元数据列出版本目录文件存放路径
projectMetaDataVersionList=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/version_list.txt
#markdown文件名
taskDescriptionFile=登录模块.md
#任务层级文件
taskHierarchyGroup=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/TaskHierarchyGroup.txt
#任务层级，标识是子任务还是父任务
taskHierarchyNameAbbreviation=level_1
#临时的父级任务列表文件
temTaskListFilePath=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/tem/taskList/taskList.txt
#项目临时数据存放目录
projectTemDir=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem/酒仙官网app/tem


subTaskCount=3
taskRowspan=4



metaDataPath=$(getFullDirectoryPath ${workDir} ${taskWorkDirParentLoc})/${metaDataFileName}
metaDataActionConsole ${metaDataPath}
