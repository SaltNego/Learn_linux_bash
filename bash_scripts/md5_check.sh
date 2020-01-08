#!/bin/bash
DIRS='/tmp/csdn /home/majun/bash_scripts'
FIND=/usr/bin/find
MD5SUM=/usr/bin/md5sum
MD5_FILE="all_file.md5"

$FIND $DIRS -type f | while read line
	do $MD5SUM $line >> $MD5_FILE
done
