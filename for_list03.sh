#!/bin/bash
sum=0
for VAR in `seq 98 102`
do
	let "sum+=VAR"
done
echo "sum is $sum"
