#!/bin/bash

#source ${shell_script_loc}/listChangedFilesLastNDays.sh
#listChangedFilesLastNDays "/Users/fuyuguang/jiuxian_studio" "feature/feature_fyg_9.1.12_首次打开app进行功能操作前不得提前弹框申请权限" "/Users/fuyuguang/Documents/付玉光Notes/1todo_list/_branchCreateTimeMapTable.txt" "/Users/fuyuguang/jiuxian_studio" "/Users/fuyuguang/jiuxian_studio/doc/付玉光笔记/1todo_list/2023-07-25--09-39-33_首次打开app进行功能操作前不得提前弹框申请权限/changedFileList.txt"


source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/gitListChangedFilesLastNDays.sh
gitListChangedFilesLastNDays "./metaData.txt"

