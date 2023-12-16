#!/bin/bash

source "${shell_script_loc}/macos_show_alert.sh"
source "${shell_script_loc}/workFlowUtil.sh"
source "${shell_script_loc}/macos_show_dialog.sh"


projectVersionWorkDir="/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.20"
metaDataFileName="metaData.sh"
listOfMetadataFilesForTestingSubTasks=./"temp.txt"
find "${projectVersionWorkDir}" -type f -name "${metaDataFileName}" > "${listOfMetadataFilesForTestingSubTasks}"

while IFS= read -r subTaskMetaDataFileItem; do
  workDir=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "workDir")
  if [[ ${workDir} == "${taskWorkDirParentLoc}"* ]]; then
      taskWorkDirParentLocLen=${#taskWorkDirParentLoc}
      workDir=${workDir:${taskWorkDirParentLocLen}}
      #export taskWorkDirParentLoc=/Users/fuyuguang/jiuxian_studio/doc/1版本
      updateMetaDataFileProperty "${subTaskMetaDataFileItem}" "workDir" "${workDir}"
  fi
done < "${listOfMetadataFilesForTestingSubTasks}"
