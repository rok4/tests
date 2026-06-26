assert_no_memory_leak() {

    if [[ ! -z $VALGRIND_ANALYSIS ]]; then
        assert_output --partial 'definitely lost: 0 bytes'
        assert_output --partial 'indirectly lost: 0 bytes'
        assert_output --partial 'possibly lost: 0 bytes'
    fi
}