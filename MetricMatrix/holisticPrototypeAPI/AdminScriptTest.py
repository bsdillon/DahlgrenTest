import requests
import json
import base64

# maybe?
client_id = "uxsjRcQXcF8kcjrCAVRnUJNbgUrsOmkNe2BADNtd"
secret = "0KfnA11Y5sPwNdK3733PILl1VMDbromsVINNrWXhQtZPuKKxPJYaoekHtgVxjtkKS8on9IS9JbWNDJZclOuE3CDBOd8pvqaxgZq8YJcoTVOx0Mt7zawZ0ecraKMEdI4u"
cert = "../venv/Lib/site-packages/sslserver/certs/development.crt"
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
# maybe...

name = "lab500"
application_data = {
    "name": name,
    "client_type": "confidential",
    "authorization_grant_type": "client-credentials"
}
login_url = "https://localhost:8000/admin/login/?next=/admin/"
app_url = "https://localhost:8000/admin/oauth2_provider/application/"

#
with requests.Session() as session:
    session.auth = ("admin", "password")
    token_source = session.get(login_url, verify = cert)
    csrf_token = token_source.cookies["csrftoken"]
    response = session.post(app_url, json = application_data, data = {"csrfmiddlewaretoken": csrf_token}, headers={"Authorization": "Bearer "+access_token, "Referer": "https://localhost:8000", "Cookie": "csrftoken=" + csrf_token }, verify = cert)
#

print(json.dumps(response.json(), indent = 2))
