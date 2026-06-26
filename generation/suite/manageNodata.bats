#!/usr/bin/env bash

setup_file() {
    echo "Testing manageNodata" >&3
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

@test "Fail because of wrong data new color" {
    bats_require_minimum_version 1.13.0

    run $precommand manageNodata -target 255,255,255 -touch-edges -data 254,254 ../inputs/manageNodata/base.tif /tmp/test_nok_param.tif -channels 3 -format uint8

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to generate mask from image" {
    bats_require_minimum_version 1.13.0

    run $precommand manageNodata -target 255,255,255 ../inputs/manageNodata/base.png -mask-out /tmp/test_ok_mask.tif -channels 3 -format uint8

    assert_success
    assert_no_memory_leak
}

@test "Succeed to generate mask from image spreading from edges" {
    bats_require_minimum_version 1.13.0

    run $precommand manageNodata -target 255,255,255 -touch-edges ../inputs/manageNodata/base.png -mask-out /tmp/test_ok_mask_touchedges.tif -channels 3 -format uint8

    assert_success
    assert_no_memory_leak
}

@test "Succeed to modify data and nodata color in input image" {
    bats_require_minimum_version 1.13.0

    run $precommand manageNodata -target 255,255,255 -touch-edges -data 255,0,0 -nodata 200,200,255 ../inputs/manageNodata/base.png /tmp/test_ok_data_nodata.tif -channels 3 -format uint8

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_nok_param.tif
    rm -f /tmp/test_ok_mask.tif
    rm -f /tmp/test_ok_mask_touchedges.tif
    rm -f /tmp/test_ok_data_nodata.tif
}