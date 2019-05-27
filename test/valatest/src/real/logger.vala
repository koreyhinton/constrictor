namespace Src.Real {
    public class Logger : Object, ILog {
        public void write(string message) {
            stdout.printf("LOG: " + message + "\r\n");
        }
    }
}
