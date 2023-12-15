#!/bin/sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh
  metaDataFile="/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.14/2023-08-15--15-02-35_付玉光_POP商品详情页关联商品/metaData.txt"
  branchName=$(grep -w "branchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  renamedFeatureBranchName=$(grep -w "renamedFeatureBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')

  if [ -z "${renamedFeatureBranchName}" ];then
    macos_show_dialog "请填充metaDataFile.txt文件中renamedFeatureBranchName项"
    echo "$?"
    exit 0
  fi

  echo " ✍️ 你输入的分支名是：${renamedFeatureBranchName} 确定要执行重命名操作吗 no/yes ❓"

  read -p " 确定要执行重命名命令吗 ❓： "  toExecuteCommand
  if [ "${toExecuteCommand}" != "yes" ];then
    exit 0
  fi

  cd ${android_studio_root}


  #[Git大小写不敏感引发的血案](https://juejin.cn/post/6979105615541075999)
  #[git分支名字大小写的问题？](https://segmentfault.com/q/1010000009620846)
  #[Shell中字符串比较忽略大小写的问题](https://www.coonote.com/shell-note/shell-ignores-case.html)
  #-q静默的方式，即不会产生输出，成功则0返回0，刚好走if的条件分支，非常巧妙！
  #-i 匹配字符串，但忽略大小写 -w 按照单词进行精确匹配
  if echo "${branchName}" | grep -qwi "${renamedFeatureBranchName}"
  then
      echo "❌ git 重命名分支名是不区分大小写的，请重命名为名字😃
        例如 timeDialog 不能重命名为 TimeDialog，报fatal: A branch named 'feature/feature_ld_1.1.1_TimeDialog' already exists.
        删除本地分支时也不区分大小写，但删除远端分支时区分大小写 如：error: unable to delete 'feature/feature_ld_1.1.1_diglOG': remote ref does not exist ❗️"
      exit 0
  else
      echo "分支非大小写重命名，检测通过✅"
  fi



  #a1.先重命名本地分支
  git branch -m ${branchName} ${renamedFeatureBranchName}


  #a2.删除远程分支
  git push -d origin ${branchName}


  #a3.上传新修改名称的本地分支
  git push origin ${renamedFeatureBranchName}


  #a4.修改后的本地分支关联远程分支
  git push --set-upstream origin ${renamedFeatureBranchName}




  #  把之前手动加的renamedFeatureBranchName给重置了
  sed -i '' "s#${renamedFeatureBranchName}#""#" "${metaDataFile}"
  #  把branchName 赋值新分支名 
  sed -i '' "s#${branchName}#${renamedFeatureBranchName}#" "${metaDataFile}"

