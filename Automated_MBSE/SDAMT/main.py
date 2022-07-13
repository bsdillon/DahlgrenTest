from tkinter import *
from tkinter import ttk

from MBSE_Library import MBSE
from gui import CodeDiagrams
from gui import LinearDiagrams


class Main:
    def __init__(self, SDAMT, i):
        self.SDAMT = SDAMT
        self.i = i
        self.build()

    def build(self):
        MBSE.load("project1")

        notebook = ttk.Notebook(self.SDAMT)
        notebook.grid(row=0, column=0, sticky=W)
        frame2 = ttk.Frame(notebook, width=400, height=700)

        cd = CodeDiagrams(self.SDAMT, self.i)
        ld = LinearDiagrams(self.SDAMT, self.i, frame2)

        #####################
        # Class Diagram tab #
        #####################
        frame1 = ttk.Frame(notebook, width=400, height=720)
        add_package = Button(frame1, text='Create a package', command=cd.new_package)
        add_package.grid(row=0, column=0)
        add_class = Button(frame1, text='Create a new class', command=cd.new_class)
        add_class.grid(row=1, column=0)
        add_variable = Button(frame1, text='Create a new variable', command=cd.new_variable)
        add_variable.grid(row=2, column=0)
        add_method = Button(frame1, text='Create a new method', command=cd.new_method)
        add_method.grid(row=3, column=0)
        add_r = Button(frame1, text='Add a relationship', command=cd.new_class_relationship)
        add_r.grid(row=4, column=0)

        ######################
        # Linear Diagram tab #
        ######################
        load_f = Button(frame2, text='Load file', command=ld.load_file)
        load_f.grid(row=0, column=0)
        r1 = Radiobutton(frame2, text='Communication', variable=ld.my_var1, value=0, command=ld.view_selected)
        r2 = Radiobutton(frame2, text='Sequence', variable=ld.my_var1, value=1, command=ld.view_selected)
        r1.grid(row=1, column=0)
        r2.grid(row=1, column=1)
        add_node = Button(frame2, text='Create a new node')
        add_node.grid(row=2, column=0)
        add_relationship = Button(frame2, text='Create a new relationship')
        add_relationship.grid(row=3, column=0)
        highlight_in = Button(frame2, text='Highlight in', command=ld.highlight_in)
        highlight_in.grid(row=4, column=0)
        highlight_out = Button(frame2, text='Highlight out', command=ld.highlight_out)
        highlight_out.grid(row=5, column=0)
        delete_node = Button(frame2, text='Delete node', command=ld.delete)
        delete_node.grid(row=6, column=0)
        color_node = Button(frame2, text='Color node', command=ld.color)
        color_node.grid(row=7, column=0)

        frame1.grid(row=0, column=0, sticky=W)
        frame2.grid(row=0, column=0, sticky=W)

        notebook.add(frame1, text='Code Diagrams')
        notebook.add(frame2, text='Linear Diagrams')
        print("Compiled Successfully")


if __name__ == '__main__':
    SDAMT = Tk()
    SDAMT.title("Structured Data Analysis and Modeling Tool")
    image = "random.png"
    img = PhotoImage(file=image)
    i = Label(SDAMT, width=880, height=720, image=img)
    i.grid(row=0, column=2, columnspan=2, rowspan=2, padx=5, pady=5)
    Main(SDAMT, i)
    mainloop()
