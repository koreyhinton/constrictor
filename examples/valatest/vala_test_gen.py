#!/usr/bin/env python3
from constrictor import ValaConstrictor
import vala_root


class ValaTestGen(ValaConstrictor, vala_root.ValaRootObject):
    pass


if __name__ == '__main__':
    print(ValaTestGen().command())
