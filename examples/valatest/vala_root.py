import constrictor


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
