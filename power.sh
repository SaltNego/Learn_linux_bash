#!/bin/bash
echo "Usage: bash $0 num1 num2 "
num3=0
let "num3=$1**$2"
echo "Response is :$num3"
