#!/bin/bash
while read LINES
do
	USERNAME=`echo $LINES|cut -f1 -d ' '`
	PASSWORD=`echo $LINES|cut -f2 -d ' '`
	echo -n "Username:$USERNAME  PASSWORD:$PASSWORD"
	echo
	useradd $USERNAME
	#echo $PASSWORD | passwd --stdin $USERNAME#normal linux
	echo $USERNAME:$PASSWORD | chpasswd #ubuntu-linux
done<users.txt

