import requests
import json
import base64

debugUser = "admin"#"lab101"
if (debugUser == "admin"):
    client_id = "uxsjRcQXcF8kcjrCAVRnUJNbgUrsOmkNe2BADNtd"
    secret = "0KfnA11Y5sPwNdK3733PILl1VMDbromsVINNrWXhQtZPuKKxPJYaoekHtgVxjtkKS8on9IS9JbWNDJZclOuE3CDBOd8pvqaxgZq8YJcoTVOx0Mt7zawZ0ecraKMEdI4u"
elif (debugUser == "lab101"):
    client_id = "IfohbSKEwENGyQWBNl15qpI81lt1phiOplvhYmV6"
    secret = "9QzIgOuZoXwYzPoS57VIngjbLrPAU1WRu9FXqJJCLNfHrUTUPKKIFbj82XIph6LYfZw780XL0tu9YXVEdSamOY8imfNXrJvZRlM0nsAlZueNKfNuGansx9iOh22CmwAw"

cert = "../venv/Lib/site-packages/sslserver/certs/development.crt"

# post for a token using Client Credentials
def getAccessToken(client_id, secret, cert):
    credential = "{0}:{1}".format(client_id, secret)
    encoded_cred = base64.b64encode(credential.encode("utf-8"))
    headers = {
        "Authorization": "Basic " + encoded_cred.decode(),
        "Cache-Control": "no-cache",
        "Content-Type": "application/x-www-form-urlencoded"
    }
    token_url = "https://localhost:8000/o/token/"
    
    tokenResponse = requests.post(token_url, headers=headers, data={"grant_type": "client_credentials"}, verify = cert)
    #print(json.dumps(tokenResponse.json(), indent = 2))
    return tokenResponse.json()["access_token"]

access_token = getAccessToken(client_id, secret, cert)

response = requests.get("https://localhost:8000/labs/", headers={"Authorization": "Bearer "+access_token}, verify = cert)
print(json.dumps(response.json(), indent = 2))

# try another request
#access_token = getAccessToken(client_id, secret, cert)
#newLab = {"name": "lab102", "UIC": 102}
#response = requests.post("https://localhost:8000/labs/", json = newLab, headers={"Authorization": "Bearer "+access_token}, verify = cert)
#print(json.dumps(response.json(), indent = 2))
