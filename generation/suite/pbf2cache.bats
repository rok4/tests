#!/usr/bin/env bash

setup_file() {
    echo "Testing pbf2cache" >&3
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

@test "Fail because of grid definition" {
    bats_require_minimum_version 1.13.0

    run $precommand pbf2cache -r ../inputs/pbfs/ -t 3 -ultile 258 175 file:///tmp/test_nok_param.tif

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to package pbf tiles into a slab" {
    bats_require_minimum_version 1.13.0

    run $precommand  pbf2cache -r ../inputs/pbfs/ -t 3 3 -ultile 258 175 file:///tmp/test_ok_file_full.tif

    assert_success
    assert_no_memory_leak
}

@test "Succeed to package pbf tiles into a slab, with hole" {
    bats_require_minimum_version 1.13.0

    run $precommand pbf2cache -r ../inputs/pbfs/ -t 5 5 -ultile 257 174 file:///tmp/test_ok_file_hole.tif

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_nok_param.tif
    rm -f /tmp/test_ok_file_full.tif
    rm -f /tmp/test_ok_file_hole.tif
}
