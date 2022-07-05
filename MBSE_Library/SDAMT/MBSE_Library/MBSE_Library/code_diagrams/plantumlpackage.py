from MBSE_Library.MBSE_Library.code_diagrams.plantumlclass import PlantumlClass


class PlantumlPackage:
    package_list = []

    def __init__(self, uml_package):
        self.uml_package = uml_package
        self.classes = []
        self.add_package_list(self)

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
