import os

from PyPDF2 import PdfFileReader, PdfFileWriter

from tabula import convert_into

# import pandas as pd
# PyPDF2 documentation https://pythonhosted.org/PyPDF2/
# from pdfrw import PdfReader, PdfWriter, PageMerge

output = open("output.txt", "w")
# creates a pdf file obj
pdfFile = open("MIL-STD-2525D.pdf", 'rb')
writer = PdfFileWriter()
pdfRead = PdfFileReader(pdfFile)
print("Number of pages in this pdf:", pdfRead.numPages)

# creates a page obj
tablePage = pdfRead.getPage(34)
textPage = pdfRead.getPage(50)
# output.write(textPage.extractText())
# writes content of page to outfile
writer.addPage(tablePage)
with open('output.pdf', 'wb') as outfile:
    writer.write(outfile)
convert_into('output.pdf', 'test.csv', output_format="csv")
convert_into('output.pdf', 'test.json', output_format="json")
pdfFile.close()
output.close()
os.remove('output.pdf')
print("Success! Table written to csv file.")
