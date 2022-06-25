#!/usr/bin/env bash

setup_file() {
    echo "Testing checkWork" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "Valid image" {
    bats_require_minimum_version 1.5.0
    run -0 checkWork /inputs/checkWork/SOURCE.tif
}

@test "Invalid image" {
    bats_require_minimum_version 1.5.0
    run -255 checkWork /inputs/checkWork/SLAB.tif
}
