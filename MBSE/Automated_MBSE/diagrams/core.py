import os
import sys
import csv
import pickle
import traceback
import subprocess
from PIL import Image
from parts.puml_class import PlantumlClass
from parts.puml_package import PlantumlPackage
from diagrams.code import CodeDiagram
from diagrams.linear import LinearDiagram
from diagrams.status import StatusDiagram
from diagrams.usecase import UseCaseDiagram
from diagrams.swimlane import SwimLaneDiagram

IMAGE_MAX_X=1500
IMAGE_Y_MAX=1500

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
        else:
            CodeDiagram.print_code_diagram()
            CodeDiagram.print_method_diagram()
            try:
                os.system('cmd /c "java -jar plantuml.jar -tsvg code_diagram.txt method_diagram.txt '
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

    def outputUML(fileName):
        """
           uses plantUML to produce a series of diagrams and tries 
           to limit them into a subset by stacking side-by-side.
           Most effective for sequence diagrams.
        """
        def formatcount(c):
            txt = str(c)
            return ("0"*(3-len(txt)))+txt

        try:
            stem = fileName[0:-4]
            ext = "png"
            name = stem+"."+ext
            listFiles = []

            #builds all the images
            subprocess.call('java -jar plantuml.jar '+fileName)

            print("Image "+name)
            tmp = Image.open(name)
            maxX, Ymax = tmp.size
            totalX = maxX
            Ytotal = Ymax

            count = 0
            while os.path.isfile(name):
                listFiles.append(name)
                tmp = Image.open(name)
                x, y = tmp.size
                if x>maxX:
                    maxX=x
                totalX = totalX + x

                if y>Ymax:
                    Ymax=y
                Ytotal = Ytotal + y

                count = count + 1
                num = formatcount(count)
                name = stem+"_"+num+"."+ext


            # creates a new empty image, RGB mode @ max page size
            actualX = max(IMAGE_MAX_X,maxX)
            Yactual = max(IMAGE_Y_MAX,Ymax)

            new_image = Image.new('RGB', (actualX,Yactual) )
            new_image.paste( (255,255,255), (0, 0, actualX, Yactual) )

            currentX = 0
            count = 0
            name = "./images/"+stem+"."+ext
            for lf in listFiles:
                tmp = Image.open(lf)

                #if the file exceeds our size, create a next image
                x, y = tmp.size
                nextX = currentX + x
                if nextX > actualX: #insufficient space for paste
                    new_image.save(name) #save the file

                    count = count + 1    #create new file
                    num = formatcount(count)
                    name = stem+num+"."+ext

                    new_image = Image.new('RGB', (actualX,Yactual) ) #create new image
                    new_image.paste( (255,255,255), (0, 0, actualX, Yactual) )
                    currentX=0

                #paste image
                new_image.paste(tmp, (currentX,0) )
                os.remove(lf)
                currentX = currentX + x               

            new_image.save(name) #save last file

        except Exception as ex:
            traceback.print_exc()
            print("Error: "+str(ex))

    ##################
    # Linear Diagrams#
    ##################
    currentLinearDiagram = None

    @staticmethod
    def createLinearDiagram(filename):
        """
            Loads a CSV file.

            Loads a CSV file to create a linear diagram. Can be a .csv or .txt

            Parameters
            ----------
            filename : str
                The name of the file to load to data from.

            """
        MBSE.currentLinearDiagram = LinearDiagram(filename)
        return MBSE.currentLinearDiagram

    #####################
    # Swim Lane Diagrams#
    #####################
    currentSwimLaneDiagram = None

    @staticmethod
    def createSwimLaneDiagram(file):
        MBSE.currentSwimLaneDiagram = SwimLaneDiagram(file)
        return MBSE.currentSwimLaneDiagram

    ####################
    # Use Case Diagrams#
    ####################
    currentUseCaseDiagram = None

    @staticmethod
    def createUseCaseDiagram():
        MBSE.currentUseCaseDiagram = UseCaseDiagram()
        return MBSE.currentUseCaseDiagram

    ##################
    # Status Diagrams#
    ##################
    currentStatusDiagram = None

    @staticmethod
    def createStatusDiagram(filename, dict):
        """
            Loads a CSV file.

            Loads a CSV file to create a linear diagram. Can be a .csv or .txt

            Parameters
            ----------
            filename : str
                The name of the file to load to data from.

            """
        MBSE.currentStatusDiagram = StatusDiagram(filename, dict)
        return MBSE.currentStatusDiagram

