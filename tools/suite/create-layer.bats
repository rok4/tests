#!/usr/bin/env bash

setup_file() {
    echo "Testing CREATE-LAYER" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "Raster pyramid" {
    bats_require_minimum_version 1.5.0
    run -0 create-layer.pl --pyramid file:///pyramids/BDPARCELLAIRE.json
    echo "$output\n"
}
