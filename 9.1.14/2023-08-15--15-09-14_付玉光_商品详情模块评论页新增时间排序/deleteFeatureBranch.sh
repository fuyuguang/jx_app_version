#!/bin/bash
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/listChangedFile.sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/macos_show_dialog.sh


  metaDataFile="/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.14/2023-08-15--15-09-14_付玉光_商品详情模块评论页新增时间排序/metaData.txt"
  preReleaseBranchName=$(grep -w "preReleaseBranchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  branchName=$(grep -n -w "branchName" "${metaDataFile}" | awk -F "=" '{ print $2 }')
  deleteBranchName="${branchName}"

  sh listChangedFile.sh
  cd ${android_studio_root}
  read -p " ⚠️ 该操作会导致你 ${deleteBranchName} 分支被删除，确定核实过该分支已经合并到  feature/feature_preRelease_9.1.14 ❓" AreYouSureDeleteBranch

  if [ ${AreYouSureDeleteBranch} != "yes" ]; then
   exit 0
  fi

  #获取当前分支名，执行删除分支命令失败后，好回滚到当期分支，执行成功，会切换到 ${preReleaseBranchName} 分支
  currentBranch=$(git branch --show-current)

  #先切到 preReleaseBranchName 分支去判断要删除的分支是否存在，和要删除的分支是否合并到当期分支了等判断
  git checkout "${preReleaseBranchName}"

  # 要删除的分支名
   branch_name=${deleteBranchName}
   echo "要删除的分支名  =${deleteBranchName}"
   # 检查分支是否存在
  if git rev-parse --verify "$branch_name" >/dev/null 2>&1; then
      # 检查分支是否被合并
      if git branch --merged | grep -q "$branch_name"; then
          echo "✅ 有删除的分支 $branch_name 已经合并到 ${preReleaseBranchName} 分支"
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
          echo "分支 $branch_name 尚未合并，请先合并后再删除"
          macos_show_dialog "❌ ${branch_name} 分支 尚未合并到 ${preReleaseBranchName} 分支，请先合并后再删除"
          git checkout ${currentBranch}
          exit 10
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

