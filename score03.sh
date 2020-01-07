#!/bin/bash
echo -n "Please input your score:"
read SCORE
if [ "$SCORE" -lt 60 ]; then
	echo "CCCCCCCC"
elif [ "$SCORE" -ge 60 -a "$SCORE" -lt 80 ]; then
	echo "BBBBBBBB"
else
	echo "AAAAAAAA"
fi
