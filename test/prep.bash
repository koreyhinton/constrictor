#!/usr/bin/env bash

testdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
batbox="${testdir}/.batbox"
mkdir -p "${batbox}"

# Feature 1 Prep
mkdir -p "${batbox}/feature1"
feature1main=$(echo "${batbox}/feature1/main.py" | sed -e 's/^\///' -e 's/\//\\/g' | sed -e 's/\\/\\\\/g' -e 's/^./\0:/')
touch "$feature1main"
cat <<EOF > "${batbox}/feature1/pyconstrictor.py"
import constrictor
class PyLang(constrictor.lang_interface.LangInterface):
    def new_keyword(self):
        return ''
    def terminate_statement_symbol(self):
        return ''
    def indent(self):
        return ''
    def comment(self, text):
        return '# '+text+'\r\n'
class PyRoot(constrictor.object_interface.ObjectInterface):
    def name(self):
        return 'App'
    def dependencies(self):
        return [Dep1(), Dep2()]
class PyConstrictor(constrictor.Constrictor, PyLang, PyRoot):
    pass
class Dep1:
    def name(self):
        return 'Dep1' 
    def dependencies(self):
        return [LogContainer()]
class Dep2:
    def name(self):
        return 'Dep2' 
    def dependencies(self):
        return [LogContainer()]
class LogContainer:
    def name(self):
        return 'LogContainer'
    def dependencies(self):
        return []
if __name__ == '__main__':
    PyConstrictor().construction()
EOF

cat <<EOF > "${batbox}/feature1/classes.py"
class Log:
    pass
class LogContainer:
    __shared = Log()
    def get(self):
        return LogContainer.__shared
class Dep2:
    def __init__(self, container):
        self.log = container.get()
class Dep1:
    def __init__(self, container):
        self.log = container.get()
class App:
    def __init__(self, dep1, dep2):
        self.dep1 = dep1
        self.dep2 = dep2
        # Reverse-test Assurance (uncomment to ensure failure):
        # self.dep2.log = Log()
        assert self.dep1.log is self.dep2.log, 'Reference equality failed'
EOF

# Feature 2 Prep
mkdir -p "${batbox}/feature4"
cat <<EOF > "${batbox}/feature4/main.py"
import pyconstrictor
from classes import App, Dep1, Dep2, Log, LogContainer
app = eval(pyconstrictor.PyConstrictor().construction())
log = app.dep1.log
EOF
