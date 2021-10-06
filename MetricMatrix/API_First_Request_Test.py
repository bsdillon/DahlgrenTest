import requests
import json
import datetime

api_url = "https://www.boredapi.com/api/activity"
response = requests.get(api_url)
print(response)
print(response.status_code)
print(response.headers["Content-Type"])
# Raw bytes
print(response.content)
# As a string
print(response.text)
# As JSON, but prints ugly
#print(response.json())
print(json.dumps(response.json(), indent = 2))

print("\n\n")

api_url = "https://data.usajobs.gov/api/codelist/agencysubelements"
query = {"lastmodified":datetime.datetime(2021, 6, 1)}
response = requests.get(api_url, params = query)
print(response.status_code)
print(response.headers["Content-Type"])
print(json.dumps(response.json(), indent = 2))
