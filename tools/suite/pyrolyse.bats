#!/usr/bin/env bash

setup_file() {
    echo "Testing PYROLYSE" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "With perfs" {
    bats_require_minimum_version 1.5.0
    run -0 pyrolyse.pl --pyramid file:///pyramids/BDPARCELLAIRE.json --json /tmp/stats.json --slabs DATA --tiles DATA --perfs /tmp/perfs.txt
    wc -l /tmp/stats.json >&3
    wc -l /tmp/perfs.txt >&3
}

teardown_file() {
    rm -f /tmp/stats.json
    rm -f /tmp/perfs.txt
}
