#!/bin/sh
cd `dirname $0`
echo "当前所处的目录：`pwd`"
taskName=首次打开app进行功能操作前不得提前弹框申请权限
taskFile="${taskName}_task.md"
questionFile="${taskName}_question.md"
scriptFile="${taskName}_script.sh"

#markdown 文件 android studio 支持不好，用typora 打开复制图片，可直接生成 asstes目录 

<<'COMMENT'
  []()
  注释


...
COMMENT

open -a /Applications/Typora.app ${taskFile}
