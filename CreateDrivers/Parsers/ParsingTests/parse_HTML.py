import requests
from bs4 import BeautifulSoup
import pandas as pd

url="http://www.tcpipguide.com/free/t_IPDatagramGeneralFormat.htm"
# make a GET request to fetch raw HTML content
html_content = requests.get(url).text
# out = open("html_out.txt", "w")
soup = BeautifulSoup(html_content, "lxml")
print(soup.title.text)
table = soup.find("table", attrs={"border": "3"})
table_data = table.find_all("tr")
titles = table.findAll('td')
title_list = []
for title in titles:
    title_list.append(title.text)
field = []
count = 0
while count < len(title_list):
    title_list[count] = title_list[count].replace('\n', '').replace('\r', '')
    if count != 0 and count % 3 == 0:
        field.append(title_list[count])
    count = count + 1
print(field)
print("Number of field names:", len(field))
df = pd.DataFrame()
df['Field Names'] = field

with pd.option_context('display.max_rows', None, 'display.max_columns', None):
    # more options can be specified also
    print(df)
# out.close()
