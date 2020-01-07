#!/bin/bash
for ((i=1;i<=9;i++))
do
	for ((j=1;j<=9;j++))
	do
		if [[ $j -le $i ]];then
			let "multi=$i*$j"
			echo -n "$i*$j=$multi "
		else
			break
		fi
	done
	echo
done
