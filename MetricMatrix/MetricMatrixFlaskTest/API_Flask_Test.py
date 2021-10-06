# currently, this won't work unless it's in the virtual environment (on my (Max's) machine)
# that will require commands "venv\Scripts\activate" on windows to activate and "deactivate" to deactivate
# to activate the server (on linux or mac), put "export FLASK_APP=API_Flask_Test.py" into the command line
# on windows, do "set FLASK_APP=API_Flask_Test.py" instead
# you can use "export/set FLASK_ENV=development" to make the server restart whenever there is a change in the program
# that includes API_Request_Test, so changing that file will reset the server to its defaults
# note that the export/set commands MUST NOT have spaces around the "="

import flask
# this test does not include flask_restful, which is a separate package
# that might be useful to install since it seems like it makes things easier

app = flask.Flask(__name__)

meats = [
    {"color":"red", "weight":"heavy", "flavor":"strong", "personality":"saccharine"},
    {"color":"brown", "weight":"medium", "flavor":"weak", "personality":"cruel"},
    {"color":"pink", "weight":"light", "flavor":"medium", "personality":"impetuous"}
    ]

@app.get("/meats")
def get_meats():
    return flask.jsonify(meats)

@app.post("/meats")
def add_meat():
    if flask.request.is_json:
        meat = flask.request.get_json()
        meats.append(meat)
        return meat, 201
    return {"error": "POST request must be JSON"}, 415
