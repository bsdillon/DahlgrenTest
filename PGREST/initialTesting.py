import json
import urllib.request

# sandbox for early python/json/api testing

# Ensure environment allows parsing of json into native object:
# some JSON:
x = '{ "name":"John", "age":30, "city":"New York"}'
# parse x:
y = json.loads(x)
# the result is a Python dictionary:
print(y["age"])

# attempt grabbing json at remote location
with urllib.request.urlopen("http://192.168.1.182:3000") as url: #hard coded URL on my local network
    data = json.loads(url.read().decode())
    print(data) #hideous single line readout of all json @ root address

