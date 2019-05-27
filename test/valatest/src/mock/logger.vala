namespace Src.Mock {
    public class Logger : Object, ILog {
        public void write(string message) {
            VerifyText.instance().add_text(message);
        }
    }
}
