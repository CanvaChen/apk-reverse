#!/bin/bash

function checkParam() {
  # 参数：apk路径
	if [ $# -ne 1 ]; then
		echo "Please input an apk file path"
		exit
	fi

  # apk后缀：.apk
	local param=$1
	local filename=${param##*/}
  if [ "${filename##*.}" != "apk" ]; then
    echo "Please input a correct apk file name"
    exit
  fi

  # 文件夹名:apk名称
	export foldername=${filename%.apk}
	# apk绝对路径
	export absolutename=$(cd `dirname $param`; pwd)"/"${filename}
}

function initDir() {
  # 创建并进入output目录
  local output="output"
  if [ ! -d "$output" ]; then
    mkdir $output
  fi
  cd $output
  echo `pwd`
  export absolutefolder=`pwd`"/"${foldername}

  # 删除旧目录
  rm -rf $foldername
}

function isEmptyDir() {
    return `ls -A $1|wc -w`
}
