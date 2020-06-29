import json
import sys
import os
import datetime
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
        log.update({N_DATE : count_list[count]})
        DAY_COUNT = DAY_COUNT + 7
    count = count - 1
with open(os.path.join('./html/', 'log.js'), 'w') as out_file:
    out_file.write('var graph = %s;' % json.dumps(log))

'''
count_list tracks the total number of commits per week (of 52 total)
the last index should indicate the most recent week since the
creation of the repos or a year past its creation
'''
#print("Weekly commit count:", str(count_list[len(count_list) - 1]))
#print("Updated again 5")
reader.close
