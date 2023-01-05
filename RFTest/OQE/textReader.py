from robot.api.deco import keyword
from pytesseract import pytesseract
from OQE.filemaker import *
import os.path
#BSD some of the CV code could be used to enhance the images, 
#but by default it is not used.
# import cv2
# import numpy as np

# The path of installed tesseract
tesseract_path = r"C:\Program Files\Tesseract-OCR\tesseract.exe"
# Start the tesseract engine
pytesseract.tesseract_cmd = tesseract_path

class textreader:
    ROBOT_AUTO_KEYWORDS = False

    def __init__(self):
        pass

    @keyword(name="Verify Tesseract")
    def verifyTesseract(self):
        return os.path.exists(tesseract_path)

#################################
    # # get grayscale image
    # def get_grayscale(self, image):
    #     return cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # # noise removal
    # def remove_noise(self, image):
    #     return cv2.medianBlur(image,5)
    
    # #thresholding
    # def thresholding(self, image):
    #     return cv2.threshold(image, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]

    # #dilation
    # def dilate(self, image):
    #     kernel = np.ones((5,5),np.uint8)
    #     return cv2.dilate(image, kernel, iterations = 1)
        
    # #erosion
    # def erode(self, image):
    #     kernel = np.ones((5,5),np.uint8)
    #     return cv2.erode(image, kernel, iterations = 1)

    # #opening - erosion followed by dilation
    # def opening(self, image):
    #     kernel = np.ones((5,5),np.uint8)
    #     return cv2.morphologyEx(image, cv2.MORPH_OPEN, kernel)

    # #canny edge detection
    # def canny(self, image):
    #     return cv2.Canny(image, 100, 200)

    # #skew correction
    # def deskew(self, image):
    #     coords = np.column_stack(np.where(image > 0))
    #     angle = cv2.minAreaRect(coords)[-1]
    #     if angle < -45:
    #         angle = -(90 + angle)
    #     else:
    #         angle = -angle
    #     (h, w) = image.shape[:2]
    #     center = (w // 2, h // 2)
    #     M = cv2.getRotationMatrix2D(center, angle, 1.0)
    #     rotated = cv2.warpAffine(image, M, (w, h), flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)
    #     return rotated

    # #template matching
    # def match_template(self, image, template):
    #     return cv2.matchTemplate(image, template, cv2.TM_CCOEFF_NORMED) 
#################################

    @keyword(name="Read Text from Image File")
    def getText(self, imgFile: str, deleteAfter: bool =True) -> str:
        '''
        Uses Tesseract 5.0 to discover text from an image which may be taken from the 
        screen. Returns  any text found in the image.\n\n
        imgFile - the location of an image file containing text\n\n
        deleteAfter - True by default; deletes the image file after the text is read.
        '''
        #img = cv2.imread(imgFile)

        #OCR engine mode describes the kind of logic used. In this case "default" whatever that means
        #page segmentation mode describes the kind of text. In this case a single uniform line
        #seems pretty good, but never universal
        #TODO define parameters for text search and how they are used.
        custom_config = r'--oem 3 --psm 6'
        text = pytesseract.image_to_string(imgFile, config=custom_config)
        if deleteAfter:
            deleteFile(imgFile)

        #simple sanitation of the text
        text = text.replace('_'," ").strip()
        return text

