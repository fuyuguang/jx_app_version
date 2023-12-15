#!/bin/bash
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/gitListChangedFilesLastNDays.sh


  metaDataFile=metaData.txt
  metaDataFile=$(readlink -f "${metaDataFile}")
gitListChangedFilesLastNDays "${metaDataFile}"

