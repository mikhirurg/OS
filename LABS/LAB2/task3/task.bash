#!/bin/bash
ps ax o pid --sort=start_time | awk '{ data[NR] = $0 } END{ print data[NR-3] }'
