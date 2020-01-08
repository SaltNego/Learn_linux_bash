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
