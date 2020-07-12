import sys
from sgqlc.endpoint.http import HTTPEndpoint

url = 'https://api.code-inspector.com/graphql'
headers = {
    'X-Access-Key': sys.argv[1],
    'X-Secret-Key': sys.argv[2]
}

# Incremental history file
outputfile = sys.argv[3]
out_file = open(outputfile, "a+")

query = '{user {username} }'
variables = {}

endpoint = HTTPEndpoint(url, headers)
data = endpoint(query, variables)
out_file.write(data)
