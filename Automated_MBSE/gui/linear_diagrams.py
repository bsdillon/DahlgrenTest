from tkinter import *
from tkinter import filedialog as fd

from MBSE_Library.core import *
import MBSE_Library.linear_diagrams.node


class LinearDiagrams:
    Highlighted_in = [""]
    Highlighted_out = [""]
    deleted = [""]
    colored = [""]

    def __init__(self, SDAMT, i, frame2):
        self.SDAMT = SDAMT
        self.frame2 = frame2
        self.i = i
        self.h_i = StringVar()
        self.h_o = StringVar()
        self.d = StringVar()
        self.c = StringVar()
        self.c_color = StringVar()
        self.my_var1 = IntVar()
        self.update_options()
        self.color_type = StringVar()

    def update_options(self):
        self.h_i.set(LinearDiagrams.Highlighted_in[0])  # default value
        in_list = OptionMenu(self.frame2, self.h_i, *self.Highlighted_in)
        in_list.grid(row=4, column=1)

        self.h_o.set(self.Highlighted_out[0])  # default value
        out_list = OptionMenu(self.frame2, self.h_o, *self.Highlighted_out)
        out_list.grid(row=5, column=1)

        self.d.set(self.deleted[0])  # default value
        del_list = OptionMenu(self.frame2, self.d, *self.deleted)
        del_list.grid(row=6, column=1)

        self.c.set(self.colored[0])  # default value
        col_list = OptionMenu(self.frame2, self.c, *self.colored)
        col_list.grid(row=7, column=1)

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
            ('CSV files', '*.csv*'),
            ('Text files', '*.txt')
        )

        filename = fd.askopenfilename(title='Open a file', initialdir='/', filetypes=filetypes)
        self.load_from_file(filename)

    def load_from_file(self, filename):
        MBSE.load_file(filename)
        for n in MBSE_Library.linear_diagrams.node.Node.get_nodes():
            self.Highlighted_in.append(n.get_name())
            self.Highlighted_out.append(n.get_name())
            self.deleted.append(n.get_name())
            self.colored.append(n.get_name())
        self.view_selected()

    def highlight_in(self):
        MBSE.highlight_in(self.h_i.get())
        self.Highlighted_in.remove(self.h_i.get())
        self.view_selected()

    def highlight_out(self):
        MBSE.highlight_out(self.h_o.get())
        self.Highlighted_out.remove(self.h_o.get())
        self.view_selected()

    def delete(self):
        MBSE.set_unimportant(self.d.get())
        self.deleted.remove(self.d.get())
        self.view_selected()

    def color(self):
        window = Toplevel(self.SDAMT)
        window.title("Add color")

        color_label = Label(window, text='Color', font=('calibre', 10, 'bold'))
        color_entry = Entry(window, textvariable=self.color_type, font=('calibre', 10, 'normal'))
        sub_btn = Button(window, text='Submit', command=self.submit_new_color)
        color_label.grid(row=0, column=0)
        color_entry.grid(row=0, column=1)
        sub_btn.grid(row=2, column=1)
        window.mainloop()

    def submit_new_color(self):
        MBSE.color(self.c.get(), self.color_type.get())
        self.colored.remove(self.c.get())
        self.view_selected()
