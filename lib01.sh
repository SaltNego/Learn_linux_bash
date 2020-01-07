#!/bin/bash
_checkfile(){
	if [ -f $1 ];then
		echo "File : $1 is exist"
	else
		echo "File : $1 is not exist"
	fi
}

