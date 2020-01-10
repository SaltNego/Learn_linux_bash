## 使用脚本操作mysql数据库

### 非交互执行sql语句

````bash
ubuntu@VM-0-13-ubuntu:~$ mysql -uroot -pwen1053431697 -e "show databases"
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| CHT                |
| dvwa               |
| metinfo6           |
| mysql              |
| performance_schema |
| sys                |
| typecho            |
| vbforum            |
+--------------------+
ubuntu@VM-0-13-ubuntu:~$ ls
1.pcap  exp.exe  IMG_20190806_205146.jpg  portlistener.py  pwn  readme.zip  shell1.jar  ssh.log  START  test.apk  vbflask.py  WiNUIlsF.html
ubuntu@VM-0-13-ubuntu:~$ mkdir tmp && cd tmp
ubuntu@VM-0-13-ubuntu:~/tmp$ vim mysql_01.sh
ubuntu@VM-0-13-ubuntu:~/tmp$ cat mysql_01.sh
#!/bin/bash
HOSTNAME="localhost"
USERNAME="root"
PASSWORD="wen1053431697"
MYSQL=/usr/bin/mysql
SH_DB="show databases"
$MYSQL -u$USERNAME -p$PASSWORD -e "$SH_DB"
ubuntu@VM-0-13-ubuntu:~/tmp$ bash mysql_01.sh
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| CHT                |
| dvwa               |
| metinfo6           |
| mysql              |
| performance_schema |
| sys                |
| typecho            |
| vbforum            |
+--------------------+
ubuntu@VM-0-13-ubuntu:~/tmp$
````

### Linux shell执行sql语句


````bash
ubuntu@VM-0-13-ubuntu:~/tmp$ cat mysql_02.sh
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
ubuntu@VM-0-13-ubuntu:~/tmp$ bash mysql_02.sh
Please input your sql :show databases
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| CHT                |
| dvwa               |
| metinfo6           |
| mysql              |
| performance_schema |
| sys                |
| typecho            |
| vbforum            |
+--------------------+
Please input your sql :use dvwa
mysql: [Warning] Using a password on the command line interface can be insecure.
Please input your sql :show tables
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1046 (3D000) at line 1: No database selected
Please input your sql :use dvwa;show tables
mysql: [Warning] Using a password on the command line interface can be insecure.
+----------------+
| Tables_in_dvwa |
+----------------+
| guestbook      |
| users          |
+----------------+
Please input your sql :
````

mysql基本语法：
https://www.cnblogs.com/directiones/p/mysql.html


### 使用here document批量执行sql

````bash
ubuntu@VM-0-13-ubuntu:~/tmp$ cat mysql_03.sh
#!/bin/bash
USERNAME="root"
PASSWORD="wen1053431697"
MYSQL=/usr/bin/mysql
$MYSQL -u$USERNAME -p$PASSWORD  << EOF
create database bashDB01;
use bashDB01;
create table user
(
userid int(20) NOT NULL AUTO_INCREMENT,
username varchar(20),
userpass varchar(40),
age int(20),
primary key(userid)
);

select group_concat(column_name) from information_schema.columns where table_schema='bashDB01' and table_name='user';
EOF


ubuntu@VM-0-13-ubuntu:~/tmp$ vim mysql_03.sh
ubuntu@VM-0-13-ubuntu:~/tmp$ bash mysql_03.sh
mysql: [Warning] Using a password on the command line interface can be insecure.
group_concat(column_name)
userid,username,userpass,age

````
### 使用管道和重定向符执行mysql代码块

````bash
ubuntu@VM-0-13-ubuntu:~/tmp$ mysql -uroot -ppassword < update.sql
ubuntu@VM-0-13-ubuntu:~/tmp$ cat update.sql | mysql -uroot -ppassword
````
