#!/bin/bash
CONTER=5
while [[ $CONTER -ge 0 ]]
do
	echo -n "$CONTER"
	let "CONTER-=1"

done
echo
