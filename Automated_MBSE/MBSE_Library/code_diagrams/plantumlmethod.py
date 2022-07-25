class PlantumlMethod:

    def __init__(self, method, return_type, modifier):
        self.method = method
        self.return_type = return_type
        self.static = False
        self.modifier = modifier
        self.call_classes = []
        self.call_methods = []

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
