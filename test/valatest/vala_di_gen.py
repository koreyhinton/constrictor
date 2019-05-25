import constrictor
import os


class ValaMainInterface(constrictor.main_interface.MainInterface):

    def get_main_path(self):
        return os.path.dirname(os.path.abspath(__file__)) + '/' + 'main.vala'

    def get_header(self):
        return """
using ValaTest;
int main(string[] args) {
"""

    def get_trailer(self):
        return """
    return 0;
}
"""


class LogDependency(constrictor.object_interface.ObjectInterface):

    def name(self):
        return 'Logger'

    def dependencies(self):
        return []


class PrintDependency(constrictor.object_interface.ObjectInterface):
    def name(self):
        return 'Printer'

    def dependencies(self):
        return [LogDependency()]


class ValaRootObject(constrictor.object_interface.ObjectInterface):

    def dependencies(self):
        return [LogDependency(), PrintDependency()]

    def name(self):
        return 'App'


class ValaLang(constrictor.lang_interface.LangInterface):

    def new_keyword(self):
        return 'new'

    def terminate_statement_symbol(self):
        return ';'

    def indent(self):
        return '    '

    def comment(self, text):
        return "/* " + text + "*/"


class ValaConstrictor(constrictor.Constrictor, ValaMainInterface, ValaRootObject, ValaLang):
    pass


if __name__ == '__main__':
    vc = ValaConstrictor()
    vc.write(vc.generate())
