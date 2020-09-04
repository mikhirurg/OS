#!/bin/bash
read string
data=$string
while [[ $string != q ]]; do
    read string
    data=$data$string
done
echo $data
