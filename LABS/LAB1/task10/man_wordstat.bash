#!/bin/bash
#pages=$(man -k . | awk '{ print $1 }')
all_words=$(mktemp /tmp/man_wordstat.XXXXXX)
stat=$(mktemp /tmp/man_wordstat.XXXXXX)
pages='ls'
a=0
#total=$(man -k . | grep '.*' | wc -w)
total_pages=3
i=$(echo "$pages" | wc -w)
for page in $pages; do
    echo "'\n'$(man $page | sort -u)" >> "$all_words"
    b="$(man $page | sort -u | wc -w)"
    let a=$a+$b
    let i=$i+1
    echo "$a' '[$i/$total_pages]"
done
total_words="$(grep '.*' $all_words | sort -u | wc -w)"
j=0
for word in $(grep '.*' $all_words | sort -u); do
    if [[ "$(printf -- "$word" | wc -m)" -ge 4 ]]; then
        count=0
        i=0
        for page in $pages; do
            b="$(man $page | grep -- "$word" | wc -l)"
            let count=$count+$b
        done
        echo "$word $count" >> "$stat"
    fi
    let j=$j+1
    echo "[$j/$total_words] Word($word, len=$(printf -- "$word" | wc -m))"
done
echo "==============================================="
echo "Top 3 most common words (length >= 4):"
sort -k2 -gru $stat | head -n3
