from MBSE_Library import CodeDiagram, LinearDiagram, Node, PlantumlClass, PlantumlPackage


class MBSE:

    @staticmethod
    def print_uml():
        CodeDiagram.print_code_diagram()
        LinearDiagram.print_communication_diagram()
        LinearDiagram.print_sequence_diagram()

    ################
    # Code Diagrams#
    ################

    @staticmethod
    def add_package(package_name):
        PlantumlPackage(package_name)

    @staticmethod
    def add_class(class_name):
        PlantumlClass(class_name)

    @staticmethod
    def add_class_to_package(class_name, package_name):
        for p in PlantumlPackage.get_package_list():
            if p.get_package_name() == package_name:
                for c in PlantumlClass.class_list:
                    if c.get_class_name() == class_name:
                        p.add_class(c)

    @staticmethod
    def add_method_to_class(method_name, class_name, modifier="", static=False, return_type=""):
        for c in PlantumlClass.get_class_list():
            if c.get_class_name() == class_name:
                m = c.add_method(method_name)
                m.set_modifier(modifier)
                m.set_return_type(return_type)
                if static:
                    m.set_static()

    @staticmethod
    def add_variable_to_class(variable_name, class_name, modifier="", static=False, return_type=""):
        for c in PlantumlClass.get_class_list():
            if c.get_class_name() == class_name:
                v = c.add_variable(variable_name)
                v.set_modifier(modifier)
                v.set_type(return_type)
                if static:
                    v.set_static()

    @staticmethod
    def class_color(class_name, color):
        for c in PlantumlClass.class_list:
            if c.get_class_name() == class_name:
                c.set_color(color)

    @staticmethod
    def add_relationship(sender, receiver, relationship_type):
        for s in PlantumlClass.class_list:
            if s.get_class_name() == sender:
                for r in PlantumlClass.class_list:
                    if r.get_class_name() == receiver:
                        s.add_relationship(r, relationship_type)

    ##################
    # Linear Diagrams#
    ##################
    @staticmethod
    def load_file(filename):
        LinearDiagram.load_file(filename)

    @staticmethod
    def set_unimportant(node):
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_importance()

    @staticmethod
    def color(node, color):
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_color(color)

    @staticmethod
    def highlight_out(node):
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_highlighted_out()

    @staticmethod
    def highlight_in(node):
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_highlighted_in()

    @staticmethod
    def create_box(box_name):
        LinearDiagram.boxes.append(box_name)

    @staticmethod
    def add_to_box(node, box_name):
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_box_name(box_name)
