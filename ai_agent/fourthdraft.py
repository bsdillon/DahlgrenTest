from llamaapi import LlamaAPI
from secret import LLAM_SECRET
import json

#pip install llamaapi

llama = LlamaAPI(LLAM_SECRET)

api_request_json = {
  "model": "llama-13b-chat",
  "messages": [
    {"role": "system", "content": "Hello. Can you hear me?"},
  ]
}

# Make your request and handle the response
response = llama.run(api_request_json)
print(json.dumps(response.json(), indent=2))