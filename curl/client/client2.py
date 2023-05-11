import requests
from requests.auth import HTTPBasicAuth
import json

url = "http://127.0.0.1:5000/companies"
response = requests.get(url, auth=HTTPBasicAuth("someuser","somepassword"))
print(json.dumps(response.json(), indent=4))