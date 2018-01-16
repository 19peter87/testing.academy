#!/bin/env bash


TYPE=$(file --mime-type ${1} | cut -d' ' -f2)

case ${TYPE} in
    "application/x-gzip")
        gyz



FILE=${1}

if [[ $FILE = .zip ]],then
    unzip $FILE
fi
