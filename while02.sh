#!/bin/bash
PRE_SET_NUM=8
echo -n "Please input a num (1-100):"
while read GUESS
do
	if [[ $GUESS -eq $PRE_SET_NUM ]];then
		echo "You win!!!"
		exit
	else
		echo "wrong,try again."
	fi
done
