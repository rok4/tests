#!/usr/bin/env bash

setup_file() {
    echo "Testing checkWork" >&3
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

@test "Valid image" {
    bats_require_minimum_version 1.13.0

    run $precommand checkWork ../inputs/checkWork/SOURCE.tif

    assert_success
    assert_no_memory_leak
}
