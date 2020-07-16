import datetime
import json
import os
import sys
from datetime import timedelta

file = sys.argv[1]
reader = open(file)
out = open(os.path.join('./html/cidata', 'log.js'), 'w')
json_array = json.load(reader)
count_list = json_array['all']
count = 0

out.write("var week = {};\n")

first_date_found = False
today = datetime.date.today()
while count < len(count_list):
    # part of the array in json will be 0
    # recent week is the last index
    # earlier weeks are at the beginning indexes
    if count_list[count] != 0 or first_date_found:
        first_date_found = True
        DAY_COUNT = 7 * (len(count_list) - count - 1)
        N_DATE = today - timedelta(days=DAY_COUNT)
        out.write("week[\""+N_DATE.strftime("%m/%d/%Y")+"\"]=")
        out.write(str(count_list[count]))
        out.write(";\n")
    count = count + 1

out.close()
reader.close()
