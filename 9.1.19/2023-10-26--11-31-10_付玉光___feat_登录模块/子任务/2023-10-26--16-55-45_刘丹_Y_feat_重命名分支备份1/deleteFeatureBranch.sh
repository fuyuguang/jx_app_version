#!/bin/bash
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/listChangedFile.sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh
source "/Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_alert.sh"

  metaDataFile=metaData.txt
  metaDataFile=$(readlink -f "${metaDataFile}")

  #不能使用 grep -w "preReleaseBranchName=" 来精确搜索，因为preReleaseBranchName=不是单词，搜索不到！！！
  preReleaseBranchName=$(grep -w "preReleaseBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchName=$(grep -n -w "branchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  gitProjectRootPath=$(grep -w "gitProjectRootPath" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  deleteBranchName="${branchName}"

  sh listChangedFile.sh
  cd ${gitProjectRootPath}



  #先切到 preReleaseBranchName 分支去判断要删除的分支是否存在，和要删除的分支是否合并到当期分支了等判断
  git checkout "${preReleaseBranchName}"

  #获取当前分支名，执行删除分支命令失败后，好回滚到当期分支，执行成功，会切换到 ${preReleaseBranchName} 分支
  currentBranch=$(git branch --show-current)

  # 要删除的分支名
   branch_name=${deleteBranchName}
   echo "要删除的分支名  =${deleteBranchName},   当前所在的分支名为: ${currentBranch} "

   if [ "${branch_name}" = "${currentBranch}" ]; then
       macos_show_alert " ❌ 请切换到其他分支后再执行删除该分支操作 ⚠️ "
       exit
   fi

   # 检查分支是否存在
  if git rev-parse --verify "$branch_name" >/dev/null 2>&1; then

      echo " 检查分支是否被合并"
      git branch --merged | grep "$branch_name"

      if git branch --merged | grep -q "$branch_name"; then
          echo "✅ 要删除的分支 $branch_name 已经合并到 ${preReleaseBranchName} 分支"
          read -p " ⚠️ 该操作会导致你 ${deleteBranchName} 分支被删除，确定要删除吗 ❓" AreYouSureDeleteBranch
          #line 31: [: !=: unary operator expected ,当 AreYouSureDeleteBranch 为空，报该错
          if [ "${AreYouSureDeleteBranch}1" != "yes1" ]; then
           exit 0
          fi
          # 删除分支
          git branch -d "$branch_name"
          if((0 != $?))
            then
              macos_show_dialog "❌ 本地分支 有代码没有提交到远端 is not fully merged 删除分支失败了"
              git checkout ${currentBranch}
              exit 10
          fi
          echo "分支 $branch_name 删除成功"
      else
#          echo "分支 $branch_name 尚未合并，请先合并后再删除"
#          macos_show_dialog "❌ ${branch_name} 分支 尚未合并到 ${preReleaseBranchName} 分支，请先合并后再删除"
#          git checkout ${currentBranch}
#          exit 10

          echo "分支 $branch_name 尚未合并，请先合并后再删除"
          execResult=$(macos_show_dialog "❌ ${branch_name} 分支 尚未合并到 ${preReleaseBranchName} 分支，请先合并后再删除")
          if [ "${execResult}" = "button returned:好" ]; then
              echo "${resultString}"
              execResult=$(macos_show_dialog " 要 ❌ 强制删除 ${branch_name} 分支吗  ❓ ")
              if [ "${execResult}" = "button returned:好" ]; then
                #强制删除该分支
                git branch -D "$branch_name"
              else
                  git checkout "${currentBranch}"
                  exit 10
              fi
          else
              git checkout "${currentBranch}"
              exit 10
          fi
      fi
  else
      echo "分支 $branch_name 不存在"
      macos_show_dialog "❌ 分支 $branch_name 不存在"
      git checkout ${currentBranch}
      exit 10
  fi




  git push origin --delete ${deleteBranchName}


  #删除包含 finishTaskTime= 关键字的行   sed -i "" "//d" ./data/test
  sed -i "" "/finishTaskTime=/d" "${metaDataFile}"

  #[Mac Shell脚本中使用echo的-n参数不生效](https://blog.csdn.net/zhi_cike/article/details/77853585)
  #[Makefile echo -n' 不起作用](https://stackoverflow.com/questions/11675070/makefile-echo-n-not-working)
  echo "finishTaskTime=$(date +%Y-%m-%d/%H-%M-%S)" >> "${metaDataFile}"

