namespace Src.Mock {
    public class Printer : Object, IPrint {
        private Logger _log;
        public Printer(Logger log) {
            _log = log;
        }
        public void write(string message) {
            VerifyText.instance().add_text(message);
            _log.write(message);
        }
    }
}
