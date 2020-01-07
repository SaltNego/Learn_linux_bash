#!/bin/bash
declare N

echo "which one do u want"
echo -n "which (input):"
read N

echo "$((N*12)) candy in box!"

read -p "which (input):" N
echo $N
