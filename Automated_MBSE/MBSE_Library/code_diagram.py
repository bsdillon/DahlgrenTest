from MBSE_Library import PlantumlPackage, PlantumlClass


class CodeDiagram:
    # // developer's note: should be moved to code_diagrams package so that core.py is the only file in this directory

    @staticmethod
    def print_code_diagram():  # generates plantUML syntax for a class diagram
        file1 = open("code_diagram.txt", "w")
        content = "@startuml\n"
        classes = []
        for c in PlantumlClass.get_class_list():
            classes.append(c.get_class_name())

        for p in PlantumlPackage.get_package_list():
            package_name = p.get_package_name()
            content += str('package "' + package_name + '" as ' + package_name.replace(" ", "_") + ' {\n')
            for c in p.get_classes():
                content += CodeDiagram.class_with_methods(c)  # generates a class box for the specific class
                classes.remove(c.get_class_name())
            content += "}\n"

        for c in PlantumlClass.get_class_list():
            for cc in classes:
                if c.get_class_name() == cc:
                    content += CodeDiagram.class_with_methods(c) + " \n"  # generates a class box for the specific class

        sender = PlantumlClass.get_sender()
        receiver = PlantumlClass.get_receiver()
        relationship = PlantumlClass.get_relationship()

        for i in range(len(sender)):
            content += sender[i].replace(" ", "_") + " " + relationship[i] + " " + receiver[i].replace(" ", "_") + "\n"

        content += "@enduml"
        file1.writelines(content)
        file1.close()
        print("Code Diagram created successfully")

    @staticmethod
    def print_method_diagram():  # generates plantUML syntax for a method diagram
        file1 = open("method_diagram.txt", "w")
        content = "@startuml\n"

        for c in PlantumlClass.get_class_list():
            if c.get_methods():
                content += "map " + c.get_class_name() + " {\n"
                for m in c.get_methods():
                    content += m.get_modifier()
                    if m.get_static():
                        content += "__" + m.get_method() + "__"
                    else:
                        content += m.get_method()
                    content += " => " + m.get_return_type() + "\n"
                content += "}\n"

        for c in PlantumlClass.get_class_list():
            for m in c.get_methods():
                if m.get_call_classes():
                    for i in range(len(m.get_call_classes())):
                        content += '"' + c.get_class_name() + "::"
                        content += m.get_modifier()
                        if m.get_static():
                            content += "__" + m.get_method() + "__"
                        else:
                            content += m.get_method()
                        content += '" --> '
                        call_c = m.get_call_classes()
                        call_m = m.get_call_methods()
                        for cc in PlantumlClass.get_class_list():
                            if cc.get_class_name() == str(call_c[i]):
                                for mm in cc.get_methods():
                                    if mm.get_method() == call_m[i]:
                                        content += '"' + cc.get_class_name() + "::"
                                        content += mm.get_modifier()
                                        if mm.get_static():
                                            content += "__" + mm.get_method() + "__"
                                        else:
                                            content += mm.get_method()
                                        content += '"\n'
        content += "@enduml"
        file1.writelines(content)
        file1.close()
        print("Method Diagram created successfully")

    @staticmethod
    def class_with_methods(c):  # generates Plantuml syntax for a class box with methods and variables
        content = ""
        class_name = c.get_class_name()
        content += str('class "' + class_name + '" as ' + class_name.replace(" ", "_"))
        if c.does_have_color():
            content += " #" + c.get_color()
        content += ' {\n'
        for v in c.get_variables():
            if v.get_static():
                content += '{static} '
            content += v.get_modifier()
            content += v.get_variable()
            content += ': '
            content += v.get_type()
            content += ' \n'
        content += '--\n'
        for m in c.get_methods():
            if m.get_static():
                content += '{static} '
            content += m.get_modifier()
            content += m.get_method()
            content += ': '
            content += m.get_return_type()
            content += ' \n'
        content += '}\n'

        return content
