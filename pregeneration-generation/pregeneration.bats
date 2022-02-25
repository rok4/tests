#!/usr/bin/env bash

setup_file() {    
    if [ ! -z $RUN_4ALAMO ]; then sleep 10; fi
    
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"

    echo "Testing PREGENERATION" >&3
}

@test "LIMADM PM" {

    if [ -z $RUN_4ALAMO ]; then skip "4ALAMO tests not enabled"; fi

    run -0 4alamo.pl --conf /confs/4alamo-limadm.conf
}

@test "BDPARCELLAIRE PNG 4326" {

    if [ -z $RUN_BE4 ]; then skip "BE4 tests not enabled"; fi

    run -0 be4.pl --conf /confs/be4-parcellaire.conf
}

@test "RGEALTI ZIP LAMB93_1M_MNT" {

    if [ -z $RUN_BE4 ]; then skip "BE4 tests not enabled"; fi

    run -0 be4.pl --conf /confs/be4-alti.conf
}

@test "RGEALTI PNG PM STYLED" {

    if [ -z $RUN_BE4 ]; then skip "BE4 tests not enabled"; fi
    
    run -0 be4.pl --conf /confs/be4-alti-style.conf
}

@test "SCAN1000 PNG PM ADD ALPHA" {

    if [ -z $RUN_BE4 ]; then skip "BE4 tests not enabled"; fi
    
    run -0 be4.pl --conf /confs/be4-scan1000.conf
}

teardown_file() {
    touch /common/pregeneration.ok

    until ls /common/generation.ok; do
        echo "Attente de la fin de l'étape de génération" >&3
        sleep 10
    done

    rm /common/generation.ok
}