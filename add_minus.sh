#!/bin/bash
Add_01=10
Add_02=10
let "Add_03=(++Add_01)"
let "Add_04=(Add_02++)"
echo "add01:$Add_01"
echo "add02:$Add_02"
echo "add03:$Add_03"
echo "add04:$Add_04"
