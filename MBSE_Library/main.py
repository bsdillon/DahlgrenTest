############################################
# Need to have only one import from library#
############################################

if __name__ == '__main__':
    ##########################################
    # Testing methods to ensure proper output#
    ##########################################
    from MBSE_Library import PlantumlClass

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

    from MBSE_Library import PlantUmlCommunicationDiagram

    communication_diagram = PlantUmlCommunicationDiagram("testdata.txt")
    communication_diagram.print_uml()
    communication_diagram.print_sequence_uml("Site C", "Site A")

    #######################################
    # Rest of file controls terminal input#
    #######################################
    num_input = 0
    while num_input != 4:
        print("1 - Add a class")
        print("2 - Add a method")
        print("3 - Print diagram")
        print("4 - Exit")

        num_input = int(input())

        if num_input == 1:
            print("What is the name of the class?")
            class_name = input()
            PlantumlClass(class_name)

        elif num_input == 2:
            class_list = PlantumlClass.get_class_list()
            print("Which class would you like to add a method to?")
            j = 1
            for i in class_list:
                print(j, str(":"), i.get_class_name())
                j = j + 1

            print(j, ": Cancel")
            method_input = int(input())
            if method_input < j:
                method_input = method_input - 1
                c = class_list[method_input]
                print("What is the name of the method?")
                method_name = input()
                m = c.add_method(method_name)
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
                return_type = int(input())
                if return_type == 1:
                    m.set_return_type("void")
                if return_type == 2:
                    m.set_return_type("int")
                if return_type == 3:
                    m.set_return_type("String")
                if return_type == 4:
                    m.set_return_type("boolean")
                if return_type == 5:
                    print("What does it return?")
                    type_input = input()
                    m.set_return_type(type_input)

        elif num_input == 3:
            class_list = PlantumlClass.get_class_list()
            for i in class_list:
                i.print_uml()
        else:
            break
