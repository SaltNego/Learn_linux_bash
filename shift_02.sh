#!/bin/bash
until [ -z "$1" ]
do
	echo "$*"
	shift
done
