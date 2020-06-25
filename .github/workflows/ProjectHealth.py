import json
import sys

file = sys.argv[1]
reader = open(file)
json_array = json.load(reader)
count_list = json_array['all']
'''
count_list tracks the total number of commits per week (of 52 total)
the last index should indicate the most recent week since the
creation of the repos or a year past its creation
'''
print("Weekly commit count:", str(count_list[len(count_list) - 1]))
print("Updated again")
reader.close
