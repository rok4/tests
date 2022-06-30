#!/usr/bin/env bash

setup_file() {
    
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"

    until ls /common/pregeneration.ok; do
        echo "Attente de la fin de l'étape de prégénération" >&3
        sleep 10
    done

    rm /common/pregeneration.ok
    echo "Testing GENERATION" >&3
}

@test "STATES PM" {

    bats_require_minimum_version 1.5.0
    run -0 bash /scripts/STATES/main.sh 1
    find /pyramids/STATES/ -type f | wc -l >&3
}

@test "LIMADM PM" {

    bats_require_minimum_version 1.5.0
    run -0 bash /scripts/LIMADM/main.sh 1
    find /pyramids/LIMADM/ -type f | wc -l >&3
}

@test "BDPARCELLAIRE PNG 4326" {

    bats_require_minimum_version 1.5.0
    run -0 bash /scripts/BDPARCELLAIRE/main.sh 1
    find /pyramids/BDPARCELLAIRE/ -type f | wc -l >&3
}

@test "RGEALTI ZIP LAMB93_1M_MNT" {

    bats_require_minimum_version 1.5.0
    run -0 bash /scripts/RGEALTI/main.sh 1
    find /pyramids/RGEALTI/ -type f | wc -l >&3
}

@test "RGEALTI PNG PM STYLED" {
    
    bats_require_minimum_version 1.5.0
    run -0 bash /scripts/MONTAGNE/main.sh 1
    find /pyramids/MONTAGNE/ -type f | wc -l >&3
}

@test "SCAN1000 PNG PM ADD ALPHA" {
    
    bats_require_minimum_version 1.5.0
    run -0 bash /scripts/SCAN1000/main.sh 1
    find /pyramids/SCAN1000/ -type f | wc -l >&3
}

teardown_file() {
    touch /common/generation.ok
}