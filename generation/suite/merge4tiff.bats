#!/usr/bin/env bash

setup_file() {
    echo "Testing merge4tiff" >&3
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

@test "Fail because of wrong nodata colour" {
    bats_require_minimum_version 1.13.0

    run $precommand merge4tiff -c zip -n 255,255,255 -i1 ../inputs/merge4tiff/01.jpg -i2 ../inputs/merge4tiff/02.jpg -i3 ../inputs/merge4tiff/03.jpg -m3 ../inputs/merge4tiff/03m.tif -a uint8 -s 4 -io /tmp/test_nok_param.tif

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to merge 3 images and a background" {
    bats_require_minimum_version 1.13.0

    run $precommand merge4tiff -c zip -n 0,255,0 -i1 ../inputs/merge4tiff/01.jpg -i2 ../inputs/merge4tiff/02.jpg -i3 ../inputs/merge4tiff/03.jpg -ib ../inputs/merge4tiff/bg.tif -io /tmp/test_ok_bg.tif

    assert_success
    assert_no_memory_leak
}

@test "Succeed to merge 3 image and convert" {
    bats_require_minimum_version 1.13.0

    run $precommand merge4tiff -c zip -n 255,255,255,0 -i1 ../inputs/merge4tiff/01.jpg -i2 ../inputs/merge4tiff/02.jpg -i3 ../inputs/merge4tiff/03.jpg -m3 ../inputs/merge4tiff/03m.tif -a uint8 -s 4 -io /tmp/test_ok_conversion.tif

    assert_success
    assert_no_memory_leak
}

@test "Succeed to merge 3 images and generate the mask" {
    bats_require_minimum_version 1.13.0

    run $precommand merge4tiff -c zip -n 0,255,0 -i1 ../inputs/merge4tiff/01.jpg -i2 ../inputs/merge4tiff/02.jpg -i3 ../inputs/merge4tiff/03.jpg -m3 ../inputs/merge4tiff/03m.tif -io /tmp/test_ok_mask_i.tif -mo /tmp/test_ok_mask_m.tif

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_nok_param.tif
    rm -f /tmp/test_ok_bg.tif
    rm -f /tmp/test_ok_conversion.tif
    rm -f /tmp/test_ok_mask_i.tif
    rm -f /tmp/test_ok_mask_m.tif
}