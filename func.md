## 函数--Linux bash
### 定义函数

````bash

funciton FUNCTON_NAME(){
  command1 #函数体中可以有多个语句,不允许有空语句
  command2
  ...
}
#省略关键字function，效果一样
FUNCTION_NAME(){
  command1
  command2
  ...
}
````


````bash
majun@instance-zqtg07w6:~$ cat sayhello.sh
#!/bin/bash
function sayHello(){
        echo "hello!"
}
sayHello
majun@instance-zqtg07w6:~$ bash sayhello.sh
hello!
majun@instance-zqtg07w6:~$
````

````bash
majun@instance-zqtg07w6:~$ cat countLine.sh
#!/bin/bash
echo -n "Please input file_name:"
read FILE
function countLine(){
        local i=0
        while read line
        do
                let "i+=1"
        done<$FILE
        echo "$FILE have $i lines."
}
echo "begin"
countLine
majun@instance-zqtg07w6:~$ bash countLine.sh
Please input file_name:/etc/passwd
begin
/etc/passwd have 38 lines.
majun@instance-zqtg07w6:~$

````

### 函数的返回值


````bash
majun@instance-zqtg07w6:~$ cat check_file_exist.sh
#!/bin/bash
echo -n "Please input file name:"
read FILE

function checkfile(){
        if [ -f $FILE ];then
                return 0
        else
                return 1
        fi
}
echo "begin:::;"
checkfile
if [ $? -eq 1 ];then
        echo "file not exist;"
else
        echo "file exist!"
fi
majun@instance-zqtg07w6:~$ bash check_file_exist.sh
Please input file name:/etc/passwd
begin:::;
file exist!
majun@instance-zqtg07w6:~$ bash check_file_exist.sh
Please input file name:/eee
begin:::;
file not exist;
majun@instance-zqtg07w6:~$

````
````bash
majun@instance-zqtg07w6:~$ cat check_num.sh
#!/bin/bash

function checknum(){
        echo -n "Please input the num:"
        read NUM

        if [ $NUM -ge 0 -a $NUM -lt 10 ];then
                return 0
        fi
        if [ $NUM -ge 10 -a $NUM -lt 20 ];then
                return 1
        fi
        if [ $NUM -ge 20 -a $NUM -lt 30 ];then
                return 2
        fi

        return 3
}
echo "Call function $0"
checknum

RTV=$?
if [ $RTV -eq 0 ];then
        echo "The num between 0-10"
elif [ $RTV -eq 1 ];then
        echo "The num between 10-20"
elif [ $RTV -eq 2 ];then
        echo "The num between 20-30"
else
        echo "Unknown num !"
fi


majun@instance-zqtg07w6:~$ bash check_num.sh
Call function check_num.sh
Please input the num:22
The num between 20-30
majun@instance-zqtg07w6:~$ bash check_num.sh
Call function check_num.sh
Please input the num:99
Unknown num !
majun@instance-zqtg07w6:~$

````

### 带参数的函数

````bash
majun@instance-zqtg07w6:~$ cat power.sh
#!/bin/bash
echo "Usage: bash $0 num1 num2 "
num3=0
let "num3=$1**$2"
echo "Response is :$num3"
majun@instance-zqtg07w6:~$ bash power.sh 3 3
Usage: bash power.sh num1 num2
Response is :27
majun@instance-zqtg07w6:~$
````

### 自定义函数库

````bash
majun@instance-zqtg07w6:~$ cat lib01.sh
#!/bin/bash
_checkfile(){
        if [ -f $1 ];then
                echo "File : $1 is exist"
        else
                echo "File : $1 is not exist"
        fi
}

majun@instance-zqtg07w6:~$ cat calllib01.sh
#!/bin/bash
source ./lib01.sh
_checkfile /etc/passwd
_checkfile /etc/pass
majun@instance-zqtg07w6:~$ bash calllib01.sh
File : /etc/passwd is exist
File : /etc/pass is not exist
majun@instance-zqtg07w6:~$
````


所有的练习脚本都在：
[https://github.com/SaltNego/Learn_linux_bash](https://github.com/SaltNego/Learn_linux_bash)