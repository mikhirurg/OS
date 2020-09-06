#!/bin/bash
all_words=$(mktemp /tmp/man_wordstat.XXXXXX)
stat=$(mktemp /tmp/man_wordstat.XXXXXX)

a=0
echo "$(man bash | tr -s '[:space:]' | sed 's/\s/\n/g' | sort -u | awk '{ if (length($1) > 3) print }')" >> "$all_words"
total_words="$(grep '.*' $all_words | wc -w)"
j=0
for word in $(grep '.*' $all_words); do
    count=0
    b="$(man bash | grep -- "$word" | wc -l)"
    let count=$count+$b
    echo "$word $count" >> "$stat"
    let j=$j+1
    echo "[$j/$total_words] Word($word, len=$(printf -- "$word" | wc -m))"
done
echo "==============================================="
echo "Top 3 most common words in \"man bash\" (length >= 4):"
sort -k2 -gru $stat | head -n3
