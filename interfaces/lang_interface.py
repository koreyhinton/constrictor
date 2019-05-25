

class LangInterface:

    def new_keyword(self):
        raise NotImplementedError

    def terminate_statement_symbol(self):
        raise NotImplementedError

    def indent(self):
        raise NotImplementedError

    def comment(self, text):
        raise NotImplementedError
