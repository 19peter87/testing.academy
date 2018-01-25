#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

setup() {
    export DIR=$(mktemp -du)
}

teardown() {
    rm -rf "$DIR"
}

@test "when new folder with existing name is going to be created then error message is shown" {
    mkdir "$DIR"
    run mkdir "$DIR"
    assert_equal "$output" "mkdir: cannot create directory ‘${DIR}’: File exists"
}


@test "when new folder with existing name is going to be created then exit with status 1" {
    mkdir "$DIR"
    run mkdir "$DIR"
    assert_equal "$status" 1
}
 
@test "when new folder is created, then exit status is 0" {
    run mkdir "$DIR"
    assert_equal "$status" 0
}

@test "when new folder is created, then it is empty" {
    mkdir "$DIR"
    assert_equal $(ls -a ${DIR} | wc -l) 2 # test, if newly created folder is empty
}

@test "when unknown option is given, then error message is shown" {
    run mkdir -x
    assert_equal "$output" "mkdir: invalid option -- 'x'
Try 'mkdir --help' for more information."
}


@test "when folder name is too long, then error message is shown" {
    long_name=$(cat /dev/urandom | tr -dc a-z0-9 | head -c $(getconf NAME_MAX /tmp))
    dir="$(mktemp -du)$long_name"
    run mkdir $dir
    assert_equal "$output" "mkdir: cannot create directory ‘$dir‘: File name too long"
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



