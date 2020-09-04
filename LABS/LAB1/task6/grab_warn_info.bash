#!/bin/bash
grep -E '\[( )*[0-9]*.[0-9]*\] \((II|WW)\)' /var/log/anaconda/X.log | \
sed 's/(II)/Information:/' | \
sed 's/(WW)/Warning:/' | \
sort -k3 -r > full.log
