#!/bin/bash

# $1 项目根路径

example="usage:  \\n  clsNoUsedrawable.sh 项目根路径"
if [ ! $1 ]; then
	echo "输入为空"
	echo -e $example
	exit 1;
fi
projPath="$1/src/main"
javaPath="$projPath/java"
resPath="$projPath/res"
layoutPath="$projPath/res/layout"
drawablePath=`ls -1 $projPath/res | grep ^d`

#检索drawable下面的资源在layout和Java代码里面是否有被使用
#for draw in $drawablePath
#do
#	resName=`ls -1 $resPath/$draw/ | sed s/.xml//g | sed s/.png//g | sed s/.9//g`
#	for drawfileName in $resName
#	do
#		resultCode=`grep -r "drawable.$drawfileName\>" $javaPath`
#		resultLayout=`grep -r "drawable.$drawfileName\>" $layoutPath`
#		if [ "$resultCode" -o "$resultLayout" ]; then
#			echo "--- $resultLayout" >> log.txt
#			echo "--- $resultCode" >> log.txt
#		else
#			echo "$draw/$drawfileName is no used" | tee -a log.txt
#		fi
#	done
#done

layoutFiles=`ls -1 $layoutPath | grep $.xml`
echo $layoutFiles

#ls -l `$projPath`

#查找所有的资源文件
#drawfile=`ls -1 $drawPath | sed s/.png//g | sed s/.9//g`
#for f in $drawfile
#do
#	resultCode=`grep -r "drawable.$f\>" $codePath`
#	resultLayout=`grep -r "drawable.$f\>" $layoutPath`
#	if [ "$resultCode" -o "$resultLayout" ]; then
#		echo "$f.png is used in $resultCode and $resultLayout" >> log.txt
#	else
#		echo "$f.png is noused" | tee -a log.txt
#	fi
#done
