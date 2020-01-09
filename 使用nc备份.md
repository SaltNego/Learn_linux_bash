## 使用nc定时备份

### 使用nc进行端口扫描

![](https://raw.githubusercontent.com/SaltNego/MarkdownPics/master/image/20200109100715.png)

````bash
C:\Users\Negoowen
$ nmap -sP 192.168.1.0/24
# 扫描存活主机
Starting Nmap 7.60 ( https://nmap.org ) at 2020-01-09 10:03 ?D1ú±ê×?ê±??
Nmap scan report for 192.168.1.1
Host is up (0.00s latency).
MAC Address: 48:0E:EC:76:4B:D0 (Tp-link Technologies)
Nmap scan report for 192.168.1.100
Host is up (0.031s latency).
MAC Address: 94:87:E0:05:75:30 (Unknown)
Nmap scan report for 192.168.1.106
Host is up (0.015s latency).
MAC Address: 9C:B6:D0:E0:9A:D7 (Rivet Networks)
Nmap scan report for 192.168.1.107
Host is up.
Nmap done: 256 IP addresses (4 hosts up) scanned in 19.30 seconds

C:\Users\Negoowen
$ nc -z -v -n 192.168.1.1 20-25
# 扫描路由器的20-25端口
(UNKNOWN) [192.168.1.1] 25 (?) open
(UNKNOWN) [192.168.1.1] 24 (?): TIMEDOUT
(UNKNOWN) [192.168.1.1] 23 (?): TIMEDOUT
(UNKNOWN) [192.168.1.1] 22 (?): TIMEDOUT
(UNKNOWN) [192.168.1.1] 21 (?): TIMEDOUT
(UNKNOWN) [192.168.1.1] 20 (?): TIMEDOUT

C:\Users\Negoowen
# 扫描路由器的80端口
$ nc -z -v -n 192.168.1.1 80-81
(UNKNOWN) [192.168.1.1] 81 (?): TIMEDOUT
(UNKNOWN) [192.168.1.1] 80 (?) open
````

### nc传输文件
之前提到过如何使用nc传输文件、文件夹
[https://blog.csdn.net/yiqiushi4748/article/details/103186855](https://blog.csdn.net/yiqiushi4748/article/details/103186855)


### 备份磁盘分区
````bash
# 接收端
majun@instance-zqtg07w6:~$ nc -l 1234 | dd of=./sda1.img
^C0+0 records in
0+0 records out
0 bytes copied, 1.62676 s, 0.0 kB/s
# 发送端
majun@instance-zqtg07w6:~$ dd if=/dev/sda1 | nc 192.168.1.107 1234

````

### 定时从服务器A备份文件至服务器B

> 接收端

````bash
majun@instance-zqtg07w6:~/bash_scripts$ cat server_nc.sh
#!/bin/bash
NC=/bin/nc
TIMETAMP=`data +%Y%m%d%H%M%S`
PORT=1234
$NC -l $PORT > backup.$TIMETAMP.tgz
majun@instance-zqtg07w6:~/bash_scripts$ chmod +x server_nc.sh
majun@instance-zqtg07w6:~/bash_scripts$ crontab -l
# Edit this file to introduce tasks to be run by cron.
#m h  dom mon dow   command
0 1 * * * /home/majun/bash_scripts/server_nc.sh
majun@instance-zqtg07w6:~/bash_scripts$
````
> 发送端

````bash
majun@instance-zqtg07w6:~/bash_scripts$ vim clint_nc.sh
majun@instance-zqtg07w6:~/bash_scripts$ cat clint_nc.sh
#!/bin/bash
NC=/bin/nc
TAR=/bin/tar
BACKUP_DIR=/tmp
PORT=1234
SERVER_IP=192.168.1.107
$TAR -zvcf - $BACKUP_DIR | $NC $SERVER_IP $PORT

majun@instance-zqtg07w6:~/bash_scripts$ chmod +x clint_nc.sh
majun@instance-zqtg07w6:~/bash_scripts$ crontab -e
crontab: installing new crontab
majun@instance-zqtg07w6:~/bash_scripts$ crontab -l
# Edit this file to introduce tasks to be run by cron.
# For more information see the manual pages of crontab(5) and cron(8)
#
#m h  dom mon dow   command
1 1 * * * /home/majun/bash_scripts/client_nc.sh
majun@instance-zqtg07w6:~/bash_scripts$
````

**Ps：两台机器的时间一定要同步才可以。**