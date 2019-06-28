#!/usr/bin/env bash

# To Build:
#     ./build.bash
# And Then Run (MSYS2):
#     ./main.exe


# generate main.vala
echo "" > main.vala
cat <<EOF >> main.vala
using Src;
using Src.Real;
int main(string[] args) {
EOF

export SET PYTHONPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../../../src"
python ../vala_test_gen.py -c construction >> main.vala
cat <<EOF >> main.vala
    ;
    return 0;
}
EOF

# compile
valac real/*.vala app.vala main.vala -o main
