#!/bin/bash
max="0"
for pid in $(ps uax | awk 'FNR > 1 { print $2 } '); do	
    if [[ -r /proc/$pid/status ]]; then
	a="$(grep -i "VMRSS" /proc/$pid/status | awk '{ print $2 }')"
	if [[ "$a" -ne "" ]]; then
            if [[ "$a" -gt "$max" ]]; then
                ans=$pid
                max=$a
	    fi
        fi
    fi
done
echo "Process_PID: "$ans" Memory: "$max
