#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'


@test "when new folder with existing name is going to be created then error message is shown" {
    # setup
    DIR=$(mktemp -d)
    
    run mkdir "$DIR"
    assert_equal "$output" "mkdir: cannot create directory ‘${DIR}’: File exists"
 
    # teardown
    rmdir ${DIR}
}
 
@test "when i create new folder then folder is created" {
 
    # setup
    DIR=diry
    mkdir ${DIR}
 
    [[ -d ${DIR} ]] # test if new folder exitsts
 
    # teardown
    rmdir ${DIR} 
}

@test "when i create new folder then folder is empty" {
    # setup
    DIR=diry
    mkdir ${DIR}

    [[ $(ls -a ${DIR} | wc -l) -eq 2 ]] # test, if new folder is empty

    # teardown
    rmdir ${DIR}
}

@test "when i dont say name then report" {
    # setup
 
    mkdir || [[ $(mkdir ${DIR} 2>&1) = "mkdir: missing operand
Try 'mkdir --help' for more information." ]] # test, if no read 
}

