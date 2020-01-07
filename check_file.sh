#!/bin/bash
echo -n "input your file:"
read FILE
#FILE=/etc/passwd
if [ -e $FILE ]; then
	echo "$FILE exists."
else
	echo "$FILE NOT EXISTS."
fi
