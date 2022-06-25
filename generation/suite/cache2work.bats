#!/usr/bin/env bash

setup_file() {
    echo "Testing cache2Work" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "Fail because of wrong compression" {
    bats_require_minimum_version 1.5.0
    run -255 cache2work -c toto /inputs/cache2work/ORTHOHR.tif /tmp/test_nok_param.tif
}

@test "Fail when input is not a slab" {
    bats_require_minimum_version 1.5.0
    run -1 cache2work -c zip /inputs/cache2work/NOTASLAB.tif /tmp/test_nok_notaslab.tif
}

@test "Succeed to untile a RGB image" {
    bats_require_minimum_version 1.5.0
    run -0 cache2work -c zip /inputs/cache2work/ORTHOHR.tif /tmp/test_ok_orthohr.tif
}

teardown_file() {
    rm -f /tmp/test_nok_notaslab.tif
    rm -f /tmp/test_nok_param.tif
    rm -f /tmp/test_ok_orthohr.tif
}