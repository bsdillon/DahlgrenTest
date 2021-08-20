class enclose {
    class nested { // private member
	public:
        void g() {}
    };
 public:
    static nested f() { return nested{}; }
};
 
int main()
{
    //enclose::nested n1 = enclose::f(); // error: 'nested' is private
 
    enclose::f().g(); // OK: does not name 'nested'
    auto n2 = enclose::f(); // OK: does not name 'nested'
    n2.g();
}