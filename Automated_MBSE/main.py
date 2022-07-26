############################################
# Need to have only one import from library#
############################################

if __name__ == '__main__':
    ##########################################
    # Testing methods to ensure proper output#
    ##########################################
    from MBSE_Library import PlantumlClass, MBSE

    MBSE.add_class("User")
    MBSE.add_class("Core")
    MBSE.add_class("Methods", "ClassDiagrams")
    MBSE.add_class("Classes", "ClassDiagrams")
    MBSE.add_class("Packages", "ClassDiagrams")
    MBSE.add_class("csv", "LinearDiagrams")
    MBSE.add_class("sender", "LinearDiagrams")
    MBSE.add_class("receiver", "LinearDiagrams")
    MBSE.add_class("message_attribute", "LinearDiagrams")
    MBSE.add_class("Communication", "LinearDiagrams")
    MBSE.add_class("Sequence", "LinearDiagrams")
    MBSE.add_class("filter", "LinearDiagrams")
    MBSE.class_color("User", "Blue")
    MBSE.add_relationship("User", "Core", "Association")
    MBSE.add_relationship("Core", "Methods", "Directed Association")
    MBSE.add_relationship("Methods", "Classes", "Directed Association")
    MBSE.add_relationship("Classes", "Packages", "Directed Association")
    MBSE.add_relationship("Core", "csv", "Association")
    MBSE.add_relationship("csv", "sender", "Association")
    MBSE.add_relationship("csv", "receiver", "Association")
    MBSE.add_relationship("csv", "message_attribute", "Association")
    MBSE.add_relationship("sender", "filter", "Association")
    MBSE.add_relationship("receiver", "filter", "Association")
    MBSE.add_relationship("message_attribute", "filter", "Association")
    MBSE.add_relationship("filter", "Sequence", "Association")
    MBSE.add_relationship("filter", "Communication", "Association")
    MBSE.add_method_to_class("method3", "User")
    MBSE.add_method_to_class("method1", "Core", "public", True, "void")
    MBSE.add_method_to_class("method2", "Core")
    MBSE.add_method_to_class("method1", "receiver")
    MBSE.add_method_to_class("method1", "Methods")
    MBSE.add_method_to_class("method1", "sender")
    MBSE.add_method_to_class("method1", "filter")
    MBSE.add_variable_to_class("v1", "Core")
    MBSE.add_variable_to_class("v1", "Core", "private", True, "String")

    MBSE.add_method_connection("User", "method3", "Core", "method1")

    # MBSE.create_box("East Coast")
    # MBSE.add_to_box("New York", "East Coast")
    # MBSE.add_to_box("Atlanta", "East Coast")
    # MBSE.add_to_box("Washington", "East Coast")
    MBSE.color("Chicago", "red")
    MBSE.highlight_out("Dallas")
    MBSE.highlight_in("Denver")
    #MBSE.load_file("40path.csv")
    #MBSE.set_unimportant("Los Angeles")

    #MBSE.load_linear_diagram("projectbob")
    MBSE.print_uml()
    #MBSE.compare("graph11", "graph12")
    #MBSE.save_code_diagram("project1")
    #MBSE.save_linear_diagram("graph12")

    from MBSE_Library import PlantUmlCommunicationDiagram

    # communication_diagram = PlantUmlCommunicationDiagram("testdata.txt")
    # communication_diagram.print_uml()
    # communication_diagram.print_sequence_uml("Site B", "Site A")
    # communication_diagram.print_sequence_uml_with_other_pillar("Site A", "Site B")

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
                print("4 - Boolean")
                print("5 - Other")
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
            MBSE.print_uml()
        else:
            break
