
class ImageUpdater:
    '''
    ImageUpdater is a role interface that exposes the few necessary functions related to views
    and images without exposing additional information. It is used by the WidgetEditor.
    '''
    
    def crop_image(self, x:int, y:int, w:int, h:int, tkImage:bool=True, specific_view:str=None):
        '''
        Returns an image from (x,y) to (x+w,y+h).
        
        tkImage - Indicates if the returned image should be an instance of ImageTk or or Image.
        specific_view - by default the image is taken from the current view, but a specific view name can be indicated.
        '''
        raise NotImplementedError(f"{self}.crop_image")
    
    def get_image_bounds(self):
        '''
        For the current view, returns (width,height)
        '''
        raise NotImplementedError(f"{self}.get_image_bounds")

    def get_image_save_path(self) -> str:
        '''
        Returns the folder path for all saved images
        '''
        raise NotImplementedError(f"{self}.get_image_save_path")
    
    def get_view_list(self):
        '''
        Returns a list of view names
        '''
        raise NotImplementedError(f"{self}.get_view_list")
