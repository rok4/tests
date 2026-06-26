#!/usr/bin/env bash

setup_file() {
    echo "Testing mergeNtiff" >&3
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

@test "Fail because of wrong input" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_nok_/inputs.txt -c zip -i lanczos -n 0,0,255

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to reproject images into 4326" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_4326.txt -r ../inputs/mergeNtiff/ -c zip -i lanczos -n 255,0 -a uint8 -s 2

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject and convert input images" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_conversion.txt -c zip -i lanczos -n 255,255,255,0 -a uint8 -s 4

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images using an input mask" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_mask.txt -r ../inputs/mergeNtiff/ -c zip -i lanczos -n 0,0,255

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images and apply a slope style with a palette" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/pente_with_palette.json -c zip -i lanczos -n -255,0,0,100

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images and apply a slope style without a palette" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/pente.json -c zip -i lanczos -n -255,0,0,100

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images and apply a estompage style with a palette" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/estompage_with_palette.json -c zip -i lanczos -n -255,0,0,100

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images and apply a estompage style without a palette" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/estompage.json -c zip -i lanczos -n -255,0,0,100

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images and apply a aspect style with a palette" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/aspect_with_palette.json -c zip -i lanczos -n -255,0,0,100

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images and apply a aspect style without a palette" {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/aspect.json -c zip -i lanczos -n -255,0,0,100

    assert_success
    assert_no_memory_leak
}

@test "Succeed to reproject images and apply a terrainrgb style " {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/terrainrgb.json -c zip -i lanczos -n -255,0,0,100

    assert_success
    assert_no_memory_leak
}

@test "Fail because of terrainrgb and palette not compatibles " {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/terrainrgb_with_palette.json -c zip -i lanczos -n -255,0,0,100

    assert_failure
}

@test "Succeed to reproject images and apply a colorize style " {
    bats_require_minimum_version 1.13.0

    run $precommand mergeNtiff -f ../inputs/mergeNtiff/conf_colorize.txt -p ../inputs/mergeNtiff/colorize.json -c zip -i lanczos -n -255,255,255,0

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_ok_colorize.tif
    rm -f /tmp/test_ok_style.tif
    rm -f /tmp/test_ok_mask_i.tif
    rm -f /tmp/test_ok_mask_m.tif
    rm -f /tmp/test_ok_conversion.tif
    rm -f /tmp/test_ok_4326_i.tif
    rm -f /tmp/test_ok_4326_m.tif
}