## while循环
### 基本格式
````bash
while expression
do
	command
done
````
````bash
root@kali:~/Desktop# vim while01.sh 
root@kali:~/Desktop# cat while01.sh 
#!/bin/bash
CONTER=5
while [[ $CONTER -ge 0 ]]
do
        echo -n "$CONTER"
        let "CONTER-=1"

done
echo
root@kali:~/Desktop# bash while01.sh 
543210
root@kali:~/Desktop# vim while02.sh
root@kali:~/Desktop# cat while02.sh 
#!/bin/bash
PRE_SET_NUM=8
echo -n "Please input a num (1-100):"
while read GUESS
do
        if [[ $GUESS -eq $PRE_SET_NUM ]];then
                echo "You win!!!"
                exit
        else
                echo "wrong,try again."
        fi
done
root@kali:~/Desktop# bash while02.sh 
Please input a num (1-100):88
wrong,try again.
77
wrong,try again.
12
wrong,try again.
8
You win!!!
````

````bash
root@kali:~/Desktop# vim students.txt
root@kali:~/Desktop# cat students.txt 
      Name        1st        2nd        3th      Total
     VBird      23000      24000      25000   72000.00
    DMTsai      21000      20000      23000   64000.00
     Bird2      43000      42000      41000  126000.00
root@kali:~/Desktop# vim while04.sh
root@kali:~/Desktop# cat while04.sh 
#!/bin/bash
while read LINE
do
        NAME=`echo $LINE | awk '{print $1}'`
        TIME1=`echo $LINE | awk '{print $2}'`
        TOTAL=`echo $LINE | awk '{print $5}'`
        echo "my name is $NAME, time1 is $TIME1 , TOTAL IS $TOTAL"
done
root@kali:~/Desktop# cat students.txt | bash while04.sh 
my name is Name, time1 is 1st , TOTAL IS Total
my name is VBird, time1 is 23000 , TOTAL IS 72000.00
my name is DMTsai, time1 is 21000 , TOTAL IS 64000.00
my name is Bird2, time1 is 43000 , TOTAL IS 126000.00
root@kali:~/Desktop# 
````

### while的无限循环
````bash
#三种形式
while ((1))
do
	command
done

while true
do
	command
done

while :
do
	command
done
````

````bash

oot@kali:~/Desktop# service apache2 status
● apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
     Docs: https://httpd.apache.org/docs/2.4/
root@kali:~/Desktop# service apache2 start
root@kali:~/Desktop# service apache2 status
● apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; disabled; vendor preset: disabled)
   Active: active (running) since Sun 2020-01-05 00:57:59 EST; 2s ago
     Docs: https://httpd.apache.org/docs/2.4/
  Process: 4250 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
 Main PID: 4261 (apache2)
````

````bash
#检测服务是否开启
root@kali:~/Desktop# cat while05.sh 
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

root@kali:~/Desktop# bash while05.sh 
HTTP IS RUNNING 
HTTP IS RUNNING 
HTTP IS RUNNING 
HTTP IS RUNNING 
````

### 嵌套循环

````bash
# 打印99乘法表
root@kali:~/Desktop# vim nesting01.sh
root@kali:~/Desktop# cat nesting01.sh 
#!/bin/bash
for ((i=1;i<=9;i++))
do
        for ((j=1;j<=9;j++))
        do
                let "multi=$i*$j"
                echo -n "$i*$j=$multi "
        done
        echo
done
root@kali:~/Desktop# bash nesting01.sh 
1*1=1 1*2=2 1*3=3 1*4=4 1*5=5 1*6=6 1*7=7 1*8=8 1*9=9 
2*1=2 2*2=4 2*3=6 2*4=8 2*5=10 2*6=12 2*7=14 2*8=16 2*9=18 
3*1=3 3*2=6 3*3=9 3*4=12 3*5=15 3*6=18 3*7=21 3*8=24 3*9=27 
4*1=4 4*2=8 4*3=12 4*4=16 4*5=20 4*6=24 4*7=28 4*8=32 4*9=36 
5*1=5 5*2=10 5*3=15 5*4=20 5*5=25 5*6=30 5*7=35 5*8=40 5*9=45 
6*1=6 6*2=12 6*3=18 6*4=24 6*5=30 6*6=36 6*7=42 6*8=48 6*9=54 
7*1=7 7*2=14 7*3=21 7*4=28 7*5=35 7*6=42 7*7=49 7*8=56 7*9=63 
8*1=8 8*2=16 8*3=24 8*4=32 8*5=40 8*6=48 8*7=56 8*8=64 8*9=72 
9*1=9 9*2=18 9*3=27 9*4=36 9*5=45 9*6=54 9*7=63 9*8=72 9*9=81 
````

### while循环中的break 
````bash
# 去除重复
root@kali:~/Desktop# vim nesting02.sh 
root@kali:~/Desktop# cat nesting02.sh 
#!/bin/bash
for ((i=1;i<=9;i++))
do
        for ((j=1;j<=9;j++))
        do
                if [[ $j -le $i ]];then
                        let "multi=$i*$j"
                        echo -n "$i*$j=$multi "
                else
                        break
                fi
        done
        echo
done
root@kali:~/Desktop# bash nesting02.sh 
1*1=1 
2*1=2 2*2=4 
3*1=3 3*2=6 3*3=9 
4*1=4 4*2=8 4*3=12 4*4=16 
5*1=5 5*2=10 5*3=15 5*4=20 5*5=25 
6*1=6 6*2=12 6*3=18 6*4=24 6*5=30 6*6=36 
7*1=7 7*2=14 7*3=21 7*4=28 7*5=35 7*6=42 7*7=49 
8*1=8 8*2=16 8*3=24 8*4=32 8*5=40 8*6=48 8*7=56 8*8=64 
9*1=9 9*2=18 9*3=27 9*4=36 9*5=45 9*6=54 9*7=63 9*8=72 9*9=81 
````

###continue 用法
````bash
# 寻找100以内的素数
root@kali:~/Desktop# vim continue.01.sh
root@kali:~/Desktop# cat continue.01.sh 
#!/bin/bash
for ((i=1;j<=100;i++))
do
        for ((j=2;j<i;j++))
        do
                if !(($i%$j));then
                        continue 2
                fi
        done
        echo -n "$i "
done
echo
root@kali:~/Desktop# bash continue.01.sh 
1 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 
root@kali:~/Desktop# 

````






