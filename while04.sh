#!/bin/bash
while read LINE
do
	NAME=`echo $LINE | awk '{print $1}'`
	TIME1=`echo $LINE | awk '{print $2}'`
	TOTAL=`echo $LINE | awk '{print $5}'`
	echo "my name is $NAME, time1 is $TIME1 , TOTAL IS $TOTAL"
done
