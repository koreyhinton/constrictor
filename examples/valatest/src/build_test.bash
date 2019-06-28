#!/usr/bin/env bash

# generate main_test.vala
echo "" > main_test.vala
cat <<EOF >> main_test.vala
using Src;
using Src.Mock;
int main(string[] args) {
EOF
export SET PYTHONPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../../../src"
python ../vala_test_gen.py -c construction >> main_test.vala
cat <<EOF >> main_test.vala
    ;
    VerifyText.instance().verify();
    return 0;
}
EOF

# compile
valac mock/*.vala app.vala main_test.vala -o main_test
