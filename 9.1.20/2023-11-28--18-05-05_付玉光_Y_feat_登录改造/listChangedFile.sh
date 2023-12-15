#!/bin/bash
source "${shell_script_loc}/gitListChangedFilesLastNDays.sh"
source "${shell_script_loc}/workFlowUtil.sh"


  metaDataFile=metaData.sh
  metaDataFile=$(readlink -f "${metaDataFile}")
  gitListChangedFilesLastNDays "${metaDataFile}"

