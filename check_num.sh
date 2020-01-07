#!/bin/bash

function checknum(){
	echo -n "Please input the num:"
	read NUM
	
	if [ $NUM -ge 0 -a $NUM -lt 10 ];then
		return 0
	fi
	if [ $NUM -ge 10 -a $NUM -lt 20 ];then
		return 1
	fi
	if [ $NUM -ge 20 -a $NUM -lt 30 ];then
		return 2
	fi
	
	return 3
}
echo "Call function $0"
checknum

RTV=$?
if [ $RTV -eq 0 ];then
	echo "The num between 0-10"
elif [ $RTV -eq 1 ];then
	echo "The num between 10-20"
elif [ $RTV -eq 2 ];then
	echo "The num between 20-30"
else
	echo "Unknown num !"
fi


