namespace Src.Mock {
    public class VerifyText : Object {
        private static GLib.Once<VerifyText> _instance;
        private string[] verified = new string[3];
        private int index = 0;
        public static unowned VerifyText instance () {
            return _instance.once (() => { return new VerifyText(); });
        }
        public void verify() {
            stdout.printf("Test 1\n");
            if (verified[0] == "test1") {
                stdout.printf("  PASS\n");
            } else { stdout.printf("  FAIL"); }

            stdout.printf("Test 2\n");
            if (verified[1] == "test2") {
                stdout.printf("  PASS\n");
            } else { stdout.printf("  FAIL"); }

            stdout.printf("Test 3\n");
            if (verified[2] == "test2") { // printer writes and so does log, so test2 text is repeated
                stdout.printf("  PASS\n");
            } else { stdout.printf("  FAIL"); }
        }
        public void add_text(string text) {
            verified[index] = text;
            index++;
        }
    }
}
