import json
import sys
from datetime import timedelta
import datetime
import os

file = sys.argv[1]
reader = open(file)
json_array = json.load(reader)
count_list = json_array['all']
count = len(count_list) - 1
day_count = 0
log = {}
today = datetime.date.today()
while count >= 0:
    if (count_list[count] != 0):
        n_date = str(today - timedelta(days=day_count))
        log.update( {n_date : count_list[count]})
        day_count = day_count + 7
    count = count - 1
with open(os.path.join('./html/', 'log.js'), 'w') as out_file:
    out_file.write('var graph = %s;' % json.dumps(log))

'''
count_list tracks the total number of commits per week (of 52 total)
the last index should indicate the most recent week since the
creation of the repos or a year past its creation
'''
print("Weekly commit count:", str(count_list[len(count_list) - 1]))
print("Updated again 5")
reader.close
