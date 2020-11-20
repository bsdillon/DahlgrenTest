import json
import requests
import urllib

print("possible address: http://192.168.1.182:3000/")
print("enter address: ")
addr = input()

print("connecting to: " + addr + "...")

with urllib.request.urlopen(addr) as url:
    data = json.loads(url.read().decode())
    print(json.dumps(data, sort_keys=True, indent=4, separators=(',', ': ')))
    
