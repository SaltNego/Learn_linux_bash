
## 自动登录ftp备份 --Linux bash

### 启动ftp服务

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1NhbHROZWdvL01hcmtkb3duUGljcy9tYXN0ZXIvaW1hZ2UvMjAyMDAxMDgxNTMwMjEucG5n?x-oss-process=image/format,png)


### 备份脚本
````bash
root@Righteous:/tmp/tmp# cat auto_bak_ftp.sh
#!/bin/bash
GET_FILENAME="20190628193912.mp4"
SERVER_IP="192.168.1.107"
USER="test1"
PASSWD="test1"
FTP=/usr/bin/ftp

$FTP -n $SERVER_IP << EOF
quote USER $USER
quote PASS $PASSWD
binary
get $GET_FILENAME
mkdir upload
cd upload
put $GET_FILENAME

EOF
````

### 运行实例
````bash
root@Righteous:/tmp/tmp# chmod +x auto_bak_ftp.sh
root@Righteous:/tmp/tmp# bash auto_bak_ftp.sh
Directory already exists
Permission denied
root@Righteous:/tmp/tmp# ls
20190628193912.mp4  auto_bak_ftp.sh  expect_ftp_download.sh  password.txt
root@Righteous:/tmp/tmp# ls -al
总用量 14880
drwxr-xr-x  2 root root     4096 11月 22 22:57 .
drwxrwxrwt 10 root root     4096 11月 22 22:57 ..
-rw-r--r--  1 root root 15214169 11月 22 22:57 20190628193912.mp4
-rwxr-xr-x  1 root root      251 11月 22 22:56 auto_bak_ftp.sh
-rwxr-xr-x  1 root root      364 11月 22 22:35 expect_ftp_download.sh
-rw-r--r--  1 root root      731 11月 22 22:36 password.txt
root@Righteous:/tmp/tmp# rm 20190628193912.mp4
root@Righteous:/tmp/tmp# ls
auto_bak_ftp.sh  expect_ftp_download.sh  password.txt
root@Righteous:/tmp/tmp# bash auto_bak_ftp.sh
root@Righteous:/tmp/tmp# ls -al
总用量 14880
drwxr-xr-x  2 root root     4096 11月 22 22:59 .
drwxrwxrwt 10 root root     4096 11月 22 22:59 ..
-rw-r--r--  1 root root 15214169 11月 22 22:59 20190628193912.mp4
-rwxr-xr-x  1 root root      251 11月 22 22:56 auto_bak_ftp.sh
-rwxr-xr-x  1 root root      364 11月 22 22:35 expect_ftp_download.sh
-rw-r--r--  1 root root      731 11月 22 22:36 password.txt

root@Righteous:/tmp/tmp#
````

### 验证
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1NhbHROZWdvL01hcmtkb3duUGljcy9tYXN0ZXIvaW1hZ2UvMjAyMDAxMDgxNjA2MjUucG5n?x-oss-process=image/format,png)

> 所有的练习脚本都在：
[https://github.com/SaltNego/Learn_linux_bash](https://github.com/SaltNego/Learn_linux_bash)