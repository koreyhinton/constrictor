import constrictor


class ValaLang(constrictor.lang_interface.LangInterface):

    def new_keyword(self):
        return 'new'

    def terminate_statement_symbol(self):
        return ';'

    def indent(self):
        return '    '

    def comment(self, text):
        return "/* " + text + "*/"
