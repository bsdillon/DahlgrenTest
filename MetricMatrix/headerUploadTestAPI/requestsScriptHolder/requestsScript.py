import requests
import json

rootURL = "http://localhost:8000/classifiedUploads/"

data = {"classification": "UNCLASSIFIED"}
file = {"file": open("BetaRegigigas.png", "rb")}
response = requests.post(rootURL, data=data, files=file)
print(json.dumps(response.json(), indent = 2))

response = requests.get(rootURL + "1/")
print(response.json()["classification"])
response = requests.get(response.json()["file"])
open("top_secret.jpg", "wb").write(response.content)
