#!/bin/sh
cd `dirname $0`
echo "当前所处的目录：`pwd`"
taskName=解决bug_商品详情页_已选规格对话框_重复点击商品图进预览页_预览角标数量翻倍
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
