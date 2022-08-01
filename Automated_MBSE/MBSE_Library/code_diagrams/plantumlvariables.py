class PlantumlVariable:

    def __init__(self, variable, return_type, modifier):
        self.variable = variable
        self.return_type = return_type
        self.static = False
        self.modifier = modifier

    def get_variable(self):
        return self.variable

    def get_type(self):
        return self.return_type

    def set_type(self, return_type):
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
