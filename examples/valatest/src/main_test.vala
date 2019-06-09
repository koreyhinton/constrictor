
using Src;
using Src.Mock;
int main(string[] args) {
    new App(new Logger(), new Printer(new Logger()))
    ;
    VerifyText.instance().verify();
    return 0;
}
