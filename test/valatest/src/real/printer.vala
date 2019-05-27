namespace Src.Real {
    public class Printer : Object, IPrint {
        private Logger _log;
        public Printer(Logger log) {
            _log = log;
        }
        public void write(string message) {
            stdout.printf("PRINT: " + message + "\r\n");
            _log.write(message);
        }
    }
}
