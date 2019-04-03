#!/bin/bash

# 校验参数，初始化目录
source util.sh
checkParam $1
initDir

# 执行apktool
echo "Decompile resource files ..."
echo `pwd`
java -jar ../tools/apktool_2.4.0.jar d -f $absolutename
if [ ! -d "$foldername" ]; then
  echo "Decompile resource files failed"
  exit
fi
echo "Decompile resource files successfully"

# 执行enjarify
echo "Decompile dex files ..."
cd ../tools/enjarify-1.0.3
echo `pwd`
jarname=${foldername}".jar"
sh enjarify.sh -f $absolutename -o ${absolutefolder}"/"${jarname}
cd $absolutefolder
echo `pwd`
if [ ! -f "$jarname" ]; then
  echo "Decompile dex files failed"
  exit
fi
echo "Decompile dex files successfully"
echo ${absolutefolder}"/"${jarname}

# 执行jd-gui
echo "View the decompiled files ..."
java -jar ../../tools/jd-gui-1.4.1.jar $jarname
