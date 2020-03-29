#!/bin/bash

#Database autoupdate

if [ ! -f /etc/cron.d/dbupdate ];
then
    cat > /etc/cron.d/dbupdate << EOF
#First  * - minute = 0-59
#Second * - hour = 0-23
#Third  * - day of month = 1-31
#Forth  * - month = 1-12
#Fifth  * - day of week = 0-7 (0 or 7 is Sun, or use names)

#<schedule> <user> <command for shell>

# Every day of every month update database at 12:00 a.m
0 12 * * * root cd /dz/kodutoo1/ && ./add.sh | xargs rrdtool update powerfails.rrd
EOF
fi
