#!/usr/bin/env bash

setup_file() {
    echo "Testing composeNtiff" >&3
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

@test "Fail because of different dimension" {
    bats_require_minimum_version 1.13.0

    run $precommand composeNtiff -c jpg -s ../inputs/composeNtiff/nok/ -g 2 2 /tmp/test_nok_differentdimension.tif

    assert_failure
    assert_no_memory_leak
}

@test "Fail because of wrong grid size" {
    bats_require_minimum_version 1.13.0

    run $precommand composeNtiff -c jpg -s ../inputs/composeNtiff/ok/ -g 3 3 /tmp/test_nok_param.tif

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to compose image" {
    bats_require_minimum_version 1.13.0

    run $precommand composeNtiff -c zip -s ../inputs/composeNtiff/ok/ -g 2 2 /tmp/test_ok_scan1000.tif

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_nok_differentdimension.tif
    rm -f /tmp/test_nok_param.tif
    rm -f /tmp/test_ok_scan1000.tif
}