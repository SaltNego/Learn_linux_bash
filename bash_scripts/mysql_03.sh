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


