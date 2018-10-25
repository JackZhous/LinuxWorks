#!/bin/bash

# $1 资源路径
# $2 源码路径
# $3 布局路径

example="usage:  \\n  clsNoUsedrawable.sh 资源路径 源码路径 布局路径"
if [ ! $1 ]; then
	echo "资源路径输入为空"
	echo -e $example
	exit 1;
fi
drawPath=$1
echo "资源文件路径： $drawPath"
if [ ! $2 ]; then
	echo "源码路径输入为空"
	echo -e $example
	exit 1;
fi
codePath=$2
echo "源码文件路径： $codePath"
if [ ! $3 ] ; then
	echo "布局路径输入为空"
	echo -e $example
	exit 1;
fi
layoutPath=$3

#查找所有的资源文件
drawfile=`ls -1 $drawPath | sed s/.png//g | sed s/.9//g`
for f in $drawfile
do
	resultCode=`grep -r "drawable.$f\>" $codePath`
	resultLayout=`grep -r "drawable.$f\>" $layoutPath`
	if [ "$resultCode" -o "$resultLayout" ]; then
		echo "$f.png is used in $resultCode and $resultLayout" >> log.txt
	else
		echo "$f.png is noused" | tee -a log.txt
	fi
done
