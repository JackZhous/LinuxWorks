#!/bin/bash

# author jackzhous
#

# $1 项目根路径 一般是project/app这一级目录
#	原理：1. 搜索drawable和mipmap下面的图片在layout和Java代码里面是否被使用
#	      2. 搜索layouthe和menu布局文件在layout和Java源码里面是否有使用
#	
#	结果：
#		没有用到的资源会直接在终端输出
#		详细的日志会在当前路径的log.txt保存


example="usage:  \\n  clsNoUsedrawable.sh 项目根路径"
if [ ! $1 ]; then
	echo "输入为空"
	echo -e $example
	exit 1;
fi
projPath="$1/src/main"
javaPath="$projPath/java"
resPath="$projPath/res"
layoutPath="$projPath/res"
resItems=`ls -1 $projPath/res | grep '^d\|^m\|^l'`

#开始检索资源
for resItem in $resItems
do
	resName=`ls -1 $resPath/$resItem/ | sed s/.xml//g | sed s/.png//g | sed s/.9//g`
	for item in $resName
	do
		resultCode=`grep -rw "${resItem%-*}.$item" $javaPath`
		resultLayout=`grep -rw "${resItem%-*}.$item" $layoutPath`
		if [ "$resultCode" -o "$resultLayout" ]; then
			echo "$resItem/$item used ---------" >> log.txt
			echo "$resultLayout" >> log.txt
			echo "$resultCode" >> log.txt
			echo "             ---------" >> log.txt
		else
			echo "$resItem/$item  no used" | tee -a log.txt
		fi
	done
done
