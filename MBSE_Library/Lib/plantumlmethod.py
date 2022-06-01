class PlantumlMethod:
    """
            Instantiate a method creation.
            Methods need a class to be added to.

            :param method: The name of the method.
            :type method: String
            :param return_type: The return type of the method.
            :type return_type: String
            """

    def __init__(self, method, return_type, modifier):
        self.method = method
        self.return_type = return_type
        self.static = False
        self.modifier = modifier

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
