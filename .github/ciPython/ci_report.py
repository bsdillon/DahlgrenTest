import sys

from sgqlc.endpoint.http import HTTPEndpoint

def walk_dict(out_file, d):
    for k,v in d.items():
        if isinstance(v, dict):
            walk_dict(out_file, v)
        else:
            out_file.write("%s %s" % (k, v))

URL = 'https://api.code-inspector.com/graphql'
headers = {
    'X-Access-Key': sys.argv[1],
    'X-Secret-Key': sys.argv[2]
}

# Incremental history file
outputfile = sys.argv[3]
out_file = open(outputfile, "a+")

QUERY = '{Analysis, Violation}'
variables = {}

endpoint = HTTPEndpoint(URL, headers)
data = endpoint(QUERY, variables)

# https://sgqlc.readthedocs.io/en/latest/sgqlc.endpoint.http.html#synchronous-http-endpoint
walk_dict(out_file, data)
