##########################################################################
# Represents and stores all information for packages in the code diagram #
##########################################################################

class PlantumlPackage:
    package_list = []

    def __init__(self, uml_package):
        self.uml_package = uml_package  # the name of the package
        self.classes = []  # the objects of all the classes within the package
        self.add_package_list(self)  # calls add_package_list() to add the package name to the list of packages

    @staticmethod
    def get_package_list():
        return PlantumlPackage.package_list

    @staticmethod
    def add_package_list(plantuml_package):
        PlantumlPackage.package_list.append(plantuml_package)

    def get_package_name(self):
        return self.uml_package

    def add_class(self, c):
        self.classes.append(c)

    def get_classes(self):
        return self.classes
