#!/bin/bash
ps uax | awk '{ print $2, $11 }' | grep "/sbin/" | cut -d\  -f1 > $1
