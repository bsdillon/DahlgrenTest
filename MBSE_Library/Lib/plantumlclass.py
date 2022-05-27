from Lib.plantumlmethod import PlantumlMethod


class PlantumlClass:
    """
        Instantiate a class creation.
        Classes are needed before methods can be added.

        :param uml_class: The name of the class.
        :type uml_class: String
        """

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
        m1 = PlantumlMethod(method, "")
        self.methods.append(m1)
        return m1

    def print_uml(self):
        file1 = open(self.uml_class + ".txt", "w")
        content = ["class " + self.uml_class + ' {\n' + ' \n--\n']
        for i in self.methods:
            if i.get_static():
                content += '{static} '
            content += i.get_method()
            content += ': '
            content += i.get_return_type()
            content += ' \n'
        content += '\n}'
        self.content = content
        file1.writelines(content)
        file1.close()
        # need to pull image from plant uml

    def get_content(self):
        return self.content
