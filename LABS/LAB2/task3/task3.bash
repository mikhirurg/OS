#!/bin/bash
ps ax o pid,ppid --sort=start_time | awk -v pid=$$ -v ppid=$PPID '{ if ($2 != pid && $2 != ppid) print $0 }' | tail -n1 | awk '{ print $1 }'
