#!/usr/bin/env bash

#test suite setup
TESTDIR=testing
mkdir ${TESTDIR} $$ cd ${TESTDIR} || exit 1

#ak zadam priecinok, tak je vytvoreny
#"when I create folder, then folder is created"

# test setup
DIR=diry
mkdir {DIR}
mkdir {DIR} && [[ -d {DIR} ]] && [[ $( ls -a {DIR} | wc -l ) -eq 2 ]]  && echo passed || echo failed
# test teardown
rmdir {DIR}

#ak zadam priecinok kt. uz existuje, tak vypise chybu

# test setup
DIR=dirx
mkdir ${DIR}
[[ $(mkdir ${DIR} 2>&1) = "mkdir: cannot create directory 'xxx' : File exists" ]] || echo failed: when new folder with existing name is going to be created then error message is shown
#test teardown
rmdir ${DIR}
