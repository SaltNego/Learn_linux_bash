#!/bin/bash
HOSTNAME="localhost"
USERNAME="root"
PASSWORD="wen1053431697"
MYSQL=/usr/bin/mysql
while true
do
	echo -n "Please input your sql :"
	read SQL_STR
	$MYSQL -u$USERNAME -p$PASSWORD -e "$SQL_STR"
done
