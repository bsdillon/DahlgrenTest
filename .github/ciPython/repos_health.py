import datetime
import json
import os
import sys
from datetime import timedelta

file = sys.argv[1]
reader = open(file)
json_array = json.load(reader)
count_list = json_array['all']
count = len(count_list) - 1
DAY_COUNT = 0
log = {}
today = datetime.date.today()
while count >= 0:
    if count_list[count] != 0:
        N_DATE = str(today - timedelta(days=DAY_COUNT))
        log.update({N_DATE: count_list[count]})
        DAY_COUNT = DAY_COUNT + 7
    count = count - 1
with open(os.path.join('./html/cidata', 'log.js'), 'w') as out_file:
    out_file.write('var graph = %s;' % json.dumps(log))

reader.close()
