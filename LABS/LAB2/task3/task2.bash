#!/bin/bash
ps ax o ppid,pid --sort=start_time | sed "/\ \+\($$\|$PPID\).*/d" | tail -n1 | awk '{ print $2 }'

