#!/usr/bin/env bash

setup_file() {
    echo "Testing cache2Work" >&3
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

@test "Fail because of wrong compression" {
    bats_require_minimum_version 1.13.0

    run $precommand cache2work -c toto file://../inputs/cache2work/ORTHOHR.tif /tmp/test_nok_param.tif

    assert_failure
    assert_no_memory_leak
}

@test "Fail when input is not a slab" {
    bats_require_minimum_version 1.13.0

    run $precommand cache2work -c zip file://../inputs/cache2work/NOTASLAB.tif /tmp/test_nok_notaslab.tif

    assert_failure
    assert_no_memory_leak
}

@test "Succeed to untile a GRAY UINT8 slab" {
    bats_require_minimum_version 1.13.0

    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAY_LZW_UINT8.tif /tmp/GRAY_LZW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAY_PKB_UINT8.tif /tmp/GRAY_PKB_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAY_PNG_UINT8.tif /tmp/GRAY_PNG_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAY_RAW_UINT8.tif /tmp/GRAY_RAW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAY_ZIP_UINT8.tif /tmp/GRAY_ZIP_UINT8.tif

    assert_success
    assert_no_memory_leak
}

@test "Succeed to untile a GRAY FLOAT32 slab" {
    bats_require_minimum_version 1.13.0

    run $precommand cache2work -c zip file://../inputs/cache2work/float32/SLAB_GRAY_LZW_FLOAT32.tif /tmp/GRAY_LZW_FLOAT32.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/float32/SLAB_GRAY_PKB_FLOAT32.tif /tmp/GRAY_PKB_FLOAT32.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/float32/SLAB_GRAY_RAW_FLOAT32.tif /tmp/GRAY_RAW_FLOAT32.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/float32/SLAB_GRAY_ZIP_FLOAT32.tif /tmp/GRAY_ZIP_FLOAT32.tif

    assert_success
    assert_no_memory_leak
}

@test "Succeed to untile a GRAYA UINT8 slab" {
    bats_require_minimum_version 1.13.0

    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAYA_LZW_UINT8.tif /tmp/GRAYA_LZW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAYA_PKB_UINT8.tif /tmp/GRAYA_PKB_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAYA_PNG_UINT8.tif /tmp/GRAYA_PNG_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAYA_RAW_UINT8.tif /tmp/GRAYA_RAW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_GRAYA_ZIP_UINT8.tif /tmp/GRAYA_ZIP_UINT8.tif

    assert_success
    assert_no_memory_leak
}

@test "Succeed to untile a RGB UINT8 slab" {
    bats_require_minimum_version 1.13.0

    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGB_JPG_UINT8.tif /tmp/RGB_JPG_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGB_JPG90_UINT8.tif /tmp/RGB_JPG90_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGB_LZW_UINT8.tif /tmp/RGB_LZW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGB_PKB_UINT8.tif /tmp/RGB_PKB_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGB_PNG_UINT8.tif /tmp/RGB_PNG_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGB_RAW_UINT8.tif /tmp/RGB_RAW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGB_ZIP_UINT8.tif /tmp/RGB_ZIP_UINT8.tif

    assert_success
    assert_no_memory_leak
}

@test "Succeed to untile a RGBA UINT8 slab" {
    bats_require_minimum_version 1.13.0

    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGBA_LZW_UINT8.tif /tmp/RGBA_LZW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGBA_PKB_UINT8.tif /tmp/RGBA_PKB_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGBA_PNG_UINT8.tif /tmp/RGBA_PNG_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGBA_RAW_UINT8.tif /tmp/RGBA_RAW_UINT8.tif

    assert_success
    assert_no_memory_leak
    
    run $precommand cache2work -c zip file://../inputs/cache2work/uint8/SLAB_RGBA_ZIP_UINT8.tif /tmp/RGBA_ZIP_UINT8.tif

    assert_success
    assert_no_memory_leak
}

teardown_file() {
    rm -f /tmp/test_nok_notaslab.tif
    rm -f /tmp/test_nok_param.tif
}
