#!/bin/bash
a="$(ps ua | awk '{ if ($1=="user") print $0 }')"
echo -n "" > $1
echo "$a" | wc -l >> $1
echo "$a" | awk '{ print $2 ":" $11 }' >> $1

