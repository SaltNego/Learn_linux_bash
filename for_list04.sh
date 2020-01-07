#!/bin/bash
sum=0
for VAR in $(seq 1 2 100)
do
	let "sum+=VAR"
done
echo "sum is $sum``"
