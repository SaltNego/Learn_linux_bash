#!/bin/bash
echo -n "Please input file name:"
read FILE

function checkfile(){
	if [ -f $FILE ];then
		return 0
	else
		return 1
	fi
}
echo "begin:::;"
checkfile
if [ $? -eq 1 ];then
	echo "file not exist;"
else
	echo "file exist!"
fi
