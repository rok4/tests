#!/usr/bin/env bash

setup_file() {
    echo "Testing overlayNtiff" >&3
}

setup() {
    load 'test_helper/bats-support/load.bash'
    load 'test_helper/bats-assert/load.bash'
    load 'test_helper/bats-file/load.bash'
    load 'test_helper/bats-file/load.bash'
    load 'common/load.bash'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"

    if [[ ! -z $VALGRIND_ANALYSIS ]]; then
        precommand="valgrind --leak-check=full"
    else 
        precommand=""
    fi
}

@test "Fail because of wrong input" {
    bats_require_minimum_version 1.13.0

    run $precommand overlayNtiff -f ../inputs/overlayNtiff/conf.txt -m ALPHATOP -s 2 -c zip -p rgb -t 255,255,255 -b 255

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to reproject images into 4326" {
    bats_require_minimum_version 1.13.0

    run $precommand overlayNtiff -f ../inputs/overlayNtiff/conf.txt -m ALPHATOP -s 4 -c zip -p rgb -t 255,255,255 -b 255,0,0,100

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_ok_alphatop.tif
}