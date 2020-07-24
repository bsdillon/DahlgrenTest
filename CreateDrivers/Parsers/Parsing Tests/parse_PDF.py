import os

import requests

import pandas as pd

from PyPDF2 import PdfFileReader, PdfFileWriter

import tabula

# PyPDF2 documentation https://pythonhosted.org/PyPDF2/
url = \
    'https://www.jcs.mil/Portals/36/Documents/Doctrine/Other_Pubs/ms_2525d.pdf'
r = requests.get(url)

# downloads pdf by writing the content in another pdf
with open("reader.pdf", "wb") as pdf:
    for chunk in r.iter_content():
        if chunk:
            pdf.write(chunk)

out = open('output.txt', 'w')
# creates a pdf file obj
pdfFile = open("reader.pdf", 'rb')
writer = PdfFileWriter()
pdfRead = PdfFileReader(pdfFile)
print("Number of pages in this pdf:", pdfRead.numPages)

# creates a page obj
tablePage = pdfRead.getPage(35)
textPage = pdfRead.getPage(34)
out.write(textPage.extractText())
# writes content of page to outfile
writer.addPage(tablePage)
with open('output.pdf', 'wb') as outfile:
    writer.write(outfile)
tables = tabula.read_pdf("output.pdf", pages="all")
print('Type:', type(tables[0]))
data = tables[0]
data = data.fillna('')
with pd.option_context('display.max_rows', None, 'display.max_columns', None):
    pd.set_option('display.expand_frame_repr', False)
    print(data)
tabula.convert_into('output.pdf', 'test.csv', output_format="csv")

pdfFile.close()
os.remove('output.pdf')
os.remove('reader.pdf')
out.close()
