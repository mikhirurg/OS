#!/bin/bash
sed 's/\([a-zA-Z0-9\-]*\):\([^:]*\):\([0-9]*\).*/\1 \3/' /etc/passwd | \
sort -g -k2 | \
sed 's/\([a-zA-Z0-9\-]*\)\s\([0-9]*\).*/Username:"\1", UID:"\2"/'