#!/bin/bash






#把A文件中所有的相对图片路径替换为绝对路径

#查找 2023-12-12--10-22-31_石毅恒___feat_666目录下/table/assets文件夹 获取1级目录列表

#描述.assets
#变更影响范围.assets


assetsListFile="./assetsListFile.txt"
inputDir="/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.20/2023-12-11--19-02-43_付玉光___feat_33333/子任务/2023-12-12--10-22-31_石毅恒___feat_666/table/assets"
#tree "${inputDir}"  -L 1 -d -i -v --noreport | grep -v -e "${inputDir}" > "${assetsListFile}"

find "${inputDir}" -maxdepth 1 -type d -name *".assets" > "${assetsListFile}"
