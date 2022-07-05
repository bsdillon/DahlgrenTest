from tkinter import *
from tkinter import filedialog as fd

from MBSE_Library.MBSE_Library.core import *
import MBSE_Library.MBSE_Library.linear_diagrams.node


class LinearDiagrams:
    Highlighted_in = [""]
    Highlighted_out = [""]
    deleted = [""]

    def __init__(self, SDAMT, i, frame2):
        self.SDAMT = SDAMT
        self.frame2 = frame2
        self.i = i
        self.h_i = StringVar()
        self.h_o = StringVar()
        self.d = StringVar()
        self.my_var1 = IntVar()
        self.update_options()

    def update_options(self):
        self.h_i.set(self.Highlighted_in[0])  # default value
        in_list = OptionMenu(self.frame2, self.h_i, *self.Highlighted_in)
        in_list.grid(row=4, column=1)

        self.h_o.set(self.Highlighted_in[0])  # default value
        out_list = OptionMenu(self.frame2, self.h_o, *self.Highlighted_out)
        out_list.grid(row=5, column=1)

        self.d.set(self.Highlighted_in[0])  # default value
        del_list = OptionMenu(self.frame2, self.d, *self.deleted)
        del_list.grid(row=6, column=1)

        self.h_i.set(self.Highlighted_in[0])  # default value
        in_list = OptionMenu(self.frame2, self.h_i, *self.Highlighted_in)
        in_list.grid(row=4, column=1)

        self.h_o.set(self.Highlighted_in[0])  # default value
        out_list = OptionMenu(self.frame2, self.h_o, *self.Highlighted_out)
        out_list.grid(row=5, column=1)

        self.d.set(self.Highlighted_in[0])  # default value
        del_list = OptionMenu(self.frame2, self.d, *self.deleted)
        del_list.grid(row=6, column=1)

        load_f = Button(self.frame2, text='Load file', command=self.load_file)
        load_f.grid(row=0, column=0)
        r1 = Radiobutton(self.frame2, text='Communication', variable=self.my_var1, value=0, command=self.view_selected)
        r2 = Radiobutton(self.frame2, text='Sequence', variable=self.my_var1, value=1, command=self.view_selected)
        r1.grid(row=1, column=0)
        r2.grid(row=1, column=1)
        add_node = Button(self.frame2, text='Create a new node')
        add_node.grid(row=2, column=0)
        add_relationship = Button(self.frame2, text='Create a new relationship')
        add_relationship.grid(row=3, column=0)

        highlight_in = Button(self.frame2, text='Highlight in', command=self.highlight_in)
        highlight_in.grid(row=4, column=0)

        highlight_out = Button(self.frame2, text='Highlight out', command=self.highlight_out)
        highlight_out.grid(row=5, column=0)

        delete_node = Button(self.frame2, text='Delete node', command=self.delete)
        delete_node.grid(row=6, column=0)

    def run_image(self, image):
        img2 = PhotoImage(file=image)
        self.i.configure(image=img2)
        self.i.image = img2

    def view_selected(self):
        options = self.my_var1.get()
        self.update_options()
        if options == 0:
            MBSE.print_uml("communication")
            self.run_image("communication_diagram_plantuml.png")
        elif options == 1:
            MBSE.print_uml("sequence")
            self.run_image("sequence_diagram_plantuml.png")

    #######################
    # Commands for Linear #
    #######################
    def load_file(self):
        filetypes = (
            ('Text files', '*.txt'),
            ('CSV files', '*.csv*')
        )

        filename = fd.askopenfilename(title='Open a file', initialdir='/', filetypes=filetypes)
        self.load_from_file(filename)

    def load_from_file(self, filename):
        MBSE.load_file(filename)
        for n in MBSE_Library.MBSE_Library.linear_diagrams.node.Node.get_nodes():
            self.Highlighted_in.append(n.get_name())
            self.Highlighted_out.append(n.get_name())
            self.deleted.append(n.get_name())
        MBSE.print_uml()
        self.view_selected()

    def highlight_in(self):
        MBSE.highlight_in(self.h_i.get())
        self.view_selected()

    def highlight_out(self):
        MBSE.highlight_out(self.h_o.get())
        self.view_selected()

    def delete(self):
        MBSE.set_unimportant(self.d.get())
        self.view_selected()
