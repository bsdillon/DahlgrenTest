import datetime
import sys

# https://sgqlc.readthedocs.io/en/latest/sgqlc.endpoint.http.html#synchronous-http-endpoint
from sgqlc.endpoint.http import HTTPEndpoint

URL = 'https://api.code-inspector.com/graphql'
headers = {
    'X-Access-Key': sys.argv[1],
    'X-Secret-Key': sys.argv[2]
}
endpoint = HTTPEndpoint(URL, headers)

# Incremental history file
outputfile = sys.argv[3]
out_file = open(outputfile, "a+")

variables = {}

QUERY = "{project(id: 9280){lastAnalysis{summary{"
QUERY += "violations duplicated_lines complexFunctions longFunctions}}}}"
data = endpoint(QUERY, variables)

data_set = data['data']['project']['lastAnalysis']['summary']
v_count = data_set['violations']
dups = data_set['duplicated_lines']
comps = data_set['complexFunctions']
longF = data_set['longFunctions']

QUERY = "{project(id: 9280){lastAnalysis{violations("
QUERY += "howmany:'+str(v_count)+', skip:0){filename"
QUERY += "severity category} complexFunctions(howmany:"
QUERY += str(comps)+" skip:0){filename}}}}"
data2 = endpoint(QUERY, variables)

print(data2['data'])
print(data2['data']['project'])
print(data2['data']['project']['lastAnalysis'])

v_set = data2['data']['project']['lastAnalysis']['violations']
c_set = data2['data']['project']['lastAnalysis']['complexFunctions']

date = datetime.datetime.now().strftime("%x")
severity = {}
severity['1'] = 'Critical'
severity['2'] = 'Important'
severity['3'] = 'Consider'
severity['4'] = 'Minor'

output = {}
for viol in v_set:
    key = severity[str(viol['severity'])]+"_"+viol['category']
    if key not in output:
        output[key] = ""
        output[key] += "'"+viol['filename']+"'"
    else:
        output[key] += ", '"+viol['filename']+"'"

# not outputing duplicates, complex/long functions
# must create a date-specific dictionary for data
out_file.write("ci_violations['%s']={};\n" % (date))
for k in output:
    out_file.write("ci_violations['%s'].%s=[%s];\n" % (date, k, output[k]))
