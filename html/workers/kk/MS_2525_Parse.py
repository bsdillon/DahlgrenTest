import os

from PyPDF2 import PdfFileReader, PdfFileWriter

import pandas as pd

import requests

import tabula


# url tested below
# 'https://www.jcs.mil/Portals/36/Documents/Doctrine/Other_Pubs/ms_2525d.pdf'

# PyPDF2 documentation
# https://pythonhosted.org/PyPDF2/

# tabula documentation
# https://tabula-py.readthedocs.io/en/latest/getting_started.html#example

class Parser:
    def __init__(self):
        self.message = "message.txt"
        self.reader = "reader.pdf"

    def parse_from_url(self, url, pages):
        """
        Parses from a pdf found at a url and gets all text and tables.
        :param url: URL of pdf to parse
        :param pages: list of pages to parse
        :return processed data - dictionary that contains a list of tables
                and text parsed from pdf
        """
        # gets the pdf from url
        r = requests.get(url)
        with open(self.reader, "wb") as pdf:
            for chunk in r.iter_content():
                if chunk:
                    pdf.write(chunk)
        pdf.close()
        result = self._parse_pages(self.reader, pages)
        os.remove('output.pdf')
        os.remove(self.reader)
        pdf.close()
        return result

    def parse(self, pdf, pages):
        """
        Parses from pdf in a local directory and gets all text and tables.
        :param pdf: file
        :param pages: list of pages to parse
        :return: processed data - dictionary that contains a list of tables
                and text parsed from pdf
        """
        result = self._parse_pages(self, pdf, pages)
        os.remove('output.pdf')
        pdf.close()
        return result

    # test page number, 35 (has table)
    def _parse_pages(self, pdf_file, pageNums):
        """
        Helper function that utilizes PyPDF2 to parse pdf file.
        :param pdf_file: pdf file to read
        :param pageNums: list of pages to parse
        :return processed data - dictionary that contains a list of tables
                and text parsed from pdfs
        """
        # gets specified page from pdf and writes to another pdf file
        parsed_data = {}
        pages = []
        writer = PdfFileWriter()
        file = open(pdf_file, 'rb')
        pdf = PdfFileReader(file)
        for i in range(len(pageNums)):
            page = pdf.getPage(pageNums[i])
            writer.addPage(page)
            pages.append(i)
        with open('output.pdf', 'wb') as outfile:
            writer.write(outfile)
        tables = self.parse_pdf_table('output.pdf', "all")
        text = self.parse_text('output.pdf', pages)
        if len(tables) > 0:
            parsed_data.update({"Tables": tables})
        if len(text) > 0:
            parsed_data.update({"Text": text})
        file.close()
        return parsed_data

    def parse_text(self, pdf, pages):
        """
        Gets text from a pdf file.
        :param pdf: pdf file to parse
        :param pages: list of pages in the file to get text
        :return: list of pages of a pdf that contain extracted text
        """
        file = open(pdf, 'rb')
        parsed_text = []
        pdf = PdfFileReader(file)
        for i in range(len(pages)):
            page = pdf.getPage(pages[i])
            parsed_text.append(page.extractText())
        file.close()
        return parsed_text

    def parse_pdf_table(self, table_file, page):
        """
        Parses pdf table.
        :param table_file: pdf file to parse tables from
        :param page: page number in file to get table; for all pages, put "all"
        :return: a list of string representations of tables parsed from pdf
        """
        parsed_tables = []
        writer = open(self.message, 'w')
        tables = tabula.read_pdf(table_file, pages=page)
        for i in range(len(tables)):
            data = tables[i]
            data = data.fillna('')
            # data frame set to display all columns with no line breaks
            with pd.option_context('display.max_rows',
                                   None, 'display.max_columns', None):
                pd.set_option('display.expand_frame_repr', False)
            table = data.to_string()
            parsed_tables.append(table)
            lines = table.split('\n')
            for x in range(len(lines)):
                line = lines[x]
                writer.write(line[2:] + '\n')
            if i < len(tables) - 1:
                writer.write("---------------------------------------------\n")
        writer.close()
        return parsed_tables


# test script below
# parser = Parser()
# parser.parse_from_url('https://www.jcs.mil/Portals/36/Documents/'
#                      'Doctrine/Other_Pubs/ms_2525d.pdf', [35])
