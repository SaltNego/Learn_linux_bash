## expect自动化操作ftp
### 安装expect(不预装)

````bash
root@instance-zqtg07w6:/home/majun/bash_scripts# expect
The program 'expect' is currently not installed. You can install it by typing:
apt install expect
root@instance-zqtg07w6:/home/majun/bash_scripts# apt install expect
Reading package lists... Done
Building dependency tree
Reading state information... Done
````

### 安装ftp环境

我使用的是phpstudy ftp程序

![](https://raw.githubusercontent.com/SaltNego/MarkdownPics/master/image/20200108094132.png)

![](https://raw.githubusercontent.com/SaltNego/MarkdownPics/master/image/20200108095010.png)

#### 测试登录
````bash
root@Righteous:~# ftp 192.168.1.107
Connected to 192.168.1.107.
Name (192.168.1.107:root): test1
331 Password required for test1.
Password:
230 User test1 logged in.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> dir
200 Port command successful.
150 Opening data connection for directory list.
drw-rw-rw-   1 ftp      ftp            0 Jan 08 09:56 .
drw-rw-rw-   1 ftp      ftp            0 Jan 08 09:56 ..
-rw-rw-rw-   1 ftp      ftp     15214169 Jun 28  2019 20190628193912.mp4
-rw-rw-rw-   1 ftp      ftp          749 Jan 08 09:56 password.txt
226 File sent ok
ftp> !

````
Linux expect 用法：
[https://blog.csdn.net/catoop/article/details/48289991](https://blog.csdn.net/catoop/article/details/48289991)

### 脚本


````bash
root@Righteous:/tmp/tmp# vim expect_ftp_download.sh
root@Righteous:/tmp/tmp# which expect
/usr/bin/expect
root@Righteous:/tmp/tmp# vim expect_ftp_download.sh

````

**注意expect脚本不能用bash来执行，chmod +x expect.sh，添加执行权限然后./expect.sh执行即可**
![](https://raw.githubusercontent.com/SaltNego/MarkdownPics/master/image/20200108121659.png)

````bash
root@Righteous:/tmp/tmp# vim expect_ftp_download.sh
root@Righteous:/tmp/tmp# cat expect_ftp_download.sh
#!/usr/bin/expect -f
set ip [lindex $argv 0 ]
set file [lindex $argv 1]
set timeout 10
spawn ftp $ip
expect "Name*"
send "test1\r"
expect "Password*"
send "test1\r"
expect "ftp>"
send "get $file\r"
expect {
"*bytes received*" { send_user "Download file success!\r";send "bye\r"}
"*File not found*" { send_user "Download file Failed!\r";send "bye\r"}
}

expect eof
````

````bash
root@Righteous:/tmp/tmp# ./expect_ftp_download.sh 192.168.1.107 password
spawn ftp 192.168.1.107
Connected to 192.168.1.107.
220-FileZilla Server version 0.9.41 beta
220 phpSudy Ftp server
Name (192.168.1.107:root): test1
331 Password required for test1
Password:
230 Logged on
Remote system type is UNIX.
ftp> get password
local: password remote: password
200 Port command successful
550 File not found
ftp> bye file Failed!
221 Goodbye
root@Righteous:/tmp/tmp# ./expect_ftp_download.sh 192.168.1.107 password.txt
spawn ftp 192.168.1.107
Connected to 192.168.1.107.
220-FileZilla Server version 0.9.41 beta
220 phpSudy Ftp server
Name (192.168.1.107:root): test1
331 Password required for test1
Password:
230 Logged on
Remote system type is UNIX.
ftp> get password.txt
local: password.txt remote: password.txt
200 Port command successful
150 Opening data channel for file transfer.
226 Transfer OK
749 bytes received in 0.00 secs (1.8997 MB/s)
bye> Download file success!
221 Goodbye
root@Righteous:/tmp/tmp#

```