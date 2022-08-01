import csv
import os
import pickle

from MBSE_Library import CodeDiagram, LinearDiagram, Node, PlantumlClass, PlantumlPackage, Relationships


class MBSE:

    @staticmethod
    def compare(model1, model2):
        LinearDiagram.ld_compare(model1, model2)

    @staticmethod
    def load_linear_diagram(filename):
        cd = os.path.join(filename, "linear_diagrams", "nodes")
        for file in os.scandir(cd):
            name, extension = os.path.splitext(file)
            if extension == '.txt':
                file_pi2 = open(file, 'rb')
                c = pickle.load(file_pi2)
                LinearDiagram.nodes.append(c)

        with open(filename + "/linear_diagrams/edges/edges.csv", 'r') as file:
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                LinearDiagram.sender.append(row[0])
                LinearDiagram.receiver.append(row[1])
                LinearDiagram.message_type.append(row[2])

        for i in range(len(LinearDiagram.sender)):
            updated = False
            for o in LinearDiagram.order_list:
                if o.get_sender() == LinearDiagram.sender[i] and o.get_receiver() == LinearDiagram.receiver[i]:
                    o.increment()
                    updated = True
                    break
            if not updated:
                r = Relationships(LinearDiagram.sender[i], LinearDiagram.receiver[i])
                LinearDiagram.order_list.append(r)

    @staticmethod
    def save_linear_diagram(filename):
        cd = os.path.join(filename, "linear_diagrams")
        os.makedirs(cd)

        cd = os.path.join(filename, "linear_diagrams", "nodes")
        os.makedirs(cd)
        i = 1
        for n in Node.get_nodes():
            filehandler = open(cd + "/" + str(i) + n.get_name() + ".txt", 'wb')
            pickle.dump(n, filehandler)
            i += 1

        cd = os.path.join(filename, "linear_diagrams", "edges")
        os.makedirs(cd)
        f = open(filename + "/linear_diagrams/edges/edges.csv", "w")
        content = ""
        for i in range(len(LinearDiagram.sender)):
            content += (LinearDiagram.sender[i] + "," + LinearDiagram.receiver[i] + "," + LinearDiagram.message_type[i]+"\n")
        f.write(content)
        f.close()

        i = 1
        cd = os.path.join(filename, "linear_diagrams", "receiver")
        os.makedirs(cd)
        for r in LinearDiagram.receiver:
            filehandler = open(cd + "/" + str(i) + ".txt", 'wb')
            pickle.dump(r, filehandler)
            i += 1
        i = 1
        cd = os.path.join(filename, "linear_diagrams", "message_type")
        os.makedirs(cd)
        for m in LinearDiagram.message_type:
            filehandler = open(cd + "/" + str(i) + ".txt", 'wb')
            pickle.dump(m, filehandler)
            i += 1

    @staticmethod
    def load_code_diagram(filename):
        cd = os.path.join(filename, "code_diagrams")
        for file in os.scandir(cd):
            name, extension = os.path.splitext(file)
            if extension == '.txt':
                print(file)
                file_pi2 = open(file, 'rb')
                p = pickle.load(file_pi2)
                PlantumlPackage.package_list.append(p)
                for c in p.get_classes():
                    PlantumlClass.class_list.append(c)
        cd = os.path.join(filename, "code_diagrams", "classes")
        for file in os.scandir(cd):
            name, extension = os.path.splitext(file)
            if extension == '.txt':
                file_pi2 = open(file, 'rb')
                c = pickle.load(file_pi2)
                PlantumlClass.class_list.append(c)

    @staticmethod
    def save_code_diagram(filename):
        cd = os.path.join(filename, "code_diagrams")
        os.makedirs(cd)

        classes = []
        for c in PlantumlClass.get_class_list():
            classes.append(c.get_class_name())

        for p in PlantumlPackage.get_package_list():
            filehandler = open(cd + "/" + p.get_package_name() + ".txt", 'wb')
            pickle.dump(p, filehandler)
            for c in p.get_classes():
                classes.remove(c.get_class_name())
        cd = os.path.join(filename, "code_diagrams", "classes")
        os.makedirs(cd)
        for c in PlantumlClass.get_class_list():
            for cc in classes:
                if c.get_class_name() == cc:
                    filehandler = open(cd + "/" + c.get_class_name() + ".txt", 'wb')
                    pickle.dump(c, filehandler)

    @staticmethod
    def print_uml(diagram=None):
        if diagram == "code":
            CodeDiagram.print_code_diagram()
            try:
                os.system('cmd /c "java -jar plantuml.jar code_diagram.txt"')
            except None:
                print("Error loading PlantUML image. Check if Plantuml is installed")
        elif diagram == "method":
            CodeDiagram.print_method_diagram()
            try:
                os.system('cmd /c "java -jar plantuml.jar code_diagram.txt"')
            except None:
                print("Error loading PlantUML image. Check if Plantuml is installed")
        elif diagram == "sequence":
            LinearDiagram.print_sequence_diagram()
            try:
                os.system('cmd /c "java -jar plantuml.jar sequence_diagram_plantuml.txt"')
            except None:
                print("Error loading PlantUML image. Check if Plantuml is installed")
        elif diagram == "communication":
            LinearDiagram.print_communication_diagram()
            try:
                os.system('cmd /c "java -jar plantuml.jar communication_diagram_plantuml.txt"')
            except None:
                print("Error loading PlantUML image. Check if Plantuml is installed")
        else:
            CodeDiagram.print_code_diagram()
            CodeDiagram.print_method_diagram()
            LinearDiagram.print_communication_diagram()
            LinearDiagram.print_sequence_diagram()
            try:
                os.system('cmd /c "java -jar plantuml.jar code_diagram.txt method_diagram.txt communication_diagram_plantuml.txt sequence_diagram_plantuml.txt"')
            except None:
                print("Error loading PlantUML image. Check if Plantuml is installed")

    ################
    # Code Diagrams#
    ################

    @staticmethod
    def create_package(package_name):
        """
            Creates a package.

            Creates a package to be added to the diagram.

            Parameters
            ----------
            package_name : str
                The name of the package

            """
        PlantumlPackage(package_name)

    @staticmethod
    def create_class(class_name, package_name=None):
        """
            Add a class to the diagram.

            Add a class to the diagram, can optionally specify the name of the package the class is in.

            Parameters
            ----------
            class_name : str
                The name of the class
            package_name : str
                (Optional) the name of the package the class will be added to. Will create a new package if no package
                with name exists yet

            """
        c = PlantumlClass(class_name)

        need_new_package = False
        if package_name is not None:
            for p in PlantumlPackage.get_package_list():
                if p.get_package_name() == package_name:
                    p.add_class(c)
                    need_new_package = True
            if not need_new_package:
                p = PlantumlPackage(package_name)
                p.add_class(c)

    @staticmethod
    def add_class_to_package(class_name, package_name):
        """
            Adds a class to a package.

            Adds a class to a package. If class or package with name does not exist, it will be created.

            Parameters
            ----------
            class_name : str
                The name of the class
            package_name : str
                The name of the package

            """
        need_new_package = True
        need_new_class = True
        for p in PlantumlPackage.get_package_list():
            if p.get_package_name() == package_name:
                need_new_package = False
        for c in PlantumlClass.get_class_list():
            if c.get_class_name() == class_name:
                need_new_class = False
        if need_new_package:
            PlantumlPackage(package_name)
        if need_new_class:
            PlantumlClass(class_name)

        for p in PlantumlPackage.get_package_list():
            if p.get_package_name() == package_name:
                for c in PlantumlClass.class_list:
                    if c.get_class_name() == class_name:
                        p.create_class(c)

    @staticmethod
    def add_method_to_class(method_name, class_name, modifier="", static=False, return_type=""):
        """
            Adds a method to a class.

            Adds a method to a class. Can optionally add modifiers to the method now.

            Parameters
            ----------
            method_name : str
                The name of the method
            class_name : str
                The name of the class
            modifier : str
                (Optional) Whether the method is public, private, package-private, or protected
            static : bool
                (Optional) Whether the method is static(True) or not(False). By default, is false.
            return_type: str
                (Optional) The return type of the method. Str, int, bool, etc.
            """
        for c in PlantumlClass.get_class_list():
            if c.get_class_name() == class_name:
                m = c.add_method(method_name)
                m.set_modifier(modifier)
                m.set_return_type(return_type)
                if static:
                    m.set_static()

    @staticmethod
    def add_variable_to_class(variable_name, class_name, modifier="", static=False, return_type=""):
        """
            Adds a variable to a class.

            Adds a variable to a class. Can optionally add modifiers to the variable now.

            Parameters
            ----------
            variable_name : str
                The name of the variable
            class_name : str
                The name of the class
            modifier : str
                (Optional) Whether the variable is public, private, package-private, or protected
            static : bool
                (Optional) Whether the variable is static(True) or not(False). By default, is false.
            return_type: str
                (Optional) The return type of the variable. Str, int, bool, etc.
            """
        for c in PlantumlClass.get_class_list():
            if c.get_class_name() == class_name:
                v = c.add_variable(variable_name)
                v.set_modifier(modifier)
                v.set_type(return_type)
                if static:
                    v.set_static()

    @staticmethod
    def color_class(class_name, color):
        """
            Adds a color to a class.

            Adds a color to a class.

            Parameters
            ----------
            class_name : str
                The name of the class you want to color.
            color : str
                The name of the color. Can also but a hexadecimal color value.

            """
        for c in PlantumlClass.class_list:
            if c.get_class_name() == class_name:
                c.set_color(color)

    @staticmethod
    def add_relationship(sender, receiver, relationship_type):
        """
            Adds relationships between classes.

            Adds a relationship between two specified classes.

            Parameters
            ----------
            sender : str
                The name of the sender class.
            receiver : str
                The name of the receiver class.
            relationship_type: str
                The relationship between the classes

            """
        for s in PlantumlClass.class_list:
            if s.get_class_name() == sender:
                for r in PlantumlClass.class_list:
                    if r.get_class_name() == receiver:
                        s.add_relationship(r, relationship_type)

    @staticmethod
    def add_method_connection(class_sender, method_sender, class_receiver, method_receiver):
        """
            Adds a connection between classes.

            Adds a connection between classes.

            Parameters
            ----------
            class_sender : str
                The name of the sender class
            method_sender : str
                The name of the sender method
            class_receiver : str
                The name of the receiver class
            method_receiver: str
                The name of the receiver class
            """
        for c in PlantumlClass.get_class_list():
            if c.get_class_name() == class_sender:
                for m in c.get_methods():
                    if m.get_method() == method_sender:
                        m.add_method_connection(class_receiver, method_receiver)

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
