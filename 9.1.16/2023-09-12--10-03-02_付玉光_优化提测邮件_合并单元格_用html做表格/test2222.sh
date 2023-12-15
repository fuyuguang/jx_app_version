



#用shell 写一个脚本 完成的功能是  获取a目录下所有文件名称为 11.txt的文件并且当
# 文件中有finishTaskTimeStamp关键字时 打印ok字符串



cd ..
pwd
directory=`pwd`

# Iterate through each file in the directory
for file in "$directory"/*; do
    # Check if the file is named "11.txt"
    if [[ "$(basename "$file")" -eq "metaData.txt" ]]; then
        # Check if the file contains the "finishTaskTimeStamp" keyword
        echo "$file"
        if grep -q "finishTaskTimeStamp" "$file"; then
            echo "ok"
        fi
    fi
done