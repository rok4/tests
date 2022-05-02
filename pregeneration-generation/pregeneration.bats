#!/usr/bin/env bash

setup_file() {    
    # Attente du lancement terminé de PostGIS
    sleep 10
    
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR:$PATH"

    echo "Testing PREGENERATION" >&3
}

@test "STATES PM" {

    run -0 4alamo.pl --conf /confs/4alamo-states.json
}

@test "LIMADM PM" {

    run -0 4alamo.pl --conf /confs/4alamo-limadm.json
}

@test "BDPARCELLAIRE PNG 4326" {

    run -0 be4.pl --conf /confs/be4-parcellaire.json
}

@test "RGEALTI ZIP LAMB93_1M_MNT" {

    run -0 be4.pl --conf /confs/be4-alti.json
}

@test "RGEALTI PNG PM STYLED" {
    
    run -0 be4.pl --conf /confs/be4-alti-style.json
}

@test "SCAN1000 PNG PM ADD ALPHA" {
    
    run -0 be4.pl --conf /confs/be4-scan1000.json
}

teardown_file() {
    touch /common/pregeneration.ok

    until ls /common/generation.ok; do
        echo "Attente de la fin de l'étape de génération" >&3
        sleep 10
    done

    rm /common/generation.ok
}