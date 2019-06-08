namespace Src {
    public interface IPrint : Object {
        public abstract void write(string message);
    }
    public interface ILog : Object {
        public abstract void write(string message);
    }
    public class App
    {
        public App(ILog log, IPrint printer)
        {
            log.write("test1");
            printer.write("test2");
        }
    }
}
