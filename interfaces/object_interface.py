

class ObjectInterface:

    def dependencies(self):
        raise NotImplementedError

    def name(self):
        raise NotImplementedError
