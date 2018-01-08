#!/bin/bash

myslim_na=linux

echo "Hadaj  na co  myslim!"
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
