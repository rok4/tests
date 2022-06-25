#!/usr/bin/env bash

setup_file() {
    echo "Testing SUP-PYR" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "Full" {
    bats_require_minimum_version 1.5.0
    ls -l /pyramids >&3
    run -0 sup-pyr.pl --pyramid file:///pyramids/SCAN1000.json --full --stop
    ls -l /pyramids >&3
}
