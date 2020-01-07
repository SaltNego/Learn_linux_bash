xunhuan


for VARIABLE in (list)
do
	command
done

root@kali:~/Desktop# cat fruit01.sh 
#!/bin/bash
for FRUIT in apple banana orange pear
do
        echo "$FRUIT is my favorite"
done
echo "no more fruit"

root@kali:~/Desktop# bash fruit01.sh 
apple is my favorite
banana is my favorite
orange is my favorite
pear is my favorite
no more fruit
root@kali:~/Desktop# vim fruit02.sh
root@kali:~/Desktop# cat fruit02.sh 
#!/bin/bash
fruits="apple banana orange pear"
for FRUIT in $fruits
do
        echo "$FRUIT is your favorite"
done
echo "no more"
root@kali:~/Desktop# bash fruit02.sh 
apple is your favorite
banana is your favorite
orange is your favorite
pear is your favorite
no more
root@kali:~/Desktop# 


root@kali:~/Desktop# vim for_list.sh
root@kali:~/Desktop# cat for_list.sh 
#!/bin/bash
for VAR in 1 2 3 4 5
do
        echo "look $VAR times"
done

root@kali:~/Desktop# bash for_list.sh 
look 1 times
look 2 times
look 3 times
look 4 times
look 5 times
root@kali:~/Desktop# vim for_list03.sh 
root@kali:~/Desktop# cat for_list03.sh 
#!/bin/bash
sum=0
for VAR in `seq 98 102`
do
        let "sum+=VAR"
done
echo "sum is $sum"
root@kali:~/Desktop# bash for_list03.sh 
sum is 500
root@kali:~/Desktop# 

在shell中可以使用let来指示下面是算术表达式，let表达式内变量不用加$

root@kali:~/Desktop# vim for_list04.sh
root@kali:~/Desktop# cat for_list04.sh 
#!/bin/bash
sum=0
for VAR in $(seq 1 2 100)
do
        let "sum+=VAR"
done
echo "sum is $sum``"
root@kali:~/Desktop# bash for_list04.sh 
sum is 2500
root@kali:~/Desktop# 


root@kali:~/Desktop# vim for_list05.sh
root@kali:~/Desktop# cat for_list05.sh 
#!/bin/bash
for VAR in $(ls)
do
        ls -al $VAR
done
root@kali:~/Desktop# bash for_list05.sh 
-rw-r--r-- 1 root root 85 Jan  4 22:12 for_list03.sh
-rw-r--r-- 1 root root 89 Jan  4 22:15 for_list04.sh
-rw-r--r-- 1 root root 50 Jan  4 22:18 for_list05.sh
-rw-r--r-- 1 root root 66 Jan  4 22:04 for_list.sh
-rw-r--r-- 1 root root 110 Jan  4 21:59 fruit01.sh
-rw-r--r-- 1 root root 122 Jan  4 22:03 fruit02.sh
-rw-r--r-- 1 root root 709 Jan  4 22:05 read.md


no list xunhuan

for VARIABLE
do
	command
done

root@kali:~/Desktop# vim for01.sh
root@kali:~/Desktop# cat for01.sh 
#!/bin/bash
for VARIABLE in $@
do 
        echo -n $VARIABLE
done
echo "ok"
root@kali:~/Desktop# bash for01.sh 123 456 789
123456789ok
root@kali:~/Desktop# bash for01.sh 123
123ok


lei C xunhuan

for ((expression1;expression2;expression3))
do
	command
done

root@kali:~/Desktop# vim c_for01.sh
root@kali:~/Desktop# cat c_for01.sh 
#!/bin/bash
for ((i=1;i<10;i++))
do
        echo "  "
        echo -n "num is $i"
done
root@kali:~/Desktop# bash c_for01.sh 
  
num is 1  
num is 2  
num is 3  
num is 4  
num is 5  
num is 6  
num is 7  
num is 8  
num is 9root@kali:~/Desktop# 
root@kali:~/Desktop# vim c_for02.sh
root@kali:~/Desktop# bash c_for02.sh 
c_for02.sh: line 2: syntax error: `;' unexpected
c_for02.sh: line 2: syntax error: `((i=50,j=100;i>=40;i--;j++))'
root@kali:~/Desktop# vim c_for02.sh
root@kali:~/Desktop# cat c_for02.sh 
#!/bin/bash
for ((i=50,j=100;i>=40;i--,j++))
do
        echo "\$i=$i  \$j=$j"
done
root@kali:~/Desktop# bash c_for02.sh 
$i=50  $j=100
$i=49  $j=101
$i=48  $j=102
$i=47  $j=103
$i=46  $j=104
$i=45  $j=105
$i=44  $j=106
$i=43  $j=107
$i=42  $j=108
$i=41  $j=109
$i=40  $j=110
root@kali:~/Desktop# vim c_for03.sh
root@kali:~/Desktop# cat c_for03.sh 
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
root@kali:~/Desktop# vim c_for03.sh 
root@kali:~/Desktop# bash c_for03.sh 
sum1 is 5050
sum2 is 2500
root@kali:~/Desktop#


for wuxian xunhuan

root@kali:~/Desktop# cat c_for05.sh 
#!/bin/bash
for ((;1;))
do
        echo "null loop"
done
root@kali:~/Desktop# bash c_for05.sh 






