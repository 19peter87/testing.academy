#!/bin/bash

myslim_na=linux


dialog --title "Hadaj na co myslim" --inputbox "Zadaj svoj typ:" 8 30 "       " 2> /tmp/name


dialog --hadaj na co myslim 5 20
read  tip
while [ "$tip" != "$myslim_na" ]
do
if [ "$tip" != "$myslim_na" ]
then
echo "Zly  tip. Skus  znova."
fi
read  tip
done
echo "Vyborne  uhadol  si!"
