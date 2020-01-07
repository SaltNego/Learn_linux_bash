#!/bin/bash
while read LINES
do
	USERNAME=`echo $LINES|cut -f1 -d ' '`
	PASSWORD=`echo $LINES|cut -f2 -d ' '`
	echo -n "Username:$USERNAME  PASSWORD:$PASSWORD"
	echo
	useradd $USERNAME
	if [ $? -eq 0 ];then
		#echo $PASSWORD | passwd --stdin $USERNAME#normal linux
		echo $USERNAME:$PASSWORD | chpasswd #ubuntu-linux
	else
		echo "$USERNAME is exist , skip change password!"
	fi
done<users.txt

