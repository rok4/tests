#!/usr/bin/env bash

setup_file() {
    echo "Testing work2cache" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "Fail because of grid definition" {
    bats_require_minimum_version 1.5.0
    run -255 work2cache ../inputs/work2cache/NOTASLAB.tif -c zip -t 150 150 file:///tmp/test_nok_param.tif
}

@test "Succeed to tile a FLOAT32 slab" {
    bats_require_minimum_version 1.5.0
    run -0 work2cache ../inputs/work2cache/float32/tiff_striped_gray.tif -c zip -t 50 50 file:///tmp/SLAB_GRAY_FLOAT32_1.tif
    run -0 work2cache ../inputs/work2cache/float32/tiff_tiled_gray.tif -c zip -t 50 50 file:///tmp/SLAB_GRAY_FLOAT32_2.tif
    run -0 work2cache ../inputs/work2cache/float32/bil_gray.bil -c zip -t 50 50 file:///tmp/SLAB_GRAY_FLOAT32_3.tif
    run -0 work2cache ../inputs/work2cache/float32/zbil_gray.bil -c zip -t 50 50 file:///tmp/SLAB_GRAY_FLOAT32_4.tif
}

@test "Succeed to tile a UINT8 slab" {
    bats_require_minimum_version 1.5.0
    run -0 work2cache ../inputs/work2cache/uint8/tiff_tiled_gray.tif -c zip -t 50 50 file:///tmp/SLAB_GRAY_UINT8_1.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_striped_gray.tif -c zip -t 50 50 file:///tmp/SLAB_GRAY_UINT8_2.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_striped_graya.tif -c zip -t 50 50 file:///tmp/SLAB_GRAYA_UINT8_1.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_tiled_graya.tif -c zip -t 50 50 file:///tmp/SLAB_GRAYA_UINT8_2.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_striped_rgb.tif -c zip -t 50 50 file:///tmp/SLAB_RGB_UINT8_1.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_tiled_rgb.tif -c zip -t 50 50 file:///tmp/SLAB_RGB_UINT8_2.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_tiled_palette.tif -c zip -t 50 50 file:///tmp/SLAB_RGB_UINT8_3.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_striped_palette.tif -c zip -t 50 50 file:///tmp/SLAB_RGB_UINT8_4.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_striped_rgba.tif -c zip -t 50 50 file:///tmp/SLAB_RGBA_UINT8_1.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_tiled_rgba.tif -c zip -t 50 50 file:///tmp/SLAB_RGBA_UINT8_2.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_striped_rgb_jpeg.tif -c zip -t 50 50 file:///tmp/SLAB_RGB_UINT8_5.tif
    run -0 work2cache ../inputs/work2cache/uint8/tiff_tiled_rgb_jpeg.tif -c zip -t 50 50 file:///tmp/SLAB_RGB_UINT8_6.tif
}


@test "Succeed to tile a slab, with conversion" {
    bats_require_minimum_version 1.5.0
    run -0 work2cache ../inputs/work2cache/NOTASLAB.tif -c zip -t 50 50 -a uint8 -s 1 file:///tmp/test_ok_conversion.tif
}

teardown_file() {
    rm -f /tmp/test_nok_param.tif
    rm -f /tmp/test_ok_conversion.tif
}
