############################################
# Need to have only one import from library#
############################################

if __name__ == '__main__':
    #########################################################
    # Lines 9-14 are for reference purposes, to be deleted.#
    #########################################################
    # Import Multiplication from your library
    from Lib import Multiplication
    # Instantiate a Multiplication object
    multiplication = Multiplication(2)
    # Call the multiply method
    print(multiplication.multiply(5))

    ##########################################
    # Testing methods to ensure proper output#
    ##########################################
    from Lib import PlantumlClass

    c1 = PlantumlClass("class 1")

    c1.add_method("c1m1")
    c1.add_method("c1m2")

    c2 = PlantumlClass("class 2")
    c2.add_method("c2m1")

    m1 = c1.add_method("c1m3")
    m1.set_static()
    m1.set_modifier("private")
    m1.set_return_type("String")

    c1.print_uml()
    c2.print_uml()

    from Lib.plantumlcommunicationdiagram import PlantUmlCommunicationDiagram

    communication_diagram = PlantUmlCommunicationDiagram("testdata.txt")
    communication_diagram.print_uml()

    #######################################
    # Rest of file controls terminal input#
    #######################################
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
            PlantumlClass(classname)

        elif numinput == 2:
            classlist = PlantumlClass.get_class_list()
            print("Which class would you like to add a method to?")
            j = 1
            for i in classlist:
                print(j, str(":"), i.get_class_name())
                j = j + 1

            print(j, ": Cancel")
            methodinput = int(input())
            if methodinput < j:
                methodinput = methodinput - 1
                c = classlist[methodinput]
                print("What is the name of the method?")
                methodname = input()
                m = c.add_method(methodname)
                print("Static Y/N?")
                answer = input()
                if answer == str("Y") or answer == str("y"):
                    m.set_static()
                print("What will the return type be?")
                print("1 - Void")
                print("2 - Int")
                print("3 - String")
                print("5 - Boolean")
                print("6 - Other")
                returntype = int(input())
                if returntype == 1:
                    m.set_return_type("void")
                if returntype == 2:
                    m.set_return_type("int")
                if returntype == 3:
                    m.set_return_type("String")
                if returntype == 4:
                    m.set_return_type("boolean")
                if returntype == 5:
                    print("What does it return?")
                    typeinput = input()
                    m.set_return_type(typeinput)

        elif numinput == 3:
            classlist = PlantumlClass.get_class_list()
            for i in classlist:
                i.print_uml()
        else:
            break
