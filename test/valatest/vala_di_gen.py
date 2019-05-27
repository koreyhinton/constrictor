import constrictor
import test.valatest.vala_main as vala_main
import test.valatest.vala_lang as vala_lang
import test.valatest.vala_root as vala_root

# from test.valatest import vala_main
# from test.valatest import vala_root
# from test.valatest import vala_lang


class ValaConstrictor(constrictor.Constrictor, vala_main.ValaMainInterface,
                      vala_root.ValaRootObject, vala_lang.ValaLang):
    pass


if __name__ == '__main__':
    ValaConstrictor().generate()
