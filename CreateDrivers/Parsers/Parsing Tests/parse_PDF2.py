import os
import requests

from PyPDF2 import PdfFileReader

url = 'http://scipp.ucsc.edu/groups/fermi/electronics/mil-std-883.pdf'
r = requests.get(url)

# downloads pdf by writing the content in another pdf
with open("reader.pdf", "wb") as pdf:
    for chunk in r.iter_content():
        if chunk:
            pdf.write(chunk)
pdf.close()

# parsing here
pdfFile = open("reader.pdf", "rb")
pdfRead = PdfFileReader(pdfFile)

textPage = pdfRead.getPage(10)
print("Number of pages in this pdf:", pdfRead.numPages)
print(textPage.extractText())
pdfFile.close()

# removes the reader pdf file
os.remove("reader.pdf")
print("Done parsing.")
