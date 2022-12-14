#include <iostream>

/*
class a {
   class b {
        class c { // private member
	        class d {
                class e { // private member
	                public:
                    void fooby() { std::cout << "g() was called!" << std::endl; }
                    };
                    public:
                    static e ef() { return e{}; }
                };

                public:
                static d cf() { return d{}; }
        };

        public:
        static c bf() { return c{}; }
    };
    public:
    static b af() { return b{}; }
};
*/

class aa
{
    public:
    class bb
    {
        public:
        class cc
        {
            public:
            class dd
            {
                public:
                class ee
                {
                    public:
                    static void goo () {std::cout << "goo was called!" << std::endl;}
                };
            };
        };
    };
};


class Aye 
{
public: 
  
   // Only declaration
   void fun();
};

  
// Definition outside class using ::
void Aye::fun()
{
   std::cout << "fun() called";
}



namespace NamespaceE{
    class ClassE{
    public:
        class ClassE1{
        public:
            int x;
        };
    };
}

class ClassG {
public:
    static int get_x1() { return x1;}
    const static int x1 = 3;
};

enum class EnumA{
    First,
    Second,
    Third
};

class X
{
public:
      static int count;
};
int X::count = 10;

int C = 0;

int main()
{
    //Working in SQM VVV
    ::C = 1;
    int X = 0;
    std::cout << X::count << std::endl;
    EnumA enum_value = EnumA::First;
    int gx1 = ClassG::x1;
    int gx2 = ClassG::get_x1();
    NamespaceE::ClassE::ClassE1 e1;
    e1.x = 7;
    aa::bb::cc::dd::ee::goo();
    //Working in SQM ^^^


    //Not working in SQM VVV
    Aye ah;
    ah.fun();
    //Not working in SQM ^^^
    
    
    //a::af().bf().cf().ef().fooby();
    
    return 0;
}