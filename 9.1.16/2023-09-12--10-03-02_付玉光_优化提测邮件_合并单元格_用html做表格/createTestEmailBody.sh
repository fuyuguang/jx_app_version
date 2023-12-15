#!/bin/bash

source "${shell_script_loc}/macos_show_alert.sh"
source "${shell_script_loc}/workFlowUtil.sh"

#在这个脚本中，首先使用 find 命令找到 ./a 目录下除了 a 目录本身以外的所有子文件夹。
# 然后，针对每个子文件夹，再次使用 find 命令找到以 .sh 结尾的文件。
# -type d 选项用于指定只搜索文件夹，而 -not -path "./a" 选项用于排除 a 目录本身。  -exec 选项用于在每个子文件夹上执行第二个 find 命令。
#在 while 循环中，使用 read 命令逐行读取每个文件路径。然后，使用 readlink -f 命令获取每个文件的绝对路径，并输出。
#find ../ -type f -exec find {} -type f -name "metaData.txt" \; | while read -r file; do
#find ../ -type f -name "metaData.txt" | while read -r file; do
#    echo "$(readlink -f "${file}")"
#done



project_list=${createTask_loc}/data/projectItem/projectItem.txt
echo "project_list=${project_list}"
nl "${project_list}"

build_projectName "${project_list}"

#projectMetaData=${createTask_loc}/data/projectItem/${projectName}/metaData.txt
projectMetaDataDir=${createTask_loc}/data/projectItem/${projectName}
echo "projectMetaDataDir=${projectMetaDataDir}"

projectMetaDataTemDir="${projectMetaDataDir}/tem"
#生成提测邮件的临时目录
projectMetaDataGenerateTestEmailDir="${projectMetaDataTemDir}/generateTestEmail"
mkdir -p "${projectMetaDataGenerateTestEmailDir}"

#获取项目metaData文件中 提测邮件内容是否高亮的值
projectMetaData=${createTask_loc}/data/projectItem/${projectName}/metaData.txt
echo "projectMetaData=${projectMetaData}"

highlightTheTestLine=$(grep -w "highlightTheTestLine" "${projectMetaData}" | awk -F "=" '{ print $2 }')
workDirParent=$(grep -w "workDirParent" "${projectMetaData}" | awk -F "=" '{ print $2 }')
echo "highlightTheTestLine=${highlightTheTestLine}"
echo "workDirParent=${workDirParent}"
projectWorkDir=${workDirParent}/${projectName}
echo "projectWorkDir=${projectWorkDir}"

projectMetaDataVersionList="${projectMetaDataDir}/version_list.txt"

tree "${projectWorkDir}"  -L 1 -d -i --noreport | grep -v -e ./ > "${projectMetaDataVersionList}"
#tree -L 1 -d -i --noreport | grep -v -e \\. -e ^$ > ${project_list}


nl "${projectMetaDataVersionList}"
build_projectVersion "${projectMetaDataVersionList}"
echo "projectVersion=${projectVersion}"

projectVersionWorkDir="${projectWorkDir}/${projectVersion}"
echo "projectVersionWorkDir=${projectVersionWorkDir}"

projectVersionReleaseWorkDir="${projectVersionWorkDir}/${projectVersion}版本总结"
mkdir -p "${projectVersionReleaseWorkDir}"
echo "projectVersionReleaseWorkDir=${projectVersionReleaseWorkDir}"

#exit




#itemCount=$(find ${targetDir} -type f -name "metaData.txt" | wc -l)

#find ${targetDir} -type f -name "metaData.txt"

#chmod 777 $0
currentDir=`dirname $0`
echo "currentDir=${currentDir}"


tenMinuteAgo=$(getTenMinuteAgoTimeStamp)

currentTime=$(date +%Y%m%d%H%M%S)

targetTableHeader="${projectMetaDataGenerateTestEmailDir}/testing_table.md"
targetEmailSubject="${projectMetaDataGenerateTestEmailDir}/testing_emailSubject.md"
PerfectFile="${projectVersionReleaseWorkDir}/提测邮件.md"
listOfMetadataFilesForTestingTasks="${projectMetaDataGenerateTestEmailDir}/testing_task_metaDataFileLists.txt"



bin/echo -n "" > "${targetTableHeader}"
#不换行输出
#echo -n "" > ${listOfMetadataFilesForTestingTasks}
bin/echo -n "" > ${listOfMetadataFilesForTestingTasks}

emailSubject="\n <h4> ${projectName} ${projectVersion}版本,如下功能提测 </h4> \n"
temTaskName=""

itemCount=0
#先获取能提测的任务数，没有提测的任务，过滤掉,itemCount 的获取 通过管道+while的方式获取不到
#[shell循环中变量的作用域问题shell变量失效](https://blog.csdn.net/h952520296/article/details/122434115)
#[管道导致的while循环体变量失效](https://blog.csdn.net/weixin_30906671/article/details/94779726?spm=1001.2101.3001.6650.8&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-8-94779726-blog-122434115.235%5Ev38%5Epc_relevant_sort&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-8-94779726-blog-122434115.235%5Ev38%5Epc_relevant_sort&utm_relevant_index=14)
find "${projectVersionWorkDir}" -type f -name "metaData.txt" | while read -r file; do
  if grep -q "finishTaskTimeStamp" "$file"; then
        absFilePath=`readlink -f  $file`

       finishTaskTimeStamp=$(grep -w "finishTaskTimeStamp" "${absFilePath}" | awk -F "=" '{ print $2 }')
      if [ -z ${finishTaskTimeStamp}  ]; then
          echo "finishTaskTimeStamp 字符串为空"
          continue
      fi
      echo "${absFilePath}" >> "${listOfMetadataFilesForTestingTasks}"
        ((itemCount++))
#        echo $file >> metaDataList.txt

  fi
done

itemCount=$(cat "${listOfMetadataFilesForTestingTasks}" | wc -l)
echo "itemCount=${itemCount}"



#遍历的脚标，当index=1时，添加表格的头部
index=0
#[shell循环中变量的作用域问题shell变量失效](https://blog.csdn.net/h952520296/article/details/122434115)
#find ${targetDir} -type f -name "metaData.txt" | while read -r file; do


#由于管道符是非内建命令，非内建指令中定义的变量只能在孙shell运行，而在子shell中不生效，为了解决这个问题改用重定向写法
#find $(dirname "${targetDir}") -type f -name "metaData.txt" > metaDataList.txt
echo "cat metaDataList.txt start"
cat "${listOfMetadataFilesForTestingTasks}"
echo "cat metaDataList.txt end"

while read -r file; do
  echo "file=$file"
#    itemFile=$(readlink -f "${file}")
    itemFile=${file}
    chmod 777 ${itemFile}
    echo "itemFile=${itemFile}"

  projectName=$(grep -w "projectName" "${itemFile}" | awk -F "=" '{ print $2 }')
  productManager=$(grep -w "productManager" "${itemFile}" | awk -F "=" '{ print $2 }')
  developer=$(grep -w "developer" "${itemFile}" | awk -F "=" '{ print $2 }')
  taskName=$(grep -w "taskName" "${itemFile}" | awk -F "=" '{ print $2 }')

  workDir=$(grep -w "workDir" "${itemFile}" | awk -F "=" '{ print $2 }')
  branchName=$(grep -w "branchName" "${itemFile}" | awk -F "=" '{ print $2 }')
  createTaskTime=$(grep -w "createTaskTime" "${itemFile}" | awk -F "=" '{ print $2 }')
  preReleaseBranchName=$(grep -w "preReleaseBranchName" "${itemFile}" | awk -F "=" '{ print $2 }')
  finishTaskTimeStamp=$(grep -w "finishTaskTimeStamp" "${itemFile}" | awk -F "=" '{ print $2 }')



  index=$((${index}+1))
  echo "index=${index}"

#  styleBackgroundColor='#ffffff;'
  styleBackgroundColor='#ffffff;'
  style=""
  #任务的提测时间 > 10分钟以前的时间，就把背景颜色标红，好让测试人员知道那个任务提测了
  if [[ ${finishTaskTimeStamp} -ge ${tenMinuteAgo} ]]; then
      styleBackgroundColor='#ff99cc;'
      if [[ "${highlightTheTestLine}" == "true" ]]; then
        style='style="background-color:#ff9999;"'
      fi
      #[Markdown缩进控制](https://blog.csdn.net/qq_44220418/article/details/115014386)
#      temTaskName="${temTaskName} <br/>  >  &emsp;&nbsp;&emsp;&nbsp; 【${taskName}】"
#      temTaskName="${temTaskName}  <left><big><b>【${taskName}】</b></big></left> <br/> \n"
#      temTaskName="${temTaskName}  <h5>【${taskName}】</h5> <br/> \n"
      temTaskName="${temTaskName}  <h5>【${taskName}】</h5> \n"
#      temTaskName="${temTaskName} <br/> \v 【${taskName}】"
      echo "temTaskName=${temTaskName}"
  fi


    #如果index == 1, 添加表头
    if [[ index -eq 1 ]]; then

cat >> "${targetTableHeader}" << EOF

<table border="1" width="50%" height="50%" cellspacing="0"
  cellpadding="0">
  	<tr>
  	  <th style="background-color:#fff2f2;" rowspan="$(( ${itemCount}+1 ))" align="left">${projectVersion}版本</th>
  	  <th>提测需求/bug</th>
  	  <th>描述</th>
  	  <th rowspan="1">开发</th>
  	  <th>产品</th>
  	  <th>完成</th>
      <th>编号</th>
  	  <th>变更影响范围</th>
  	  <th>自测</th>
      <th>提测分支</th>
      <th>提测时间</th>
  	</tr>
EOF

    fi

cat >> "${targetTableHeader}" << EOF
  	<tr ${style}>
  	  <td rowspan="1" align="left" translate="提测需求">${taskName}</td>
  	  <td translate="描述"></td>
  	  <td translate="开发">${developer}</td>
  	  <td translate="产品">${productManager}</td>
  	  <td translate="完成">ok</td>
      <td translate="编号">${createTaskTime}</td>
  	  <td translate="变更影响范围"></td>
  	  <td translate="自测">ok</td>
      <td translate="提测分支">${preReleaseBranchName}</td>
      <td translate="提测时间">$(timeStamp2Date "${finishTaskTimeStamp}" '%Y-%m-%d/%H:%M:%S')</td>
  	</tr>
EOF


done < "${listOfMetadataFilesForTestingTasks}"




cat >> "${targetTableHeader}" << EOF
</table>
EOF





#emailSubject1="${emailSubject}  ${temTaskName} 功能提测 "
emailSubject1="${emailSubject}${temTaskName} "
echo "emailSubject=${emailSubject1}"

if [ -z "${temTaskName}" ]; then
  macos_show_alert "最近10分钟内，没有要提测的任务"
fi

echo "${emailSubject1}" > "${targetEmailSubject}"
#-e
cat "${targetEmailSubject}" "${targetTableHeader}" > "${PerfectFile}"



cd "${android_studio_root}"
echo "
    1111111
  "
tagVersion=$(git describe --tags | awk -F "-" ' { print $1 }')
if [ -n "${tagVersion}" ]; then
  echo "
    1111111
  " >> "${PerfectFile}"
  git log "${tagVersion}"..HEAD --pretty=format:%s >>  "${PerfectFile}"
fi


