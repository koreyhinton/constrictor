import constrictor
import os


class ValaMainInterface(constrictor.main_interface.MainInterface):

    MAIN_PATH = 'src/main.vala'
    TEST_PATH = 'src/main_test.vala'

    def get_main(self):
        script_path = os.path.dirname(os.path.abspath(__file__))
        main_path = script_path + '/' + self.MAIN_PATH
        test_path = script_path + '/' + self.TEST_PATH
        return {
            main_path: {'header': self.get_main_header(), 'trailer': self.get_main_trailer()},
            test_path: {'header': self.get_test_header(), 'trailer': self.get_test_trailer()}
        }

    @staticmethod
    def get_test_header():
        return """
using Src;
using Src.Mock;
int main(string[] args) {
"""

    @staticmethod
    def get_main_header():
        return """
using Src;
using Src.Real;
int main(string[] args) {
"""

    @staticmethod
    def get_main_trailer():
        return """
    return 0;
}
"""
    @staticmethod
    def get_test_trailer():
        return """
    VerifyText.instance().verify();
    return 0;
}
"""
