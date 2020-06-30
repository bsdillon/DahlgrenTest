import datetime
import json
import os
import sys
from datetime import timedelta

datafile = sys.argv[1]
outputfile = sys.argv[2]
out_file = open(outputfile, 'w')

out_file.write("Parsing "+datafile)
out_file.write("Appending "+datafile)
reader = open(datafile)
json_array = json.load(reader)
for key, value in json_array.iteritems() :
    out_file.write(str(key)+": "+str(value))
reader.close()
