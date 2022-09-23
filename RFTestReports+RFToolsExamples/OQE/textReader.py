from robot.api.deco import keyword
from pytesseract import pytesseract
from PIL import Image
from filemaker import *


# The path of installed tesseract
tesseract_path = r"C:\Program Files\Tesseract-OCR\tesseract.exe"
# Start the tesseract engine
pytesseract.tesseract_cmd = tesseract_path

class textReader:
    def __init__(self):
        pass

    @keyword(name="Read Text from Image File")
    def getText(self, imgFile: str, deleteAfter: bool =True) -> str:
        '''
        Uses Tesseract 5.0 to discover text from an image which may be taken from the screen
        imgFile: the location of an image file containing text
        deleteAfter: True by default; deletes the image file after the text is read.
        return: any text found in the image
        '''
        print("opening image file: "+imgFile)
        img = Image.open(imgFile)
        text = pytesseract.image_to_string(img)
        if deleteAfter:
            deleteFile(imgFile)
        return text

