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
