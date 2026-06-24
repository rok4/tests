#!/usr/bin/env bash

setup_file() {
    echo "Testing mergeNtiff" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "Fail because of wrong input" {
    bats_require_minimum_version 1.5.0
    run -255 mergeNtiff -f ../inputs/mergeNtiff/conf_nok_/inputs.txt -c zip -i lanczos -n 0,0,255
}

@test "Succeed to reproject images into 4326" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_4326.txt -r ../inputs/mergeNtiff/ -c zip -i lanczos -n 255,0 -a uint8 -s 2
}

@test "Succeed to reproject and convert input images" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_conversion.txt -c zip -i lanczos -n 255,255,255,0 -a uint8 -s 4
}

@test "Succeed to reproject images using an input mask" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_mask.txt -r ../inputs/mergeNtiff/ -c zip -i lanczos -n 0,0,255
}

@test "Succeed to reproject images and apply a slope style with a palette" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/pente_with_palette.json -c zip -i lanczos -n -255,0,0,100
}

@test "Succeed to reproject images and apply a slope style without a palette" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/pente.json -c zip -i lanczos -n -255,0,0,100
}

@test "Succeed to reproject images and apply a estompage style with a palette" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/estompage_with_palette.json -c zip -i lanczos -n -255,0,0,100
}

@test "Succeed to reproject images and apply a estompage style without a palette" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/estompage.json -c zip -i lanczos -n -255,0,0,100
}

@test "Succeed to reproject images and apply a aspect style with a palette" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/aspect_with_palette.json -c zip -i lanczos -n -255,0,0,100
}

@test "Succeed to reproject images and apply a aspect style without a palette" {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/aspect.json -c zip -i lanczos -n -255,0,0,100
}

@test "Succeed to reproject images and apply a terrainrgb style " {
    bats_require_minimum_version 1.5.0
    run -0 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/terrainrgb.json -c zip -i lanczos -n -255,0,0,100
}

@test "Fail because of terrainrgb and palette not compatibles " {
    bats_require_minimum_version 1.5.0
    run -255 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/terrainrgb_with_palette.json -c zip -i lanczos -n -255,0,0,100
}

@test "Succeed to reproject images and apply a colorize style " {
    bats_require_minimum_version 1.5.0
    run -255 mergeNtiff -f ../inputs/mergeNtiff/conf_style.txt -p ../inputs/mergeNtiff/colorize.json -c zip -i lanczos -n -255,0,0,100
}

teardown_file() {
    rm -f /tmp/test_ok_style.tif
    rm -f /tmp/test_ok_mask_i.tif
    rm -f /tmp/test_ok_mask_m.tif
    rm -f /tmp/test_ok_conversion.tif
    rm -f /tmp/test_ok_4326_i.tif
    rm -f /tmp/test_ok_4326_m.tif
}