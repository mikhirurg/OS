#!/bin/bash
awk '{ print $0 }' /var/log/*.log | wc -l
