#!/bin/bash
files=$(ls /var/log/ | grep -o '.*\.log' | uniq)
count=0
for file in $files; do
    if [ -r "/var/log/$file" ]; then
        let count=$count+$(awk '{ print $0 }' /var/log/$file | wc -l)
    fi
done
echo $count
