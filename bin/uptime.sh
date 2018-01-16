#!/bin/bash


HOUR=$(date | awk '{print $4}')


UPTIME=$(cut -f1 -d' ' /proc/uptime:)
DAYS=$(echo $UPTIME/60/60/24 | bc)
HOURS=$(echo "($UPTIME/60/60)%24" | bc)
MINS=$(echo "($UPTIME/60)%60" | bc)
SECS=$(echo "($UPTIME)%60" | bc)





UPTIME=$(cut -f1 -d' ' /proc/uptime)

DAYS=(echo "($UPTIME/60/60)%24 | bc)


echo "$HOUR $UPTIME $USER $LOADAV"

