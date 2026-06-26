#!/usr/bin/env bash

setup_file() {
    echo "Testing decimateNtiff" >&3
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

@test "Fail because of not compatible input images" {
    bats_require_minimum_version 1.13.0

    run $precommand decimateNtiff -f ../inputs/decimateNtiff/nok/conf.txt -n 255,0,0 -c zip

    assert_failure
    assert_no_memory_leak
}

@test "Fail because of wrong nodata colour (not enough value)" {
    bats_require_minimum_version 1.13.0

    run $precommand decimateNtiff -f ../inputs/decimateNtiff/ok/conf.txt -n 255,0 -c zip

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to decimate image" {
    bats_require_minimum_version 1.13.0

    run $precommand decimateNtiff -f ../inputs/decimateNtiff/ok/conf_bg.txt -n 255,0,0 -c zip

    assert_success
    assert_no_memory_leak
}

@test "Succeed to decimate image with conversion" {
    bats_require_minimum_version 1.13.0

    run $precommand decimateNtiff -f ../inputs/decimateNtiff/ok/conf.txt -n 255 -c zip -a uint8 -s 1

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_ok_scan1000_conversion_i.tif
    rm -f /tmp/test_ok_scan1000_conversion_m.tif
    rm -f /tmp/test_ok_scan1000_bg_i.tif
    rm -f /tmp/test_nok_compatible.tif
}