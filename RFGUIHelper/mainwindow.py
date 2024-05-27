from choicepopup import ChoicePopup
import traceback
import tkinter as tk
from imagewindow import ImageWindow
from tkinter import ttk, messagebox as mb, filedialog as fd, simpledialog as sd
import json
from widget import EditorState, Widget, WidgetEditor
from PIL import Image, ImageTk
from pathlib import Path
import shutil
import os
from widgeterror import WidgetError
from namechecker import NameChecker
from logmanagement import LogManager

PROJECT_EXT = ".json"
THUMBNAIL = (25, 18)

class MainWindow(NameChecker):
    '''
    MainWindow is the coordinator for the the project. It knows all the views, widgets, and their relationships.
    It coordinates with the WidgetEditor to build/edit Widgets.
    It coordinates with the ImageWindow to give the user mouse-based access to the view.
    '''
    TOOL_VERSION = "3.1"

    def __init__(self):
        self.logger = LogManager("MainWindow")
        self.logger.trace(f"Start of initial startup", indent_delta=1)
        self.image_window = None
        self.project_file = None
        self.window = tk.Tk()
        self.window.protocol("WM_DELETE_WINDOW", self.close_window)

        self.menu_bar = tk.Menu(self.window)
        self.window.config(menu=self.menu_bar)
        self.file_menu = tk.Menu(self.menu_bar, tearoff=0)
        self.file_menu.add_command(label="New", command=self.new_project)
        self.file_menu.add_command(label="Open", command=self.open_project)
        self.file_menu.add_command(label="Save", command=self.save_project)
        self.file_menu.add_command(label="Save as...", command=self.save_as_project)
        self.file_menu.add_command(label="Close", command=self.close_project)
        self.file_menu.add_separator()
        self.file_menu.add_command(label="Exit", command=self.close_window)
        self.menu_bar.add_cascade(label="File", menu=self.file_menu)

        throwaway = tk.Menu(self.menu_bar, tearoff=0)
        throwaway.add_command(label="Clear Widgets", command=self.clear_entries)
        throwaway.add_separator()
        throwaway.add_command(label="Add View", command=self.add_view)
        throwaway.add_command(label="Replace View Image", command=self.replace_view_image)
        throwaway.add_command(label="Edit View Name", command=self.edit_view_name)
        throwaway.add_command(label="Delete View", command=self.delete_view)
        self.menu_bar.add_cascade(label="Project Actions", menu=throwaway)
        
        self.window.title("RF GUI WIZARD")
        self.window.geometry("600x500")

        self.view_list = {}
        self.widget_list = {}
        self.tk_images=[] #TODO this can probably be cleaned from time to time; may fill up with unused objects
        self.current_view = None
        self.last_editor = None

        frame = tk.Frame(self.window)
        self.window.rowconfigure(0,weight=1)#forces frame to resize with window
        self.window.columnconfigure(0,weight=1)
        frame.grid(row=0, column=0, sticky=tk.N+tk.S+tk.E+tk.W)

        #Frame2 only serves to allow scrolling of table
        frame2 = tk.Frame(frame, bg="#FF0000")
        frame2.grid(row=1, column=0, columnspan=5, sticky=tk.N+tk.S+tk.E+tk.W)

        frame.columnconfigure(0,weight=1)
        frame.rowconfigure(1,weight=1)#gives frame2 the majority of the space

        column_names = ("name_c", "view_c", "type_c", "X_c", "Y_c", "Width_c", "Height_c")
        self.table = ttk.Treeview(frame2, columns=column_names)
        self.table.column("#0", anchor=tk.CENTER, width=50, stretch=True)
        self.table.column("name_c", anchor=tk.CENTER, width=80)
        self.table.column("view_c", anchor=tk.CENTER, width=80)
        self.table.column("type_c", anchor=tk.CENTER, width=80)
        self.table.column("X_c", anchor=tk.CENTER, width=80)
        self.table.column("Y_c", anchor=tk.CENTER, width=80)
        self.table.column("Width_c", anchor=tk.CENTER, width=80)
        self.table.column("Height_c", anchor=tk.CENTER, width=80)

        self.table.heading("#0", text="Icon")
        self.table.heading("name_c", text="Name")
        self.table.heading("view_c", text="View")
        self.table.heading("type_c", text="Type")
        self.table.heading("X_c", text="X")
        self.table.heading("Y_c", text="Y")
        self.table.heading("Width_c", text="Width")
        self.table.heading("Height_c", text="Height")
        self.table.bind("<Button 1>", self.editWidget)

        self.scrollbar_vertical = ttk.Scrollbar(frame2, orient="vertical", command=self.table.yview)
        self.scrollbar_horizontal = ttk.Scrollbar(frame2, orient="horizontal", command=self.table.xview)
        self.scrollbar_vertical.pack(side="right", fill="y")
        self.scrollbar_horizontal.pack(side="bottom", fill="x")
        self.table.pack(side="left", fill="both", expand=True)

        self.table.configure(yscrollcommand=self.scrollbar_vertical.set)
        self.table.configure(xscrollcommand=self.scrollbar_horizontal.set)

        self.enable_project_menus(False)
        self.logger.trace(f"End of initial startup", indent_delta=-1)

    def is_valid_name(self, name:str):
        #Part of NameChecker role interface
        #This implementation returns True (acceptable) only if the name is unique
        if name in self.widget_list:
            return False
        
        return True
        
    def reload_project(self):
        '''
        Called internally to save, open, and reload the project
        which maintains consistency of the view
        '''
        self.logger.trace(f"Start", indent_delta=1)
        self.export_json()
        current_view = self.current_view
        self.logger.debug(f"Saved current view as {current_view}")
        loc = None
        if self.image_window:
            loc = self.image_window.get_location()
        temp = self.project_file
        
        self.close_project(forced=True)
        self.project_file = temp
        self.import_json()
        if loc:
            self.logger.debug(f"Moving ImageWindow to ({loc[0]}, {loc[1]})")
            self.image_window.set_location(loc[0], loc[1])
            
        if current_view in self.view_list:
            self.logger.trace(f"Current view {current_view} still exists.... Reloading")
            self.image_window.force_selected_image(current_view)
        self.logger.trace(f"End", indent_delta=-1)

    def enable_project_menus(self, project_open):
        '''
        Used internally to (en/dis)able menu items based on whether a project is open or not
        '''
        self.logger.trace(f"Start: {project_open}", indent_delta=1)
        if project_open:
            self.file_menu.entryconfig("New", state="disabled")
            self.file_menu.entryconfig("Open", state="disabled")

            self.menu_bar.entryconfig("Project Actions", state="normal")
            self.file_menu.entryconfig("Save", state="normal")
            self.file_menu.entryconfig("Save as...", state="normal")
            self.file_menu.entryconfig("Close", state="normal")
        else:
            self.file_menu.entryconfig("New", state="normal")
            self.file_menu.entryconfig("Open", state="normal")

            self.menu_bar.entryconfig("Project Actions", state="disabled")
            self.file_menu.entryconfig("Save", state="disabled")
            self.file_menu.entryconfig("Save as...", state="disabled")
            self.file_menu.entryconfig("Close", state="disabled")
        self.logger.trace(f"End", indent_delta=-1)

    #--------------------------------------#
    #            View Utilities            #
    #--------------------------------------#
    def select_image(self):
        '''
        Utility, called internally to work with the user to find an image file for use in a view
        '''
        tmp = fd.askopenfilename(parent=self.window, title="Open a file", filetypes=[("PNG","*.png"), ("PNG","*.PNG"), ("BMP","*.bmp"), ("BMP","*.BMP"),])
        if tmp == "":
            mb.showerror(title="Error", message="Image file not found", parent=self.window)
            return None
        return tmp
    
    def create_new_view_name(self):
        '''
        Utility, called internally to work with the user to find an acceptable view name
        '''
        while True: #infinite loop; we will exit by return/exception
            proposed_name = sd.askstring(parent=self.window, title="View Definition", prompt="\t\tAssign a name to this view\t\t")
            if proposed_name == "" or proposed_name == None:
                #retry
                mb.showerror(title="Error", message="View name is empty", parent=self.window)
            
            if proposed_name in self.view_list:
                #error state; just force it to exit
                raise Exception(f"Duplicate view name: View '{proposed_name}' already exists; please select again.")
            else:
                #acceptable answer
                return proposed_name

    def is_in_view(self, widget):
        '''
        Utility, returns True if the given widget is in the current view (foreign import or native)
        '''
        self.logger.trace(f"Start {self.current_view}", indent_delta=1)
        if self.current_view:
            widget_name = widget.get_value("name")
            view_now = self.view_list[self.current_view]
            if "Widgets" in view_now:
                self.logger.debug(f"Looking for {widget_name} in {view_now['Widgets']}")
                for w in view_now["Widgets"]:
                    if w==widget_name:
                        self.logger.trace(f"End - found", indent_delta=-1)
                        return True
        self.logger.trace(f"End - not found", indent_delta=-1)
        return False
    
    def view_change(self, next_view):
        '''
        Event handler, called externally when the selected view in ImageWindow is
        changed. For MainWindow, this change will remove any widgets from the last
        view and add widgets for the next view.
        '''
        self.logger.trace(f"Start {next_view}", indent_delta=1)
        #get the list of widgets associated with the last view
        widgets_in_last_view = []
        if self.current_view: #only if there WAS a last view
            view_now = self.view_list[self.current_view]
            if "Widgets" in view_now:
                widgets_in_last_view = view_now["Widgets"]
        self.logger.debug(f"List of widgets from OLD view {self.current_view}: {widgets_in_last_view}")

        #get the list of widgets associated with the next view
        self.current_view = next_view
        view_now = self.view_list[next_view]        
        widgets_in_next_view = []
        if "Widgets" in view_now:
            widgets_in_next_view = view_now["Widgets"]
        self.logger.debug(f"List of widgets from NEW view {view_now}: {widgets_in_next_view}")
 
        #update widgets
        self.logger.trace(f"Adding/deleting overlays from various widgets")
        for widget_name in self.widget_list:
            widget = self.widget_list[widget_name]
            if widget_name in widgets_in_next_view: 
                #add new widgets from the next view
                self.logger.debug(f"Adding overlays for widget: {widget_name} during view change.")
                self.image_window.update_widget_overlays(widget)
            elif widget_name in widgets_in_last_view:
                #we ONLY delete it if it is NOT in both views
                self.logger.debug(f"Deleting overlays for widget: {widget_name} during view change.")
                self.image_window.delete_overlays(widget)
        
        #for all foreign groups in a view, update the deltas
        if "Foreign" in view_now:
            self.logger.trace(f"Moving foreign widget groups")
            for foreign_view in view_now["Foreign"]:
                delta = view_now["Foreign"][foreign_view]
                self.logger.trace(f"Moving foreign widget from {foreign_view} to ({delta[0]}, {delta[1]})")
                self.update_foreign_widgets(foreign_view, delta[0], delta[1])    
        self.logger.trace(f"End", indent_delta=-1)

    def add_view(self):
        '''
        Works with the user to create a new view
        '''
        self.logger.trace(f"Start", indent_delta=1)

        # Select the view name
        try:
            view_name = self.create_new_view_name()
        except Exception as ex:
            mb.showerror(title="Error", message=str(ex), parent=self.window)
            self.logger.trace(f"End", indent_delta=-1)
            return
        view_name = view_name.replace(".","_") #We don't want any inadvertant '.' characters

        # Select the source image
        source_image_path = self.select_image()
        if source_image_path == None:
            self.logger.trace(f"End", indent_delta=-1)
            return
        extension = source_image_path.split(".")[-1]
        simple_file = view_name+"."+extension

        #TODO should we open the file and then resave as PNG?
        #copy the file to the save folder
        save_folder = self.get_save_folder()
        destination_image_path = os.path.join(save_folder, simple_file)
        self.view_list[view_name]={"Image":simple_file}
        shutil.copyfile(source_image_path, destination_image_path)
        
        #all done, update data
        mb.showinfo(title="Saving Progress", message="Successfully added")
        self.reload_project()
        self.logger.trace(f"End", indent_delta=-1)

    def select_existing_view(self):
        '''
        Works with the user to select one of the views by name.
        
        Returns a tuple with the name of the view and the corresponding image file.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        save_folder = self.get_save_folder()

        #setup list of view images
        choices = {}
        for view_name in self.view_list:
            image_path = self.view_list[view_name]["Image"]
            choices[view_name]=os.path.join(save_folder, image_path)
        
        cp = ChoicePopup(self.window, title="Select a view", choice_list=list(choices.keys()))
        cp.choice_win.transient(self.window)
        cp.choice_win.grab_set()
        self.window.wait_window(cp.choice_win)
        if len(cp.result)==0:
            mb.showerror(title="Error", message="No view selected", parent=self.window)
            self.logger.trace(f"End", indent_delta=-1)
            return None            

        old_view_name = cp.result[0]

        if not cp.button:
            mb.showerror(title="Error", message="No view selected", parent=self.window)
            self.logger.trace(f"End", indent_delta=-1)
            return None
        full_old_image = choices[old_view_name]
        short_old_image = full_old_image[len(save_folder)+1:]
        new_view_name = short_old_image.split(".")[0]

        self.logger.trace(f"End", indent_delta=-1)
        return [new_view_name, full_old_image]

    def replace_view_image(self):
        '''
        Works with the user to replace the image associated with the view
        '''
        self.logger.trace(f"Start", indent_delta=1)
        selection = self.select_existing_view()
        if selection:
            view_name = selection[0]
            full_old_image = selection[1]

            mb.showinfo(title="Updated image", message="Selecting an image for "+view_name)

            new_image = self.select_image()
            if new_image == None:
                return
            
            #all ready lets delete and replace
            os.remove(full_old_image)
            shutil.copyfile(new_image, full_old_image)
            
            #all done, update data
            mb.showinfo(title="Saving Progress", message="Successfully updated")
            self.reload_project()
        self.logger.trace(f"End", indent_delta=-1)

    def edit_view_name(self):
        '''
        Works with the user to replace the name of a view.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        save_folder = self.get_save_folder()

        selection = self.select_existing_view()
        if selection:
            old_view_name = selection[0]
            full_old_image = selection[1]
            extension = full_old_image.split(".")[-1]

            try:
                view_name = self.create_new_view_name()
            except Exception as ex:
                mb.showerror(title="Error", message=str(ex), parent=self.window)
                self.logger.trace(f"End", indent_delta=-1)
                return

            view_name = view_name.replace(".","_") #We don't want any inadvertant '.' characters
            simple_file = view_name+"."+extension
            copy_name = os.path.join(save_folder, simple_file)

            #changes the name of the image for the view and deletes it
            shutil.copyfile(full_old_image, copy_name)
            os.remove(full_old_image)

            #need to alter ALL of the view members
            old_view = self.view_list[old_view_name]
            del self.view_list[old_view_name]
            self.view_list[view_name]={"Image":simple_file}
            new_view = self.view_list[view_name]
            if "Foreign" in old_view:
                # there are some foreign widgets so we copy the whole thing.
                new_view["Foreign"]= old_view["Foreign"]
            
            if "Widgets" in old_view:
                new_view["Widgets"]=[]
                for widget_name in old_view["Widgets"]:
                    #This is a widget KNOWN TO the old view
                    widget = self.widget_list[widget_name]
                    widget_native_view = widget.get_value("view")
                    if old_view_name==widget_native_view:
                        #this is a native widget in that view
                        widget.setValue("view", view_name)
                    
                        
                    #add it to the new view
                    new_view["Widgets"].append(widget_name)
            
            #all done, update data
            mb.showinfo(title="Saving Progress", message="Successfully renamed")
            self.reload_project()
        self.logger.trace(f"End", indent_delta=-1)

    def delete_view(self):
        '''
        Works with the user to select and delete a view
        '''
        self.logger.trace(f"Start", indent_delta=1)

        selection = self.select_existing_view()
        if selection:
            view_name = selection[0]
            full_old_image = selection[1]

            response = mb.askyesno("Confirm deletion?", "Deleting "+view_name+" may irreversibly delete some widgets.\nAre you sure you want to do this?")

            if response == None:
                self.logger.trace(f"End", indent_delta=-1)
                return response
            elif response: #True for "Yes" option
                os.remove(full_old_image) # file is gone
                del self.view_list[view_name] #view is removed from list

                #BSD
                removable_widgets = []
                for widget_name in self.widget_list:
                    widget = self.widget_list[widget_name]
                    widget_native_view = widget.get_value("view")
                    if widget_native_view == view_name:
                        removable_widgets.append(widget_name)

                for widget_name in removable_widgets:
                    del self.widget_list[widget_name]

                #TODO other actions ????

                #all done, update data
                mb.showinfo(title="Saving Progress", message="Successfully deleted")
                self.reload_project()
        self.logger.trace(f"End", indent_delta=-1)
    
    #--------------------------------------#
    #          Save File Utilities         #
    #--------------------------------------#
    def get_save_folder(self):
        absolute_file_path = Path(self.project_file).absolute()
        return str(absolute_file_path.parent)

    def select_file(self):
        '''
        SelectFile uses tkinter utilities to select a folder/file for saving a project
        
        returns None or a valid file name
        '''
        proposed_file = fd.asksaveasfilename(title="Save a file", filetypes=[("json","*.json")], defaultextension="json")
        if proposed_file == "":
            mb.showerror(title="Error", message="Project could not be saved", parent=self.window)
            return None

        #ensure that the file name ends in .json
        if proposed_file[-5:]!=PROJECT_EXT:
            proposed_file = proposed_file + PROJECT_EXT
        return proposed_file

    def save_project(self):
        '''
        For SaveProject the project file location is already known and is simply reused.
        '''
        if self.project_file == None:
            mb.showerror(title="Error", message="No project is open at this time", parent=self.window)

        self.export_json()

    def save_as_project(self):
        '''
        Selects a new project file location and saves the project
        '''
        if self.project_file == None:
            mb.showerror(title="Error", message="No project is open at this time", parent=self.window)

        temp = self.select_file()
        if temp:
            self.project_file = temp
            self.save_project()        

    def export_json(self):
        '''
        Generates the contents of a JSON and then saves it.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        save_data = {}
        save_folder = self.get_save_folder()
        save_data["Version"] = self.TOOL_VERSION
        
        save_data["Views"] = self.view_list
        widget_list = []
        for widget in list(self.widget_list.values()):
            widget_list.append(widget.to_dict())

            if widget.get_value("type")=='Anchor':
                #updates the icon for that widget
                temp_image_file = self.get_widget_image(widget)
                clean_image_file = self.get_widget_image_name(widget.get_value('name'))
                temp_image_file.save(save_folder+"/"+clean_image_file)

        save_data["Widgets"] = widget_list

        with open(self.project_file, "w") as write_file:
            json.dump(save_data, write_file)
        self.logger.trace(f"End", indent_delta=-1)

    def new_project(self):
        '''
        Works with the user to define a new project with the first view. 
        Creates a new default project file as a result.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        project_file = self.select_file()
        if project_file:
            #There used to be an empty check and an already exists check.
            #This is no longer an issue.        
            self.project_file = project_file

            mb.showinfo(title="Project Initialization", message="Begin by selecting an image of the first window view")

            #get the first image for the project
            self.view_list = {}
            self.add_view()

            self.reload_project()
            self.enable_project_menus(True)
        self.logger.trace(f"End", indent_delta=-1)

    #--------------------------------------#
    #          Open File Utilities         #
    #--------------------------------------#
    def open_project(self):
        '''
        Works with the user to open an existing project
        '''
        self.logger.trace(f"Start", indent_delta=1)
        path = fd.askopenfilename(title="Open a file", filetypes=[("json","*.json")])
        if path == "":
            mb.showerror(title="Error", message="Project not selected", parent=self.window)
            return

        self.project_file = path
        self.import_json()
        self.logger.trace(f"End", indent_delta=-1)

    def import_json(self):
        '''
        Opens the project file and loads the project.
        
        Requires that the project file has already been indentified.
        '''
        self.logger.trace(f"Start", indent_delta=1)
        self.view_list = {}

        save_folder = self.get_save_folder()
        with open(self.project_file, "r") as read_file:
            dictionary = json.load(read_file)

        self.clear_entries()
        self.view_list = {}
        self.widget_list = {}

        errors = []
        try:
            dictionary = self.update_file(dictionary, save_folder)
            self.version = dictionary["Version"]
            
            self.logger.debug(f"Creating ImageWindow")
            if not self.image_window:
                self.image_window = ImageWindow(self, save_folder)

            #cross validation of views vs widgets
            #keep the names of all views as a reference
            self.view_list = dictionary["Views"]

            #create all widgets; excluding any without a matching view
            self.logger.debug(f"Creating all Widgets")
            for widget_dictionary in dictionary["Widgets"]:
                widget = Widget.from_dictionary(widget_dictionary)
                widget_name = widget.get_value("name")
                widget_native_view = widget.get_value("view")
                if widget_native_view in self.view_list:
                    #this widget has a matching view; remember it as a reference
                    self.widget_list[widget_name]=widget
                else:
                    #add the error notes but only ONCE for each widget/view
                    error_note = "Removed widget "+widget_name+"; Cannot find parent view "+widget_native_view
                    if not (error_note in errors):
                        errors.append(error_note)
            self.logger.debug(f"widget list: {list(self.widget_list.keys())}")
 
            self.logger.debug(f"Creating views")
            view_files = {}
            for view_name in self.view_list:
                view = self.view_list[view_name]
                widgets_in_view = []
                if "Widgets" in view:
                    widgets_in_view = view["Widgets"]

                for widget_name in widgets_in_view:
                    if not(widget_name in self.widget_list):
                        #add the error notes but only ONCE for each widget/view
                        error_note = "Cannot find widget "+widget_name
                        if not (error_note in errors):
                            errors.append(error_note)

                        view["Widgets"].remove(widget_name)

                full_image_path = os.path.join(save_folder, view["Image"])
                view_files[view_name]=full_image_path
            self.logger.debug(f"View list: {list(self.view_list.keys())}")

            #now we have a full set of views that have been validated
            self.logger.debug(f"Loading view images to ImageWindow")
            self.image_window.load_image_names(view_files)

            #now we have a full set of widgets that have been validated
            self.logger.debug(f"Adding Widgets to table")
            for widget_name in self.widget_list:
                widget = self.widget_list[widget_name]
                self.update_table_row(widget)

            self.logger.debug(f"Going to first view by default")
            self.view_change(list(self.view_list.keys())[0])
            
            complete_error_statement = ""
            for n in errors:
                complete_error_statement += n+"\n"
            if len(errors)>0:
                mb.showerror(title="Error", message="JSON is corrupted. Partially corrected.\n"+complete_error_statement, parent=self.window)

        except Exception as ex:
            traceback.print_exception(ex)
            raise IOError("JSON is corrupt or does not support RFGUIHelper:\n\t"+str(ex))
        self.enable_project_menus(True)
        self.logger.trace(f"End", indent_delta=-1)

    def close_window(self):
        '''
        Called from the GUI members that close the GUI. This is seperate from,
        but does depend on, closing the project.
        '''
        response = self.close_project()
        if response == None:
            return

        self.window.quit()

    def close_project(self, forced=False):
        '''
        Called from GUI members that close the project itself, not necessarily
        GUI.
        
        forced - False by default; called as True only during events that require saving data
        '''
        if forced and self.last_editor:
            self.last_editor.window.close()

        if self.project_file == None:
            return True
        self.logger.trace(f"Start", indent_delta=1)

        response = False
        if not forced:
            response = mb.askyesnocancel("Save changes?", "\tDo you want to save any changes?\t")

        if response == None:
            self.logger.trace(f"End", indent_delta=-1)
            return response
        elif response: #True for "Yes" option
            self.save_project()
        
        #At this point the contents of the project are invalid and can be deleted
        self.clear_entries()
        self.project_file = None
        self.view_list = {}
        self.current_view = None

        if self.image_window != None:
            for widget_name in list(self.widget_list):
                self.logger.debug(f"Deleting overlays for widget: {widget_name} during close project.")
                self.image_window.delete_overlays(self.widget_list[widget_name])
                del self.widget_list[widget_name]

            self.image_window.top.destroy()
            self.image_window = None
            self.enable_project_menus(False)

        self.logger.trace(f"End", indent_delta=-1)
        return response

    #--------------------------------------#
    #            Widget Utilities          #
    #--------------------------------------#
    def get_widget_image_name(self, widget_name):
        '''
        Called internally to sanitize image file names
        '''
        #TODO better sanitization of filename
        clean_name = widget_name.replace(" ","_")

        #add extension
        end_main_file = clean_name.find(".")
        if end_main_file == -1:
            end_main_file = len(clean_name)
        clean_name = clean_name[0:end_main_file]+".png"
        return clean_name

    def update_foreign_widgets(self, foreign_view, dx, dy):
        '''
        Updates the widget overlays for a foreign view
        '''
        self.logger.trace(f"Start", indent_delta=1)
        current_view = self.view_list[self.current_view]

        #get all the widgets in this view
        next_list = []
        if "Widgets" in current_view:
            next_list = current_view["Widgets"]
        
        #search for foreign widgets
        for widget_name in self.widget_list:
            widget = self.widget_list[widget_name]
            widget_native_view = widget.get_value("view")
            if widget_name in next_list and widget_native_view==foreign_view:
                #this widget is in the current view 
                #AND it is from the foreign view

                self.image_window.update_widget_overlays(widget, dx=int(dx), dy=int(dy))
        self.logger.trace(f"End", indent_delta=-1)

    def import_widget(self):
        '''
        Handles an event from ImageWindow; works with the user to (de)select one or 
        more widgets for import into this view.
        '''
        
        self.logger.trace(f"Start", indent_delta=1)
        # we compile a list of all widgets we could import 
        # (i.e. not native to this view) the list is actually
        # the keys of a collection, so we can readily get to
        # the widgets associated with the name.
        choices = {}
        for widget_name in self.widget_list:
            widget = self.widget_list[widget_name]
            if widget.get_value("view")!=self.current_view:
                choices[widget_name]=widget

        widgets_already_imported = [] # this is a list of already-imported widgets in this list
        view_now = self.view_list[self.current_view]
        if "Widgets" in view_now:
            for widget in view_now["Widgets"]:
                if widget in choices: # we can only "already" have widgets from the choices list.
                    widgets_already_imported.append(widget)

        # here we do the selection process
        cp = ChoicePopup(self.window, title="Select a widget", choice_list=list(choices.keys()), already=widgets_already_imported, single_select=False)
        cp.choice_win.transient(self.window)
        cp.choice_win.grab_set()
        self.window.wait_window(cp.choice_win)
        if not cp.button:
            mb.showerror(title="Error", message="Operation canceled", parent=self.window)
            return None

        if len(cp.result)>0:
            if not("Foreign" in view_now):
                view_now["Foreign"] = {}

            if not ("Widgets" in view_now):
                view_now["Widgets"] = []

        # adding all the things which are left on the list
        for widget_name in cp.result:
            view_name = choices[widget_name].get_value("view")
            deltas = (0,0)
            if view_name in view_now["Foreign"]:
                deltas = view_now["Foreign"][view_name]

            if widget_name in widgets_already_imported: #delete them from our already-added set
                widgets_already_imported.remove(widget_name)
            else:
                self.view_list[self.current_view]["Widgets"].append(widget_name)

            self.image_window.update_widget_overlays(choices[widget_name], deltas[0], deltas[1])

        # anything left needs to be deleted
        for widget_name in widgets_already_imported:
            self.view_list[self.current_view]["Widgets"].remove(widget_name)
            self.logger.debug(f"Deleting overlays for widget: {widget_name} during importWidget.")
            self.image_window.delete_overlays(choices[widget_name])
        self.logger.trace(f"End", indent_delta=-1)

    def get_widget_image(self, widget:Widget):
        '''
        Returns an image starting the from the given widget's view and boundary
        '''
        widget_name = widget.get_value("name")
        self.logger.trace(f"Start {widget_name}", indent_delta=1)
        widget_native_view = widget.get_value("view")
        save_folder = self.get_save_folder()

        view_image = None
        for view_name in self.view_list:
            if view_name==widget_native_view:
                full_path = os.path.join(save_folder, self.view_list[view_name]["Image"])
                view_image = Image.open(full_path)
                break

        if not view_image: #Never found one!
            self.logger.trace(f"End", indent_delta=-1)
            raise Exception("Could not create widget image; no view "+str(view_name))

        dims = (int(widget.get_value("X")), int(widget.get_value("Y")), int(widget.get_value("width")), int(widget.get_value("height")))
        self.logger.trace(f"End", indent_delta=-1)
        return view_image.crop((dims[0], dims[1], dims[0]+dims[2], dims[1]+dims[3]))

    def update_table_row(self, widget:Widget, row_number=-1):
        '''
        Extracts the data for the given widget and either appends it to the table or replaces the given row
        
        row_number - -1 by default indicates a new row; otherwise replace the indicated row
        '''
        widget_name = widget.get_value("name")
        self.logger.trace(f"Start: {widget_name}", indent_delta=1)
        thumb = self.get_widget_image(widget)
        thumb.thumbnail(THUMBNAIL)
        self.tk_images.append(ImageTk.PhotoImage(thumb))
        #TODO there should be some garbage collection here.
        # we could remove older tkImages if we could find them
        
        value_set = (widget_name,
                    widget.get_value("view"),
                    widget.get_value("type"),
                    widget.get_value("X"),
                    widget.get_value("Y"),
                    widget.get_value("width"),
                    widget.get_value("height")
                    )
        if row_number==-1:
            self.table.insert(parent='',
                index='end',
                text='',
                image=self.tk_images[-1],
                values=value_set)
        else:
            self.table.item(row_number,
                text="", 
                image=self.tk_images[-1],
                values=value_set)

        if self.is_in_view(widget): # separate issue, only update the overlay if it is on this view
            self.image_window.update_widget_overlays(widget)
        self.logger.trace(f"End", indent_delta=-1)

    def new_widget(self, view_name, x, y, width, height):
        '''
        Handles a user event from ImageWindow to generate a new widget
        with these parameters.
        '''
        self.logger.trace(f"Start ({x},{y})+{width}x{height}", indent_delta=1)

        naive_widget = Widget("Anchor", view_name, x, y, width, height)

        self.generate_widget_editor(naive_widget, False)
        if self.last_editor.completed == EditorState.COMPLETE:
            # remember this widget as part of the current view
            view_now = self.view_list[self.current_view]
            if not ("Widgets" in view_now):
                view_now["Widgets"]=[]

            widget = self.last_editor.answer
            widget_name = widget.get_value("name")
            view_now["Widgets"].append(widget_name) 
            self.widget_list[widget_name]=widget

            #update the master table
            self.update_table_row(widget)

        self.last_editor = None
        self.logger.trace(f"End", indent_delta=-1)

    def generate_widget_editor(self, input_widget:Widget, foreign, is_revision=False):
        '''
        Provides a consistent widgeting experience for new or edited widgets
        
        foreign - True if this is not the widget's native view
        is_revision - False by default and for new widgets; True when editing an existing widget
        '''
        self.logger.trace(f"Start", indent_delta=1)
        try:
            self.last_editor = WidgetEditor.create_editor(input_widget.to_dict(), self, self.window, self.image_window, revision=is_revision, is_foreign=foreign)
            self.last_editor.window.transient(self.window)
            self.last_editor.window.grab_set()
            self.window.wait_window(self.last_editor.window)
        except WidgetError as we:
            self.last_editor = WidgetEditor.create_crash()
            mb.showerror(title="Error", message=str(we))
        self.logger.trace(f"End", indent_delta=-1)

    def editWidget(self, event):
        '''
           Based on the mouse-click event, identify the row of the table,
           the corresponding widget object, and then edit it.

           If the edit is completed (i.e. not cancelled, update the stored
           object.
           * Foreign widgets only edit the delta position for imported widgets.
        '''
        # list of the values in this row
        row_ID = self.table.identify_row(event.y)
        values = self.table.item(row_ID)["values"]

        if len(values)<1:
            #nothing found
            return
        widget_name = values[0]
        self.logger.trace(f"Start {widget_name}", indent_delta=1)

        found = False
        view_now = self.view_list[self.current_view]
        list_of_widgets_in_current_view = []
        if "Widgets" in view_now:
            for w in view_now["Widgets"]:
                list_of_widgets_in_current_view.append(w)

        if widget_name in self.widget_list:
            found_widget = self.widget_list[widget_name]
            found = True

            old_widget_name = found_widget.get_value("name")
            widget_is_in_this_view = old_widget_name in list_of_widgets_in_current_view
            widget_is_import = widget_is_in_this_view and (found_widget.get_value("view")!=self.current_view)

            self.generate_widget_editor(found_widget, widget_is_import, True)
            if self.last_editor.completed == EditorState.COMPLETE:
                if WidgetEditor.view_update[0]:
                    # this was a foreign widget
                    # just store the data for this view
                    view_name = WidgetEditor.view_update[0]
                    dx = WidgetEditor.view_update[1]
                    dy = WidgetEditor.view_update[2]
                    if not "Foreign" in view_now:
                        view_now["Foreign"]={}
                    view_now["Foreign"][view_name]=(dx, dy)

                    self.update_foreign_widgets(view_name, dx, dy)
                else:
                    #this is NOT a foreign widget, 
                    # so it should be updated
                    widget = self.last_editor.answer
                    self.update_table_row(widget, row_number=row_ID)
                    new_name = widget.get_value("name")
                    if old_widget_name!=new_name:
                        del self.widget_list[old_widget_name] #remove the old widget from the data
                        for view in self.view_list:
                            if "Widgets" in self.view_list[view] and old_widget_name in self.view_list[view]["Widgets"]:
                                self.view_list[view]["Widgets"].remove(old_widget_name)
                                self.view_list[view]["Widgets"].append(new_name)
                    self.widget_list[new_name]=widget

            elif self.last_editor.completed == EditorState.DELETED:
                self.logger.debug(f"Deleting overlays for widget: {found_widget.get_value('name')} during widget edit.")
                self.image_window.delete_overlays(found_widget)
                del self.widget_list[found_widget.get_value("name")]
                self.table.delete(row_ID)

            self.last_editor=None
            self.logger.trace(f"End", indent_delta=-1)
            return

        if not found:
            mb.showerror(title="Edit Error", message="Could not find "+widget_name+" to edit", parent=self.window)
            self.logger.trace(f"End", indent_delta=-1)
            return

    def clear_entries(self):
        '''
        Handles a UI event to remove all widgets from the table
        '''
        self.logger.trace(f"Start", indent_delta=1)

        for item in self.table.get_children():
            self.table.delete(item)

        if self.image_window:
            for widget_name in list(self.widget_list):
                self.logger.debug(f"Deleting overlays for widget: {widget_name} during clear entries.")
                self.image_window.delete_overlays(self.widget_list[widget_name])
                del self.widget_list[widget_name]

        self.widget_list.clear()
        self.logger.trace(f"End", indent_delta=-1)

    def update_file(self, json_data, folder_path):
        """
        Update the JSON data according to the new configuration format.
        """
        self.logger.trace(f"Start", indent_delta=1)
        changed = False

        if "Version" not in json_data:
            json_data["Version"] = "3.0"

        if json_data["Version"] == "3.0":
            self.logger.trace(f"Updating file to version 3.1")
            json_data["Path"] = folder_path
            changed = True
            # Perform upgrade from 3.0 to 3.1
            json_data["Version"] = "3.1"
            # Upgrade logic from 3.0 to 3.1 goes here

            # Add collection of "Views"
            json_data["Views"] = {}
            # Create "default_view" as a collection
            json_data["Views"]["default_view"] = {}
            
            # Extract filename from "Images" path and add it as "Image" to "default_view"
            if "Images" in json_data:
                image_path = json_data["Images"][0]
                filename = os.path.basename(image_path)
                json_data["Views"]["default_view"]["Image"] = filename
            
            # Parse list of widgets and extract "name" into a list
            if "Widgets" in json_data:
                widget_names = [widget["name"] for widget in json_data["Widgets"]]
                # Add the extracted widget names list to "default_view"
                json_data["Views"]["default_view"]["Widgets"] = widget_names

            # Cycle through widgets again to rename image files for "Anchor" type widgets
            for widget in json_data["Widgets"]:
                # Add "view" property to each widget
                widget["view"] = "default_view"
    
                if widget["type"] == "Anchor" and "Image file name" in widget:
                    # Extract file name and join with "Path" value to get full file path
                    image_file_name = widget["Image file name"]
                    full_file_path = os.path.join(json_data["Path"], image_file_name)
                    # Rename the file to match the Anchor's name
                    os.rename(full_file_path, os.path.join(json_data["Path"], widget["name"] + os.path.splitext(image_file_name)[1]))
                    # Remove "Image file name" property
                    widget.pop("Image file name", None)

            # Remove unnecessary keys
            json_data.pop("Path", None)
            json_data.pop("File", None)
            json_data.pop("Images", None)

        # Save changes to file if any changes were made
        if changed:
            self.logger.trace(f"Saving your file in version {json_data['Version']}")
            with open(self.project_file, "w") as file:
                json.dump(json_data, file)

        self.logger.trace(f"End", indent_delta=-1)
        return json_data