#!/bin/bash

source "${shell_script_loc}/macos_show_alert.sh"
source "${shell_script_loc}/workFlowUtil.sh"
source "${shell_script_loc}/macos_show_dialog.sh"


function replaceAbs2RelativePath() {
  propertyName=$1
  propertyValue=$2
  replaceParentPath=$3
  subTaskMetaDataFileItem=$4
  if [[ ${propertyValue} == "${replaceParentPath}"* ]]; then
      replaceParentPathLen=${#replaceParentPath}
      propertyValue=${propertyValue:${replaceParentPathLen}}
      updateMetaDataFileProperty "${subTaskMetaDataFileItem}" "${propertyName}" "${propertyValue}"
  fi


}


projectVersionWorkDir="/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.12"
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

  #taskMetaDataDirLoc=/Users/fuyuguang/Documents/付玉光Notes/1createTask/data/projectItem
  developerGroup=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "developerGroup")
  replaceAbs2RelativePath "developerGroup" "${developerGroup}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"

  testerGroup=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "testerGroup")
  replaceAbs2RelativePath "testerGroup" "${testerGroup}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"

  productManagerGroup=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "productManagerGroup")
  replaceAbs2RelativePath "productManagerGroup" "${productManagerGroup}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"


  branchMapTable=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "branchMapTable")
  replaceAbs2RelativePath "branchMapTable" "${branchMapTable}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"

  projectMetaDataVersionList=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "projectMetaDataVersionList")
  replaceAbs2RelativePath "projectMetaDataVersionList" "${projectMetaDataVersionList}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"

  temTaskListFilePath=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "temTaskListFilePath")
  replaceAbs2RelativePath "temTaskListFilePath" "${temTaskListFilePath}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"


  taskHierarchyGroup=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "taskHierarchyGroup")
  replaceAbs2RelativePath "taskHierarchyGroup" "${taskHierarchyGroup}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"

  projectTemDir=$(getMetaDataFileSingleProperty "${subTaskMetaDataFileItem}" "projectTemDir")
  replaceAbs2RelativePath "projectTemDir" "${projectTemDir}" "${taskMetaDataDirLoc}" "${subTaskMetaDataFileItem}"


  mv "${subTaskMetaDataFileItem}" "$(dirname "${subTaskMetaDataFileItem}")/metaData.sh"


done < "${listOfMetadataFilesForTestingSubTasks}"

