############################################
# Need to have only one import from library#
############################################

if __name__ == '__main__':
    ##########################################
    # Testing methods to ensure proper output#
    ##########################################
    from MBSE_Library import MBSE

    MBSE.create_class("User")
    MBSE.create_class("Core")
    MBSE.create_class("Methods", "ClassDiagrams")
    MBSE.create_class("Classes", "ClassDiagrams")
    MBSE.create_class("Packages", "ClassDiagrams")
    MBSE.create_class("csv", "LinearDiagrams")
    MBSE.create_class("sender", "LinearDiagrams")
    MBSE.create_class("receiver", "LinearDiagrams")
    MBSE.create_class("message_attribute", "LinearDiagrams")
    MBSE.create_class("Communication", "LinearDiagrams")
    MBSE.create_class("Sequence", "LinearDiagrams")
    MBSE.create_class("filter", "LinearDiagrams")
    MBSE.color_class("User", "Blue")
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
    MBSE.add_method_to_class("method1", "Methods", "private", False, "String")
    MBSE.add_method_to_class("method1", "sender")
    MBSE.add_method_to_class("method1", "filter")
    MBSE.add_variable_to_class("v1", "Core")
    MBSE.add_variable_to_class("v1", "Core", "private", True, "String")

    MBSE.add_method_connection("User", "method3", "Core", "method1")
    MBSE.add_method_connection("Core", "method1", "Methods", "method1")
    MBSE.add_method_connection("Core", "method1", "sender", "method1")
    MBSE.add_method_connection("filter", "method1", "receiver", "method1")
    MBSE.add_method_connection("filter", "method1", "Core", "method2")

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
