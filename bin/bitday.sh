#!/usr/bin/env bash

HOUR=$(date +%k)
NR=12


if [[ $HOUR -ge 0 ]] && [[ $HOUR -lt 2 ]]; then
    NR=11
elif [[ $HOUR -ge 2 ]] && [[ $HOUR -lt 4 ]]; then
    NR=12 
elif [[ $HOUR -ge 4 ]] && [[ $HOUR -lt 6 ]]; then
    NR=1   
elif [[ $HOUR -ge 6 ]] && [[ $HOUR -lt 8 ]]; then
    NR=2   
elif [[ $HOUR -ge 8 ]] && [[ $HOUR -lt 10 ]]; then 
    NR=3   
elif [[ $HOUR -ge 10 ]] && [[ $HOUR -lt 12 ]]; then
    NR=4   
elif [[ $HOUR -ge 12 ]] && [[ $HOUR -lt 14 ]]; then
    NR=5   
elif [[ $HOUR -ge 14 ]] && [[ $HOUR -lt 16 ]]; then
    NR=6   
elif [[ $HOUR -ge 16 ]] && [[ $HOUR -lt 18 ]]; then 
    NR=7  
elif [[ $HOUR -ge 18 ]] && [[ $HOUR -lt 20 ]]; then
    NR=8   
elif [[ $HOUR -ge 20 ]] && [[ $HOUR -lt 22 ]]; then
    NR=9   
elif [[ $HOUR -ge 22 ]] && [[ $HOUR -lt 00 ]]; then 
    NR=10
   
fi   

echo "/home/apollo-1/Pictures/bitday/bitday$NR.png"
gsettings set org.gnome.desktop.background \
   picture-uri "/home/apollo-1/Pictures/bitday/bitday$NR.png"


