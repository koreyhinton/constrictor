import constrictor
import examples.valatest.vala_lang as vala_lang
import examples.valatest.vala_root as vala_root


class ValaConstrictor(constrictor.Constrictor,
                      vala_root.ValaRootObject, vala_lang.ValaLang):
    pass


if __name__ == '__main__':
    print(ValaConstrictor().construction())
