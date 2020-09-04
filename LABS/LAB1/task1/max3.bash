#!/bin/bash
a=$1
b=$2
c=$3
if [[ "$a" -gt "$b" ]]; then 
    if [[ "$a" -gt "$c" ]]; then
        echo $a
    else
        echo $c
    fi
else 
    if [[ "$b" -gt "$c" ]]; then 
        echo $b
    else 
        echo $c
    fi
fi
