import csv
import os
import pickle

from MBSE_Library import CodeDiagram, LinearDiagram, Node, PlantumlClass, PlantumlPackage, Relationships


class MBSE:

    @staticmethod
    def compare(model1, model2):
        """
            Compares two linear diagrams.

            Compares two linear diagrams and shows the differences between them.

            Parameters
            ----------
            model1 : str
                The name of the folder that you want the first and primary model to be loaded from.
            model2 : str
                The name of the folder that you want the second and model that shows the changes to be loaded from.

            """
        LinearDiagram.ld_compare(model1, model2)
        # Send strings to ld_compare method in linear_diagram.py

    @staticmethod
    def load_linear_diagram(filename):
        """
            Loads the linear diagram.

            Loads the linear diagram digital model that can be edited now.

            Parameters
            ----------
            filename : str
                The name of the folder that you want the model to be loaded from.

            """
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

        for i in range(len(LinearDiagram.sender)):  # searches if a node sends to and receives to the same multiple
            # times and then increments
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
        """
            Saves the linear diagram.

            Saves the linear diagram digital model that can be loaded into the library later.

            Parameters
            ----------
            filename : str
                The name of the folder that you want the model to be saved in.

            """
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
            content += (LinearDiagram.sender[i]+","+LinearDiagram.receiver[i]+","+LinearDiagram.message_type[i]+"\n")
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
        """
            Loads the code diagram.

            Loads the code diagram digital model that can be edited now.

            Parameters
            ----------
            filename : str
                The name of the folder that you want the model to be loaded from.

            """
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
        """
            Saves the code diagram.

            Saves the code diagram digital model that can be loaded into the library later.

            Parameters
            ----------
            filename : str
                The name of the folder that you want the model to be saved in.

            """
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
        """
            Prints the UML diagrams.

            Prints the UML diagrams. Can optionally specify a specific diagram to be printed out.

            Parameters
            ----------
            diagram : str
                (Optional) The name of the specific diagram to be printed out. code, method, sequence, or communication.
                Can put in one option or if no option is there it will print out all diagrams.

            """
        # sends command to print diagram which generates a .txt file with plant uml syntax and then opens hidden cmd
        # prompt to run the plantuml.jar on the outputted .txt file which generates a .png image
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
                os.system('cmd /c "java -jar plantuml.jar code_diagram.txt method_diagram.txt '
                          'communication_diagram_plantuml.txt sequence_diagram_plantuml.txt"')
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
        # creates a PlantumlPackage object in code_diagrams/plantumlpackage.py

    @staticmethod
    def create_class(class_name, package_name=None):
        """
            Creates a class.

            Creates a class to be added to the diagram. Can optionally specify the name of the package the class is in.

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
        # creates a PlantumlClass object in code_diagrams/plantumlclass.py

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
        # searches to see if the class and package the user created already exist or not. If one or both do 
        # not exist, they are created by making a new PlantUMLPackage/PlantUMLClass object

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
        # searches all classes to find the one user is referring to. Creates method object and stores inside
        # aforementioned class object

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
        # searches all classes to find the one user is referring to. Creates variable object and stores inside
        # aforementioned class object

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
        # edits the color property of the class object

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
        # //developer's note: should check if relationship_type is a valid string type and if not return error
        for s in PlantumlClass.class_list:
            if s.get_class_name() == sender:
                for r in PlantumlClass.class_list:
                    if r.get_class_name() == receiver:
                        s.add_relationship(r, relationship_type)
        # Searches all classes to find classes with inputted names and then creates a relationship object

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
        # Searches all classes to find classes with inputted names and then searches all methods in that class to edit
        # variable in the method

    ##################
    # Linear Diagrams#
    ##################
    @staticmethod
    def load_file(filename):
        """
            Loads a CSV file.

            Loads a CSV file to create a linear diagram. Can be a .csv or .txt

            Parameters
            ----------
            filename : str
                The name of the file to load to data from.

            """
        LinearDiagram.load_file(filename)

    @staticmethod
    def set_unimportant(node):
        """
            Hides a node in the linear diagram.

            Hides a node in the linear diagram. Node will still exist but will not be shown on the diagram.

            Parameters
            ----------
            node : str
                The name of the node to be hidden in the diagram.


            """
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_importance()

    @staticmethod
    def color(node, color):
        """
                    Colors a node in the linear diagram.

                    Colors a node in the linear diagram. Color can be the name of color or hexadecimal value.

                    Parameters
                    ----------
                    node : str
                        The name of the node to be colored in the diagram.
                    color : str
                        The name of the color or the hexadecimal value.


                    """
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_color(color)

    @staticmethod
    def highlight_out(node):
        """
            Highlights out a node in the linear diagram.

            Highlights out a node in the linear diagram. Highlights all the edges leading out of a node.

            Parameters
            ----------
            node : str
                The name of the node to be highlighted out in the diagram.


            """
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_highlighted_out()

    @staticmethod
    def highlight_in(node):
        """
            Highlights in a node in the linear diagram.

            Highlights in a node in the linear diagram. Highlights all the edges leading into a node.

            Parameters
            ----------
            node : str
                The name of the node to be highlighted in the diagram.


            """
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_highlighted_in()

    @staticmethod
    def create_box(box_name):
        """
            Creates a box for the linear diagram.

            Creates a box for the linear diagram. Nodes can be added to a box.

            Parameters
            ----------
            box_name : str
                The name of the box to be created.


            """
        LinearDiagram.boxes.append(box_name)

    @staticmethod
    def add_to_box(node, box_name):
        """
            Adds a node to a box for the linear diagram.

            Adds a node to a box for the linear diagram. Box should be created before adding nodes to it. 

            Parameters
            ----------
            node : str
                The name of the node to be added to a box.
            box_name : str
                The name of the box the node should be added to.

            """
        for n in Node.get_nodes():
            if n.get_name() == node:
                n.set_box_name(box_name)
