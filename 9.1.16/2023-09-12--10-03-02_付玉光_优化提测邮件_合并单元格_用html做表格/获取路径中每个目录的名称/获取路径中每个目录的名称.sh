#!/bin/bash

#写一个shell脚本方法并调用一下，完成的功能是 给这个方法传递2个参数，第一个参数是路径 /Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.16 第2个参数是倒数目录的角标。例如要获取/Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.16 路径下 倒数第0个角标的值为：9.1.16，倒数第1个脚本的值为：酒仙官网app，倒数第3个脚本的值为：1版本



# 接收两个参数
#path=$1
#index=$2
#
## 分割路径为目录数组
#IFS='/' read -ra dirs <<< "$path"
#
## 计算倒数目录的索引
#reverse_index=$(( ${#dirs[@]} - $index - 1 ))
#
## 获取倒数目录的值
#result="${dirs[$reverse_index]}"
#
#echo "倒数第${index}个目录的值为：$result"

#你可以通过在终端中运行脚本并传递参数来测试它。例如：

#$ ./script.sh /Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.16 0



function getFolderNameNameFromPath(){
  path=$1
  index=$2

  # 分割路径为目录数组
  IFS='/' read -ra dirs <<< "$path"

  # 计算倒数目录的索引
  #[Shell数组长度](https://haicoder.net/shell/shell-array-length.html)
  #使用 @ 将数组转成列表，再次使用 # 获取数组长度
  reverse_index=$(( ${#dirs[@]} - $index - 1 ))

  # 获取倒数目录的值
  result="${dirs[$reverse_index]}"

  echo "倒数第${index}个目录的值为：$result"
}

#getFolderNameNameFromPath /Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.16/1.txt 0
getFolderNameNameFromPath /Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.19/2023-10-25--18-35-36_付玉光_Y_feat_商品详情模块1/子任务/2023-10-25--19-11-14_刘丹___fix_xx123/metaData.txt 0
getFolderNameNameFromPath /Users/fuyuguang/jiuxian_studio/doc/1版本/酒仙官网app/9.1.19/2023-10-25--18-35-36_付玉光_Y_feat_商品详情模块1/子任务/2023-10-25--19-11-14_刘丹___fix_xx123/metaData.txt 1
echo "-------------------------"


#[shell分割字符串到数组，分割符为|](https://www.5axxw.com/questions/simple/30spu8)
#使用read命令来读取标准输入。
# -r选项用来防止反斜杠字符被解释。
# -a选项用来将输入分割为数组。
# <<<用来将字符串作为输入传递给read命令。
# IFS环境变量被设置为|，作为分隔符。
# 分别使用${array[0]}, ${array[1]}, ${array[2]}, ${array[3]}来访问数组元素。
string="apple|banana|cherry|date"
IFS='|' read -r -a array <<< "$string"
echo "First element: ${array[0]}"
echo "Second element: ${array[1]}"
echo "Third element: ${array[2]}"
echo "Fourth element: ${array[3]}"