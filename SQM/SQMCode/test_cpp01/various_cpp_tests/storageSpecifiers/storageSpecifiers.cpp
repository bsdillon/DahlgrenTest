int main() {
    static int a = 1;
    register int b = 2;
    auto c = 3;
    static int d = 4;
    thread_local int e = 5;
    //mutable, extern

    return 0;
}