from tkinter import *

from MBSE_Library.core import *


class CodeDiagrams:
    def __init__(self, SDAMT, i):
        self.SDAMT = SDAMT
        self.i = i
        self.class_var = StringVar()
        self.package_var = StringVar()
        self.method_var = StringVar()
        self.variable_var = StringVar()
        self.return_type_var = StringVar()
        self.modifier_var = StringVar()
        self.static_var = IntVar()
        self.c_sender = StringVar()
        self.c_receiver = StringVar()
        self.c_type = StringVar()

    def new_package(self):
        window = Toplevel(self.SDAMT)
        window.title("Add new package")

        sub_btn = Button(window, text='Submit', command=self.submit_new_package)
        package_label = Label(window, text='Package Name', font=('calibre', 10, 'bold'))
        package_entry = Entry(window, textvariable=self.package_var, font=('calibre', 10, 'normal'))
        package_label.grid(row=0, column=0)
        package_entry.grid(row=0, column=1)
        sub_btn.grid(row=1, column=1)
        window.mainloop()

    def submit_new_package(self):
        package_name = self.package_var.get()
        MBSE.create_package(package_name)
        MBSE.print_uml("code")
        self.run_image("code_diagram.png")

    def new_class(self):
        window = Toplevel(self.SDAMT)
        window.title("Add new class")

        class_label = Label(window, text='Class Name', font=('calibre', 10, 'bold'))
        class_entry = Entry(window, textvariable=self.class_var, font=('calibre', 10, 'normal'))
        sub_btn = Button(window, text='Submit', command=self.submit_new_class)
        class_label.grid(row=0, column=0)
        class_entry.grid(row=0, column=1)
        package_label = Label(window, text='Package Name (Optional)', font=('calibre', 10, 'bold'))
        package_entry = Entry(window, textvariable=self.package_var, font=('calibre', 10, 'normal'))
        package_label.grid(row=1, column=0)
        package_entry.grid(row=1, column=1)
        sub_btn.grid(row=2, column=1)
        window.mainloop()

    def submit_new_class(self):
        class_name = self.class_var.get()
        package_name = self.package_var.get()
        if package_name == "":
            MBSE.create_class(class_name)
        else:
            MBSE.create_class(class_name, package_name)
        MBSE.print_uml("code")
        self.run_image("code_diagram.png")

    def new_method(self):
        window = Toplevel(self.SDAMT)
        window.title("Add new method")

        method_label = Label(window, text='Method Name', font=('calibre', 10, 'bold'))
        method_entry = Entry(window, textvariable=self.method_var, font=('calibre', 10, 'normal'))
        method_label.grid(row=0, column=0)
        method_entry.grid(row=0, column=1)
        class_label = Label(window, text='Class Name', font=('calibre', 10, 'bold'))
        class_entry = Entry(window, textvariable=self.class_var, font=('calibre', 10, 'normal'))
        class_label.grid(row=1, column=0)
        class_entry.grid(row=1, column=1)

        check = Checkbutton(window, text='Static?', variable=self.static_var, onvalue=1, offvalue=0)
        check.grid(row=4, column=0)

        return_type = Label(window, text='Return Type (Optional)', font=('calibre', 10, 'bold'))
        return_type_entry = Entry(window, textvariable=self.return_type_var, font=('calibre', 10, 'normal'))
        return_type.grid(row=3, column=0)
        return_type_entry.grid(row=3, column=1)

        modifier = Label(window, text='Modifier (Optional)', font=('calibre', 10, 'bold'))
        modifier_entry = Entry(window, textvariable=self.modifier_var, font=('calibre', 10, 'normal'))
        modifier.grid(row=2, column=0)
        modifier_entry.grid(row=2, column=1)

        sub_btn = Button(window, text='Submit', command=self.submit_new_method)
        sub_btn.grid(row=5, column=1)
        window.mainloop()

    def submit_new_method(self):
        method_name = self.method_var.get()
        class_name = self.class_var.get()
        return_type = self.return_type_var.get()
        modifier = self.modifier_var.get()
        static = self.static_var.get()
        is_static = False
        if static == 1:
            is_static = True
        MBSE.add_method_to_class(method_name, class_name, modifier, is_static, return_type)
        MBSE.print_uml("code")
        self.run_image("code_diagram.png")

    def new_variable(self):
        window = Toplevel(self.SDAMT)
        window.title("Add new variable")

        method_label = Label(window, text='Variable Name', font=('calibre', 10, 'bold'))
        method_entry = Entry(window, textvariable=self.variable_var, font=('calibre', 10, 'normal'))
        method_label.grid(row=0, column=0)
        method_entry.grid(row=0, column=1)
        class_label = Label(window, text='Class Name', font=('calibre', 10, 'bold'))
        class_entry = Entry(window, textvariable=self.class_var, font=('calibre', 10, 'normal'))
        class_label.grid(row=1, column=0)
        class_entry.grid(row=1, column=1)

        check = Checkbutton(window, text='Static?', variable=self.static_var, onvalue=1, offvalue=0)
        check.grid(row=4, column=0)

        return_type = Label(window, text='Return Type (Optional)', font=('calibre', 10, 'bold'))
        return_type_entry = Entry(window, textvariable=self.return_type_var, font=('calibre', 10, 'normal'))
        return_type.grid(row=3, column=0)
        return_type_entry.grid(row=3, column=1)

        modifier = Label(window, text='Modifier (Optional)', font=('calibre', 10, 'bold'))
        modifier_entry = Entry(window, textvariable=self.modifier_var, font=('calibre', 10, 'normal'))
        modifier.grid(row=2, column=0)
        modifier_entry.grid(row=2, column=1)

        sub_btn = Button(window, text='Submit', command=self.submit_new_variable)
        sub_btn.grid(row=5, column=1)
        window.mainloop()

    def submit_new_variable(self):
        variable_name = self.variable_var.get()
        class_name = self.class_var.get()
        return_type = self.return_type_var.get()
        modifier = self.modifier_var.get()
        static = self.static_var.get()
        is_static = False
        if static == 1:
            is_static = True
        MBSE.add_variable_to_class(variable_name, class_name, modifier, is_static, return_type)
        MBSE.print_uml("code")
        self.run_image("code_diagram.png")

    def new_class_relationship(self):
        window = Toplevel(self.SDAMT)
        window.title("Add new relationship")

        class_label = Label(window, text='Sender Class', font=('calibre', 10, 'bold'))
        class_entry = Entry(window, textvariable=self.c_sender, font=('calibre', 10, 'normal'))
        sub_btn = Button(window, text='Submit', command=self.submit_new_relationship)
        class_label.grid(row=0, column=0)
        class_entry.grid(row=0, column=1)
        package_label = Label(window, text='Receiver Class', font=('calibre', 10, 'bold'))
        package_entry = Entry(window, textvariable=self.c_receiver, font=('calibre', 10, 'normal'))
        package_label.grid(row=1, column=0)
        package_entry.grid(row=1, column=1)
        label = Label(window, text='Relationship Type', font=('calibre', 10, 'bold'))
        entry = Entry(window, textvariable=self.c_type, font=('calibre', 10, 'normal'))
        label.grid(row=2, column=0)
        entry.grid(row=2, column=1)
        sub_btn.grid(row=3, column=1)
        window.mainloop()

    def submit_new_relationship(self):
        class_sender = self.c_sender.get()
        class_receiver = self.c_receiver.get()
        class_relationship = self.c_type.get()
        MBSE.add_relationship(class_sender, class_receiver, class_relationship)
        MBSE.print_uml("code")
        self.run_image("code_diagram.png")

    def run_image(self, image):
        img2 = PhotoImage(file=image)
        self.i.configure(image=img2)
        self.i.image = img2
