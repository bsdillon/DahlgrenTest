#########################################################################
# Represents and stores all information for methods in the code diagram #
#########################################################################

class PlantumlMethod:

    def __init__(self, method, return_type, modifier):
        self.method = method  # the name of the method
        self.return_type = return_type  # the return type
        self.static = False  # whether the method is static or not
        self.modifier = modifier  # the scope of the method
        # //developer's note: should probably just rename this variable and references to scope
        self.call_classes = []  # the classes that this method interacts with (method diagrams)
        self.call_methods = []  # the methods that this method specifically interacts with. Should be methods within
        # previous class (method diagrams)

    def get_method(self):
        return self.method

    def get_return_type(self):
        return self.return_type

    def set_return_type(self, return_type):
        self.return_type = return_type

    def set_static(self):
        self.static = True

    def get_static(self):
        return self.static

    def set_modifier(self, modifier):
        self.modifier = modifier

    def get_modifier(self):
        if self.modifier == "public":
            return "+"
        if self.modifier == "private":
            return "-"
        if self.modifier == "package_private":
            return "~"
        if self.modifier == "protected":
            return "#"
        else:
            return ""

    def add_method_connection(self, class_receiver, method_receiver):
        self.call_classes.append(class_receiver)
        self.call_methods.append(method_receiver)

    def get_call_classes(self):
        return self.call_classes

    def get_call_methods(self):
        return self.call_methods
