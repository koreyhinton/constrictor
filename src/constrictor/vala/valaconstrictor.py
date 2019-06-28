#!/usr/bin/env python3
import constrictor
from . import vala_lang as vala_lang
from abc import ABC


class ValaConstrictor(constrictor.Constrictor, vala_lang.ValaLang, ABC):
    pass


if __name__ == '__main__':
    print(ValaConstrictor().command())
