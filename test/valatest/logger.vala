namespace ValaTest {
    public class Logger {
        public void write(string message) {
            stdout.printf("LOG: " + message + "\r\n");
        }
    }
}
