#!/bin/bash
TOTAL=0
until [ $# -eq 0 ]
do
	let "TOTAL+=$1"
	shift
done
echo "Total is $TOTAL"
