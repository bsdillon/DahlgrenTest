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
COUNT = 0

out.write("var week = {};\n")

FIRST = False
today = datetime.date.today()
while COUNT < len(count_list):
    # part of the array in json will be 0
    # recent week is the last index
    # earlier weeks are at the beginning indexes
    if count_list[COUNT] != 0 or FIRST:
        FIRST = True
        DAY_COUNT = 7 * (len(count_list) - COUNT - 1)
        N_DATE = today - timedelta(days=DAY_COUNT)
        out.write("week[\""+N_DATE.strftime("%m/%d/%Y")+"\"]=")
        out.write(str(count_list[COUNT]))
        out.write(";\n")
    COUNT = COUNT + 1

out.close()
reader.close()
