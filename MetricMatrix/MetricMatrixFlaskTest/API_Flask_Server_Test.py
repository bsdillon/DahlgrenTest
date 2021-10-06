# currently, this won't work unless it's in the virtual environment (on my (Max's) machine)
# that will require commands "venv\Scripts\activate" on windows to activate and "deactivate" to deactivate
# to activate the server (on linux or mac), put "export FLASK_APP=API_Flask_Server_Test.py" into the command line
# on windows, do "set FLASK_APP=API_Flask_Server_Test.py" instead
# you can use "export/set FLASK_ENV=development" to make the server restart whenever there is a change in the program
# that includes API_Server_Request_Test, so changing that file will reset the server to its defaults
# note that the export/set commands MUST NOT have spaces around the "="
# command "flask run" to run the server when FLASK_APP is set

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
        meat["uuid"] = uuid.uuid4().hex
        meats.append(meat)
        with open("serverMeats.json", "w") as json_file:
            json.dump(meats, json_file)
        return meat, 201
    return {"error": "POST request must be JSON"}, 415

@app.put("/meats")
def replace_meat():
    meat = flask.request.get_json()
    if (meat["uuid"] not in [value for item in meats for value in item.values()]):
        return {"error": "UUID not found"}, 404
    meats[:] = [meat if item["uuid"] == meat["uuid"] else item for item in meats]
    with open("serverMeats.json", "w") as json_file:
        json.dump(meats, json_file)
    return {}, 204

@app.patch("/meats")
def edit_meat():
    incomingMeat = flask.request.get_json()
    try:
        meat = next(item for item in meats if item["uuid"] == incomingMeat["uuid"])
    except StopIteration:
        return {"error": "UUID not found"}, 404
    for key in incomingMeat:
        meat[key] = incomingMeat[key]
    with open("serverMeats.json", "w") as json_file:
        json.dump(meats, json_file)
    return {}, 204

@app.delete("/meats")
def delete_meat():
    uuid = flask.request.form["uuid"]
    try:
        meat = next(item for item in meats if item["uuid"] == uuid)
    except StopIteration:
        return {"error": "UUID not found"}, 404
    meats.remove(meat)
    with open("serverMeats.json", "w") as json_file:
        json.dump(meats, json_file)
    return {}, 204
