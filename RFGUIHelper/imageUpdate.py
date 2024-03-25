
class ImageUpdater:
    def cropImage(self, x:int, y:int, w:int, h:int, tkImage:bool=True, specificView:str=None):
        raise NotImplementedError
    
    def getImageBounds(self):
        raise NotImplementedError

    def getImageSavePath(self):
        raise NotImplementedError
    
    def getViewList(self):
        raise NotImplementedError