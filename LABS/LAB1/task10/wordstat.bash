#!/bin/bash
echo "Top 3 common words in \"man bash\" (length >= 4): "
man bash | \
sed 's/[\ \n\t]\+/\n/g'| \
awk '{ if (length($0) >= 4) print }' |  \
awk '{ 
     stat[$0]++
     }
     END { 
     for (var in stat) 
         print var, stat[var]
     }' | \
sort -k2 -nr | \
head -n3
