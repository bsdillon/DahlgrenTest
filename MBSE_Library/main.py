def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# Import Multiplication from your library
from Lib import Multiplication

# Instantiate a Multiplication object
multiplication = Multiplication(2)

# Call the multiply method
print(multiplication.multiply(5))

from Lib import Plantumlclass

c1 = Plantumlclass("class1")

c1.addmethod("c1m1")
c1.addmethod("c1m2")

c2 = Plantumlclass("class2")
c2.addmethod("c2m1")

m1 = c1.addmethod("c1m3")
m1.setStatic()
m1.setType("String")

c1.printUML()
c2.printUML()

numinput = 0

while numinput != 4:
    print("1 - Add a class")
    print("2 - Add a method")
    print("3 - Print diagram")
    print("4 - Exit")

    numinput = int(input())

    if numinput == 1:
        print("What is the name of the class?")
        classname = input()
        Plantumlclass(classname)

    elif numinput == 2:
        classlist = Plantumlclass.getClasslist()
        print("Which class would you like to add a method to?")
        j = 1
        for i in classlist:
            print(j, str(":"), i.getClassName())
            j = j + 1

        print(j, ": Cancel")
        methodinput = int(input())
        if methodinput < j:
            methodinput = methodinput - 1
            c = classlist[methodinput]
            print("What is the name of the method?")
            methodname = input()
            m = c.addmethod(methodname)
            print("Static Y/N?")
            answer = input()
            if answer == str("Y") or answer == str("y"):
                m.setStatic()
            print("What will the return type be?")
            print("1 - Void")
            print("2 - Int")
            print("3 - String")
            print("4 - ?")
            returntype = int(input())
            if returntype == 1:
                m.setType("void")
            if returntype == 2:
                m.setType("int")
            if returntype == 3:
                m.setType("String")
            if returntype == 4:
                m.setType("")

    elif numinput == 3:
        classlist = Plantumlclass.getClasslist()
        for i in classlist:
            i.printUML()
    else:
        break

#containorization
