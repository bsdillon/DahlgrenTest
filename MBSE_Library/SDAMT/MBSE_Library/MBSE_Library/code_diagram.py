from MBSE_Library.MBSE_Library import PlantumlPackage, PlantumlClass


class CodeDiagram:

    @staticmethod
    def print_code_diagram():
        file1 = open("code_diagram.txt", "w")
        content = "@startuml\n"
        classes = []
        for c in PlantumlClass.get_class_list():
            classes.append(c.get_class_name())

        for p in PlantumlPackage.get_package_list():
            package_name = p.get_package_name()
            content += str('package "' + package_name + '" as ' + package_name.replace(" ", "_") + ' {\n')
            for c in p.get_classes():
                content += CodeDiagram.class_with_methods(c)
                classes.remove(c.get_class_name())
            content += "}\n"

        for c in PlantumlClass.get_class_list():
            for cc in classes:
                if c.get_class_name() == cc:
                    content += CodeDiagram.class_with_methods(c) + " \n"

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
    def class_with_methods(c):
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
