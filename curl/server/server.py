from flask import Flask, json

companies = [{"id": 10, "name": "Company One"}, {"id": 20, "name": "Company Two"}]

api = Flask(__name__)

@api.route('/companies', methods=['GET'])
def get_companies():
  print("So this happened")
  return json.dumps(companies)

if __name__ == '__main__':
    print("*******************************")
    print("*          STARTING           *")
    print("*******************************")
    api.run(debug=True)