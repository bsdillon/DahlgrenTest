from MBSE_Library.MBSE_Library.code_diagrams.plantumlmethod import PlantumlMethod
from MBSE_Library.MBSE_Library.code_diagrams.plantumlvariables import PlantumlVariable


class PlantumlClass:
    class_list = []

    sender = []
    receiver = []
    relationship = []

    def __init__(self, uml_class):
        self.uml_class = uml_class
        self.methods = []
        self.variables = []
        self.add_class_list(self)
        self.has_color = False
        self.color = ""

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

    def add_variable(self, variable):
        v1 = PlantumlVariable(variable, "", "")
        self.variables.append(v1)
        return v1

    def get_variables(self):
        return self.variables

    def set_color(self, color):
        self.color = color
        self.has_color = True

    def get_color(self):
        return self.color

    def does_have_color(self):
        return self.has_color

    def add_relationship(self, r, t):
        PlantumlClass.sender.append(self.get_class_name())
        PlantumlClass.receiver.append(r.get_class_name())
        if t == "Association":
            PlantumlClass.relationship.append("--")
        elif t == "Directed Association":
            PlantumlClass.relationship.append("-->")
        elif t == "Aggregation":
            PlantumlClass.relationship.append("o--")
        elif t == "Composition":
            PlantumlClass.relationship.append("*--")
        elif t == "Inheritance":
            PlantumlClass.relationship.append("<|--")
        else:
            PlantumlClass.relationship.append(str(t))

    @staticmethod
    def get_sender():
        return PlantumlClass.sender

    @staticmethod
    def get_receiver():
        return PlantumlClass.receiver

    @staticmethod
    def get_relationship():
        return PlantumlClass.relationship
