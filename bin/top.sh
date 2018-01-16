#!/bin/bash 

MEM=$(free | egrep Mem | awk '{print $1," " $2,"total,",$4," ""free,"," "$3,"used,",$6,"buff/cache,"}')
SWAP=$(free | egrep Swap | awk '{print $1, $2,"total,",$4,"free,","  "$3,"used,"}')

PID=$(ps -ao pid)
USER=$(ps -ao user)
CPU=$(ps -ao time)
COM=$(ps -ao command)



uptime
echo "Tasks: total, running, sleeping, stopped, zombie " 
echo "%Cpu(s): us, sy, ni, id, wa, hi, si, st " 
echo "$MEM"
echo "$SWAP"

echo "$PID $USER"

