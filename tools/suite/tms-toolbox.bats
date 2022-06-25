#!/usr/bin/env bash

setup_file() {
    echo "Testing TMS-TOOLBOX" >&3
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"
}

@test "Wrong TMS" {
    bats_require_minimum_version 1.5.0
    run -1 tms-toolbox.pl --tms FAKE --from BBOX:4,12 --to GETTILE_PARAMS --level 10
}

@test "BBOX -> GETTILE_PARAMS" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from BBOX:0,0,1000,1000 --to GETTILE_PARAMS --level 16 --slabsize 16x16
}

@test "BBOX -> SLAB_INDICES" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from BBOX:0,0,10000,10000 --to SLAB_INDICES --level 16 --slabsize 32x32
}

@test "BBOX -> SQL_FILE" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from BBOX:0,0,10000,10000 --to SQL_FILE:/tmp/test1.sql --level 17 --slabsize 32x32
}

@test "BBOXES_LIST -> SLAB_INDICES" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms 4326 --from BBOXES_LIST:/inputs/bboxes.list --to SLAB_INDICES --level 10 --slabsize 64x64
}

@test "GEOM_FILE -> GETTILE_PARAMS" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from GEOM_FILE:/inputs/geom.json --to GETTILE_PARAMS --level 17 --slabsize 4x4
}

@test "GEOM_FILE -> SLAB_INDICES" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from GEOM_FILE:/inputs/geom.json --to SLAB_INDICES --level 18 --slabsize 4x4
}

@test "GEOM_FILE -> SLABS_COUNT" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from GEOM_FILE:/inputs/geom.json --to SLABS_COUNT --level 20 --slabsize 4x4
}

@test "GEOM_FILE -> SQL_FILE" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from GEOM_FILE:/inputs/geom.json --to SQL_FILE:/tmp/test2.sql --level 15 --slabsize 4x4
}

@test "POINT -> SLAB_INFO" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms 4326 --from POINT:5,45 --to SLAB_INFO --slabsize 4x4 --level 15
}

@test "POINT -> TILE_INFO" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms 4326 --from POINT:5,45 --to TILE_INFO
}

@test "PYRAMID_LIST -> GEOM_FILE" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from PYRAMID_LIST:/pyramids/MONTAGNE.list --to GEOM_FILE:/tmp/test.json --slabsize 2x2 --level 17
}

@test "PYRAMID_LIST -> GETTILE_PARAMS" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms LAMB93_1M_MNT --from PYRAMID_LIST:/pyramids/RGEALTI.list --to GETTILE_PARAMS --slabsize 2x2 --ratio 4
}

@test "SLAB_INDICE -> TFW_FILE" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from SLAB_INDICE:12,25 --to TFW_FILE:/tmp/test.tfw --level 15 --slabsize 4x4
}

@test "SLAB_INDICE -> GEOM" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from SLAB_INDICE:12,25 --to GEOM --level 15 --slabsize 4x4
}

@test "SLAB_INDICES_LIST -> GETMAP_PARAMS" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from SLAB_INDICES_LIST:/inputs/slabs.list --to GETMAP_PARAMS --level 20 --slabsize 32x32 --ratio 2
}

@test "SLAB_INDICES_LIST -> SLAB_PATHS" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from SLAB_INDICES_LIST:/inputs/slabs.list --to SLAB_PATHS --level 20 --slabsize 32x32 --above 18
}

@test "SLAB_PATH -> GEOM" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from SLAB_PATH:00/00/13.tif --to GEOM --slabsize 4x4 --level 12
    run -0 tms-toolbox.pl --tms PM --from SLAB_PATH:12_13 --to GEOM --slabsize 4x4 --level 12 --storage CEPH
}

@test "TILE_INDICE -> SLAB_INFO" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from TILE_INDICE:4,12 --to SLAB_INFO --slabsize 4x4 --level 12 --storage S3
}

@test "TILE_INDICE -> GETMAP_PARAMS" {
    bats_require_minimum_version 1.5.0
    run -0 tms-toolbox.pl --tms PM --from TILE_INDICE:4,12 --to GETMAP_PARAMS --level 4 --buffer 10
}

teardown_file() {
    rm -f /tmp/test1.sql
    rm -f /tmp/test2.sql
    rm -f /tmp/test.tfw
    rm -f /tmp/test.json
}
