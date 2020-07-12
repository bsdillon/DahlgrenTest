import sys

from sgqlc.endpoint.http import HTTPEndpoint

URL = 'https://api.code-inspector.com/graphql'
headers = {
    'X-Access-Key': sys.argv[1],
    'X-Secret-Key': sys.argv[2]
}

# Incremental history file
outputfile = sys.argv[3]
out_file = open(outputfile, "a+")

QUERY = '{user {username} }'
variables = {}

endpoint = HTTPEndpoint(URL, headers)
data = endpoint(QUERY, variables)

for key in data:
    out_file.write(key+": "+data[key])
