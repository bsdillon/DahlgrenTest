###########################################################################
# Represents and stores all information for variables in the code diagram #
###########################################################################

class PlantumlVariable:

    def __init__(self, variable, return_type, modifier):
        self.variable = variable  # the name of the variable
        self.return_type = return_type  # the return type
        self.static = False  # whether the variable is static or not
        self.modifier = modifier  # the scope of the method
        # //developer's note: should probably just rename this variable and references to scope

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
