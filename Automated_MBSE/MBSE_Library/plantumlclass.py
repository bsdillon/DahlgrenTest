from MBSE_Library.plantumlmethod import PlantumlMethod


class PlantumlClass:
    class_list = []

    def __init__(self, uml_class):
        self.uml_class = uml_class
        self.methods = []
        self.content = ""
        self.add_class_list(self)

    @staticmethod
    def get_class_list():
        return PlantumlClass.class_list

    @staticmethod
    def add_class_list(plantuml_class):
        PlantumlClass.class_list.append(plantuml_class)

    def get_class_name(self):
        return self.uml_class

    def add_method(self, method):
        m1 = PlantumlMethod(method, "", "")
        self.methods.append(m1)
        return m1

    def get_methods(self):
        return self.methods

    @staticmethod
    def print_uml():
        file1 = open("class_diagram.txt", "w")
        content = ""
        for c in PlantumlClass.get_class_list():
            class_name = c.get_class_name()
            content += str('class "' + class_name + '" as ' + class_name.replace(" ", "_") + ' {\n' + ' \n--\n')
            for i in c.get_methods():
                if i.get_static():
                    content += '{static} '
                content += i.get_modifier()
                content += i.get_method()
                content += ': '
                content += i.get_return_type()
                content += ' \n'
            content += '}\n\n'

        file1.writelines(content)
        file1.close()
        # need to pull image from plant uml
