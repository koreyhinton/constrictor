# Dependency Injection Code Generator Framework
from abc import ABC
from interfaces import object_interface
from interfaces import lang_interface


def traverse(obj, new_keyword):
    nk = new_keyword
    ctors = []
    for dep in obj.dependencies():
        ctors.append(traverse(dep, nk))
    if len(nk) > 0 and not nk.endswith(' '):
        nk += ' '
    return nk + obj.name() + '(' + ', '.join(ctors) + ')'


class Constrictor(object_interface.ObjectInterface, lang_interface.LangInterface, ABC):

    def construction(self):
        init_code = super().indent() + traverse(super(), super().new_keyword())# + super().terminate_statement_symbol()
        gen = init_code
        return gen


if __name__ == '__main__':
    pass
