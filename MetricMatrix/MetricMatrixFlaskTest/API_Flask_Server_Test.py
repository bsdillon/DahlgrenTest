# currently, this won't work unless it's in the virtual environment (on my (Max's) machine)
# that will require commands "venv\Scripts\activate" on windows to activate and "deactivate" to deactivate
# to activate the server (on linux or mac), put "export FLASK_APP=API_Flask_Server_Test.py" into the command line
# on windows, do "set FLASK_APP=API_Flask_Server_Test.py" instead
# you can use "export/set FLASK_ENV=development" to make the server restart whenever there is a change in the program
# that includes API_Server_Request_Test, so changing that file will reset the server to its defaults
# note that the export/set commands MUST NOT have spaces around the "="
# command "flask run" to run the server when FLASK_APP is set
# "flask run --host=0.0.0.0" allows connections on the local network, instead of just yourself
# check the IPv4 Address listed under "ipconfig" to get access to the Flask server from another device on the network

import flask
import json
import uuid
# this test does not include flask_restful, which is a separate package
# that might be useful to install since it seems like it makes things easier

app = flask.Flask(__name__)

with open("serverMeats.json", "r") as file:
    meats = json.load(file)

@app.get("/meats")
def get_meats():
    return flask.jsonify(meats)

@app.post("/meats")
def add_meat():
    if flask.request.is_json:
        meat = flask.request.get_json()
        # may want to check that the uuid isn't in use already, just in case?
        meat["id"] = uuid.uuid4().hex
        meats.append(meat)
        with open("serverMeats.json", "w") as json_file:
            json.dump(meats, json_file)
        return meat, 201
    return {"error": "POST request must be JSON"}, 415

@app.put("/meats")
def replace_meat():
    meat = flask.request.get_json()
    if (meat["id"] not in [value for item in meats for value in item.values()]):
        return {"error": "ID not found"}, 404
    meats[:] = [meat if item["id"] == meat["id"] else item for item in meats]
    with open("serverMeats.json", "w") as json_file:
        json.dump(meats, json_file)
    return {}, 204

@app.patch("/meats")
def edit_meat():
    incomingMeat = flask.request.get_json()
    try:
        meat = next(item for item in meats if item["id"] == incomingMeat["id"])
    except StopIteration:
        return {"error": "ID not found"}, 404
    for key in incomingMeat:
        meat[key] = incomingMeat[key]
    with open("serverMeats.json", "w") as json_file:
        json.dump(meats, json_file)
    return {}, 204

@app.delete("/meats")
def delete_meat():
    uuid = flask.request.form["id"]
    try:
        meat = next(item for item in meats if item["id"] == uuid)
    except StopIteration:
        return {"error": "ID not found"}, 404
    meats.remove(meat)
    with open("serverMeats.json", "w") as json_file:
        json.dump(meats, json_file)
    return {}, 204

if __name__ == "__main__":
    #app.run(ssl_context='adhoc')
    app.run(ssl_context=("cert.pem", "key.pem"))
    # generated using OpenSSL, which comes packaged inside Git for Windows!
    # in the G4W command line, use this command to generate a self-signed certificate:
    # openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 365
    # fill out as much of the required info as possible, but note that the Common Name has specific requirements
    # to test with the local server, I had to set the name to "127.0.0.1" (inside the quotations)
    # "localhost" did not work, causing errors when testing with the other Python test file
