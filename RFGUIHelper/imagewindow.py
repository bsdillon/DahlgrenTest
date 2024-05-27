from random import randint
import tkinter as tk
from tkinter import messagebox, ttk, filedialog as fd
from PIL import Image, ImageTk
from imageUpdate import ImageUpdater
from tkinter.simpledialog import askstring
from logmanagement import LogManager

class SelectionState:
    INACTIVE = 0
    SELECT_FIRST = 1
    SELECT_SECOND = 2
    MAX = 3

class ImageWindow(ImageUpdater):
    MAIN_COLOR = "#FF000080"
    IMPORT_COLOR = "#0000FF80"
    
    GROUP_COLORS = [
        "#FF800080",#orange
        "#ec3f0780",#dkOrange
        "#FFFF0040",#yellow
        "#80692580",#dkyellow
        "#00FF0080",#green
        "#00800080",#dkgreen
        "#00FFFF80",#cyan
        "#00808080",#dkcyan
        "#FF00FF80",#magenta
        "#80008080",#dkmagenta
    ]
    
    def __init__(self, master, image_path):
        self.logger = LogManager("ImageWindow")
        self.logger.trace(f"Start ImageWindow Load", indent_delta=1)
        self.group_assignments={}
        self.master = master
        self.image_path = image_path

        top = tk.Toplevel(master.window)
        self.top = top
        top.protocol("WM_DELETE_WINDOW", self.master.close_project)
        top.title("Image Window")

        self.foreign_views = {}
        self.current_overlays = {}
        self.image_list = {}
        self.raw_image=None
        self.tk_image=None
        throwaway = tk.Label(top, text='Select View:')
        throwaway.grid(row=0, column=0, sticky=tk.W)

        self.selected_image = tk.StringVar()
        self.image_combo = ttk.Combobox(top, textvariable=self.selected_image)
        self.image_combo.bind('<<ComboboxSelected>>', self.change_selected_image)
        self.image_combo.grid(row=0, column=1, sticky=tk.W)
        self.current_view = None

        throwaway = tk.Label(top, text='    ')
        throwaway.grid(row=0, column=2, sticky=tk.W+tk.E)

        throwaway = tk.Button(top, text='Import Widget', command=self.master.import_widget)
        throwaway.grid(row=0, column=3, sticky=tk.E)

        self.selection_stage = SelectionState.INACTIVE
        self.instructions = tk.Label(top, text='Load a GUI Image')
        self.instructions.config(anchor=tk.CENTER)
        self.instructions.grid(row=1, column=0, columnspan=4, sticky=tk.W+tk.E)

        HEIGHT = 500
        WIDTH = 500
        self.top.geometry(str(WIDTH)+'x'+str(HEIGHT))
        self.top.rowconfigure(index=2, weight=1)
        self.top.columnconfigure(index=3, weight=1)
        frame2 = tk.Frame(top, width=WIDTH, height=HEIGHT, bg="#000000")
        frame2.grid(row=2, column=0, columnspan=4, sticky=tk.N+tk.E+tk.W+tk.S)

        self.canvas = tk.Canvas(frame2, bg='#dddddd', width=300, height=300, scrollregion=(0,0,300,300))
        self.image_container = self.canvas.create_image(0, 0, anchor="nw")
        self.canvas.bind("<Button 1>", self.click_canvas)

        self.scrollbar_vertical = ttk.Scrollbar(frame2, orient="vertical", command=self.canvas.yview)
        self.scrollbar_horizontal = ttk.Scrollbar(frame2, orient="horizontal", command=self.canvas.xview)
        
        self.scrollbar_vertical.pack(side="right", fill="y")
        self.scrollbar_horizontal.pack(side="bottom", fill="x")
        self.canvas.pack(side="left", fill="both", expand=True)

        scrollable_frame = ttk.Frame(self.canvas)
        scrollable_frame.pack(side="left", fill="both", expand=True)
        scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(
                scrollregion=self.canvas.bbox("all")
            )
        )

        self.canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=self.scrollbar_vertical.set)
        self.canvas.configure(xscrollcommand=self.scrollbar_horizontal.set)
        self.canvas.update()
        self.logger.trace(f"End ImageWindow Load", indent_delta=-1)

    #-----------------------------------------------#
    #           ImageUpdate role interface          #
    #                     Start                     #
    #-----------------------------------------------#
    def get_view_list(self):
        #Part of ImageUpdate role interface
        return list(self.image_list.keys())

    def get_image_save_path(self):
        #Part of ImageUpdate role interface
        return self.image_path

    def get_image_bounds(self):
        #Part of ImageUpdate role interface
        return [self.raw_image.width, self.raw_image.height]

    def crop_image(self, x, y, w, h, tk_image=True, specific_view=None):
        #Part of ImageUpdate role interface
        if specific_view:
            file = self.image_list[specific_view]
        else:
            file = self.image_list[self.current_view]

        img1 = Image.open(file).crop((x, y, x+w, y+h))
        if tk_image:
            return ImageTk.PhotoImage(img1)
        else:
            return img1
    #-----------------------------------------------#
    #           ImageUpdate role interface          #
    #                      End                      #
    #-----------------------------------------------#

    def set_location(self, x, y):
        '''
        Moves the ImageWindow to (x,y)
        '''
        self.top.geometry("+%d+%d" %(x, y))

    def get_location(self):
        '''
        Returns the current location of the window (x,y)
        '''
        return [self.top.winfo_x(), self.top.winfo_y()]

    def force_selected_image(self, view_name):
        '''
        Changes the current view programmatically instead of from a user event
        '''
        self.logger.trace(f"Start {view_name}", indent_delta=1)
        try:
            #Find the position of that view name within the combo box
            index = self.image_combo['values'].index(view_name)
            #force the selection to update
            self.image_combo.current(index)
            self.change_selected_image(view_name)
        except ValueError:
            #there is no fault here, just that name doesn't work.
            self.logger.debug(f"Failed to find {view_name} in list of views.")
            
        self.logger.trace(f"End", indent_delta=-1)

    def change_selected_image(self, _):
        '''
        Generated from a change in the combo that selects the view.
        The method loads the new image into place and notifies the main window.
        '''

        self.current_view = self.selected_image.get()
        if self.current_view == "": #Occurs when the window is created and before an image is selected
            return

        self.logger.trace(f"Start {self.current_view}", indent_delta=1)
        self.raw_image = Image.open(self.image_list[self.current_view])
        self.tk_image = ImageTk.PhotoImage(self.raw_image)
        self.canvas.itemconfig(self.image_container, image=self.tk_image)
        self.canvas.config(scrollregion=(0, 0, self.raw_image.width, self.raw_image.height))
        self.canvas.update()
        
        #coordinate with the main window
        self.master.view_change(self.current_view)
        
        #We are in a new state machine.
        self.restart_state_machine()
        self.logger.trace(f"End", indent_delta=-1)
        
    def add_group(self, group_name):
        '''
        Sets of related widgets are defined as a group.
        Adds a (new) group with a specific color. 
        '''
        if group_name in self.group_assignments:
            #If the group has already been seen; no further action is needed.
            return
        
        self.logger.trace(f"Start", indent_delta=1)

        #if we are out of pre-defined colors, we need to create a random one
        used_colors = list(self.group_assignments.values())
        if len(used_colors)>=len(ImageWindow.GROUP_COLORS):
            txt = "#"
            for i in range(6):
                txt += hex(randint(0, 15))[-1:]
            self.group_assignments[group_name] = txt
            self.logger.trace(f"End", indent_delta=-1)
            return
        
        #if we are still in the set of pre-defined colors, simply increment.
        self.group_assignments[group_name]=ImageWindow.GROUP_COLORS[len(self.group_assignments)]
        self.logger.trace(f"End", indent_delta=-1)
        
    def delete_group(self, group_name):
        '''
        Sets of related widgets are defined as a group.
        Deletes any exiting group, but does not revise the sets of colors. 
        #TODO it may be that we are misordering the colors.
        '''
        #deletes any recognized groups 
        if group_name in self.group_assignments:
            self.logger.trace(f"Start", indent_delta=1)
            del self.group_assignments[group_name]
            self.logger.trace(f"End", indent_delta=-1)
    
    def load_image_names(self, image_list):
        '''
        Accepts a dictionary of view name: view image path pairs.
        These are loaded into the set of selectable images and the combo box.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        #first remember the existing value if it exists
        value = self.selected_image.get()
        
        self.image_list = image_list
        self.image_combo['values'] = list(image_list.keys())
        
        #by default the first image in the list is selected
        nv = list(image_list.keys())[0]
        self.selected_image.set(nv)
        self.current_view = nv
        self.change_selected_image(None)
        self.logger.trace(f"End", indent_delta=-1)

    def restart_state_machine(self):
        '''
        Called internally to consistently control the click state machine
        '''
        self.instructions.config(text="Select First Point")
        self.selection_stage = SelectionState.SELECT_FIRST

    def click_canvas(self, event):
        '''
        This is generated by a mouse click on the main image. It runs in a state machine.
        First click must always be the upper left.
        Second click must always be the lower right.
        
        After the second click, a new overlay is generated
        
        The machine resests after the second click regardless.
        
        event has event.x and event.y components.
        '''
        if not self.raw_image: #no effect until image loads
            return

        self.logger.trace(f"Start", indent_delta=1)
        loc = [self.canvas.canvasx(event.x), self.canvas.canvasy(event.y)]
        self.logger.debug(f"Mouse location: {loc}")
        if loc[0]>self.raw_image.width or loc[1]>self.raw_image.height:
            messagebox.showerror(title="Click Error", message="All points must be on the image", parent=self.top)
            self.restart_state_machine()
            self.logger.trace(f"End - FAIL", indent_delta=-1)
            return

        #state machine update
        if self.selection_stage == SelectionState.SELECT_FIRST:
            self.logger.trace("Select first point")
            self.instructions.config(text="Select Second Point")
            self.first_coordinate = [loc[0], loc[1]]
            self.selection_stage = SelectionState.SELECT_SECOND
        elif self.selection_stage == SelectionState.SELECT_SECOND:
            self.logger.trace("Select second point")
            self.second_coordinate = [loc[0], loc[1]]
            if (self.second_coordinate[0]<=self.first_coordinate[0]) or (self.second_coordinate[1]<=self.first_coordinate[1]):
                #error state restarts the clicking process
                messagebox.showerror(title="Click Error", message="Second point MUST be right and below first point", parent=self.top)
                self.restart_state_machine()
                self.logger.trace(f"End - FAIL", indent_delta=-1)
                return

            self.master.new_widget(self.current_view, self.first_coordinate[0], self.first_coordinate[1], self.second_coordinate[0]-self.first_coordinate[0], self.second_coordinate[1]-self.first_coordinate[1])

            #either completed or not, restart the machine
            self.restart_state_machine()
        self.logger.trace(f"End", indent_delta=-1)

    def update_widget_overlays(self, widget, dx=0, dy=0):
        '''
        Called externally to delete and then revise the overlays for the given widget
        
        dx (optional) - the horizontal offset for a foreign widget in this view 
        dy (optional) - the vertical offset for a foreign widget in this view 
        '''
        if not self.master.is_in_view(widget):
            return

        widget_name = widget.get_value("name")
        self.logger.trace(f"Start: {widget_name}", indent_delta=1)

        #remove any existent overlay for this widget        
        self.logger.debug(f"Deleting overlays for widget: {widget_name} during an individual update.")
        self.delete_overlays(widget)

        #identify the group if one exists
        group = None
        if widget.has_value("Group"):
            group = widget.get_value("Group")
            self.add_group(group)

        #create and introduce the new overlay
        temp_overlay = self.create_overlay(
                                            widget_name, 
                                            int(widget.get_value("X"))+dx,#Note the dx,dy offset
                                            int(widget.get_value("Y"))+dy,
                                            widget.get_value("width"),
                                            widget.get_value("height"),
                                            widget.get_value("view")!=self.current_view,
                                            group=group)
        self.current_overlays[widget_name]=temp_overlay
        self.logger.debug(f"Saved overlay for {widget_name}")
        self.logger.debug(f"Overlays {list(self.current_overlays.keys())}")

        self.logger.trace(f"End", indent_delta=-1)

    def delete_overlays(self, widget):
        '''
        Delete any existing overlay for this widget as they may be outdated
        after editing the widget's properties.
        '''
        widget_name = widget.get_value("name")
        self.logger.trace(f"Start: {widget_name}", indent_delta=1)
        self.logger.debug(f"Overlays {list(self.current_overlays.keys())}")

        if widget_name in self.current_overlays:
            #widget has overlay, so delete all elements from canvas before rebuild
            temp_overlay = self.current_overlays[widget_name]
            self.logger.debug(f"Deleting overlay for widget: {widget_name}, overlay data: {temp_overlay.__dict__}")
            self.canvas.delete(temp_overlay.text_id2)
            self.canvas.delete(temp_overlay.text_id)
            self.canvas.delete(temp_overlay.rect_id)
            self.canvas.delete(temp_overlay.image_id)
            del self.current_overlays[widget_name]

        self.logger.trace(f"End", indent_delta=-1)

    def create_overlay(self, text, x1_string, y1_string, w_string, h_string, is_foreign, group=None):
        '''
        Called internally to actually generate an overlay with these properties.
        '''
        
        self.logger.trace(f"Start", indent_delta=1)
        #extract the integer values of the position data
        x1 = int(x1_string)
        y1 = int(y1_string)
        w = int(w_string)
        h = int(h_string)

        #Overlays are colored differently for native vs. imported        
        fill=ImageWindow.MAIN_COLOR
        font_color = "#ffff00"
        back_color = "#000000"
        if is_foreign:
            #foreign widgets have a specific text color and fill color; even for groups
            fill = ImageWindow.IMPORT_COLOR
            back_color = "#ffffff"
            font_color = "#0000ff"
        elif group:
            #groups have a specific overlay color that overloads the native color.
            fill = self.group_assignments[group]

        #create the overlay; several id values are used in the overlay management.
        image = Image.new('RGBA', (w, h), fill)
        overlay = ImageTk.PhotoImage(image)
        overlay.image_id = self.canvas.create_image(x1, y1, image=overlay, anchor='nw')
        overlay.rect_id = self.canvas.create_rectangle(x1, y1, x1+w, y1+h)
        overlay.text_id = self.canvas.create_text(x1, y1, text=text, fill=back_color, tags=(text,), font=('Arial','14','bold'))
        overlay.text_id2 = self.canvas.create_text(x1, y1, text=text, fill=font_color, tags=(text,), font=('Arial','14','bold'))
        self.logger.debug(f"Created overlay for {text}")

        #locate the overlay on the screen
        bounds= self.canvas.bbox(overlay.text_id)
        w = (w - (bounds[2]-bounds[0]))/2
        h = (h - (bounds[3]- bounds[1]))/2
        self.canvas.move(overlay.text_id, w, h)
        self.canvas.move(overlay.text_id2, w - 2, h - 2)
        self.logger.trace(f"End", indent_delta=-1)
        return overlay

    #TODO May be OBE
    # def loadImage(self):
    #     name = fd.askopenfilename(parent=self.top, filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
    #     if name == "":
    #         messagebox.showerror(title="Error", message="Image file not found", parent=self.top)
    #         return

    #     project = askstring("Project", "Assign a project name")
    #     if project == "":
    #         messagebox.showerror(title="Error", message="Project name is empty", parent=self.top)
    #         return

    # def get_current_view(self):
    #     return self.current_view

