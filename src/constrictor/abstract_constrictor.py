#!/usr/bin/env python3
# PYTHON_ARGCOMPLETE_OK
import argcomplete
import argparse
from abc import ABC

# Dependency Injection Code Generator Framework
from constrictor.interfaces import object_interface
from constrictor.interfaces import lang_interface


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
        init_code = traverse(super(), super().new_keyword())
        gen = init_code
        return gen

    def command(self):
        cmd_construction = 'construction'
        cmd_constructors = 'constructors'
        choices = [cmd_construction]
        if super().partial_classes():
            choices = choices.append(cmd_constructors)
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--command', choices=choices)
        argcomplete.autocomplete(parser)
        args = parser.parse_args()
        if args.command is None or args.command == cmd_construction:
            return self.construction()
        elif args.command == cmd_constructors:
            raise NotImplementedError


if __name__ == '__main__':
    pass
