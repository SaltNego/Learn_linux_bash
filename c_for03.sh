#!/bin/bash
sum1=0
sum2=0
for ((i=1,j=1;i<=100;i++,j+=2))
do
	let "sum1+=i"
	if [ $j -le 100 ];then
		let "sum2+=j"
	fi
done
echo "sum1 is $sum1"
echo "sum2 is $sum2"
