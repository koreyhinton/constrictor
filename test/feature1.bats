#!/usr/bin/env bats

# This feature was already supported by manual means, so this test will
# run it the manual way. A better way to do this is using containers
# and generated constructors (feature2.bats and feature3.bats)

load prep


@test "Manual container shares the same object instance (#1)" {
    export set PYTHONPATH="${testdir}/../"
    run python "${batbox}/feature1/pyconstrictor.py"
    run python "${batbox}/feature1/main.py"
    echo "status = ${status}"
    echo "output = ${output}" # https://github.com/sstephenson/bats/issues/191#issuecomment-256947900
    [ "$status" -eq 0 ]
}
