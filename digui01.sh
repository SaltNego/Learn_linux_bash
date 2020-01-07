#!/bin/bash
declare -i count

checkoutCount(){
    read -p "Enter an count: " count
    if [ $count -eq 100 ]; then
        echo "Count is 100."
    else
        if [ $count -gt 100 ]; then
            echo "count is greater than 100."
        else
            echo "count is less than 100."
        fi
    fi
    checkoutCount
}
checkoutCount
