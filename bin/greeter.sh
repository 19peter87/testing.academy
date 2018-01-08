#!/bin/bash

# ak je pocet parametrov > 1, skonci
if [[ $# -gt 1 ]]; then
    echo "Nespravny pocet parametrov" 1>&2
    exit 1
fi

# ak je spusteny prave s jednym parametrom
if [[ $# -eq 1 ]]; then
    HOUR=$1
    else
    HOUR=$(date +%k)
    #read -p "kolko je hodin, $USER?" HOUR
fi

if [[ $HOUR -lt 8 ]]; then
    echo "dobre rano, $USER"
elif [[ $HOUR -lt 18 ]]; then
    echo "dobry den, $USER"
else
    echo "dobry vecer, $USER"
fi

