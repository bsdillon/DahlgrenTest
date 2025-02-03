package one.two.three;

import other.*;
import static other.SomeClass.*;

class CheckAll implements OtherClass
{
    static int classValue;;

    static {
        classValue = 4;
    }

    void Static()
    {
        classValue = 4;
    }

    public CheckAll(int x)
    {
        Filter myFilter = new Filter() {
            public void doThing() {}
        };
    }

    final int otherInt = 222;
    int demoInt = 123;
    other.Thing.Second demoThing;
    int [][][] somedata  = new int[3][4][5];
    MyObject [][] someobject = new MyObject[2][2];

    protected void function1(final int a, double... b)
    {
        demoInt = 2.47;
        new CheckAll();
    }

    public static void printList(List<?> list)
    {
        this.function1(1,2.0);
        for (Object item : list)
        {
            System.out.println(item);
        }
    }

    public void testit(int x, int y, int z)
    {
        System.out.println("Hi there");
    }
}