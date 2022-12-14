
class ImageUpdater:
    def updateImage(self, widget):
        raise NotImplementedError
    
    def cropImage(self, x:int, y:int, w:int, h:int):
        raise NotImplementedError
    
    def getImageBounds(self):
        raise NotImplementedError

    def getImageSavePath(self):
        raise NotImplementedError
