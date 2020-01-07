#!/bin/bash
echo -n "Please input file_name:"
read FILE
function countLine(){
	local i=0
	while read line
	do
		let "i+=1"
	done<$FILE
	echo "$FILE have $i lines."
}
echo "begin"
countLine
