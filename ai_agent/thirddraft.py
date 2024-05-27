from openai import OpenAI
from secret import SECRET_KEY

client = OpenAI(api_key = SECRET_KEY,
                organization='org-tDIB2d1RZWA5E4mYdmh1tzS3'
)

response = client.chat.completions.create(
  model="gpt-3.5-turbo",
  messages=[
    {
      "role": "user",
      "content": "can you year me?"
    }
  ],
  temperature=1,
  max_tokens=256,
  top_p=1,
  frequency_penalty=0,
  presence_penalty=0
)

print(str(response))