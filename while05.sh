#!/bin/bash
while true
do
	HTTP_STATUS=`service apache2 status|grep running`
	if [ -n HTTP_STATUS ];then
		echo "HTTP IS RUNNING "
		service apache2 restart
	else
		echo "HTTP IS NOT RUNNING !"
		service apache2 start
	fi
	sleep 5
done

