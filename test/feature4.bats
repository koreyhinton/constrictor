#!/usr/bin/env bats

load prep

@test "Interpreted language (Python) can construct directly at runtime (#4)" {
    export set PYTHONPATH="${testdir}/../"
    run cp "${batbox}/feature1/pyconstrictor.py" "${batbox}/feature4/pyconstrictor.py"
    run cp "${batbox}/feature1/classes.py" "${batbox}/feature4/classes.py"
    run python "${batbox}/feature4/pyconstrictor.py"
    run python "${batbox}/feature4/main.py"
    echo "status = ${status}"
    echo "output = ${output}" # https://github.com/sstephenson/bats/issues/191#issuecomment-256947900
    [ "$status" -eq 0 ]
}
