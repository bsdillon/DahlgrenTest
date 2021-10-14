import flask
#Flask, request
import flask_restful
#Resource, Api, reqparse
import json
import uuid

app = flask.Flask(__name__)
api = flask_restful.Api(app)

class Meats(flask_restful.Resource):
    def get(self):
        with open("serverMeats.json", "r") as file:
            data = json.load(file)
        return data, 200
    def post(self):
        # the tutorial suggests using request arguments for POSTing, but why bother if we've got JSON already?
        # do keep that url parsing stuff in mind, though
        if(flask.request.is_json):
            meat = flask.request.get_json()
            meat["id"] = uuid.uuid4().hex
            with open("serverMeats.json", "r") as file:
                meats = json.load(file)
            meats.append(meat)
            with open("serverMeats.json", "w") as file:
                json.dump(meats, file)
            return meat, 201
        return {"error": "POST request must be JSON"}, 415
    def delete(self):
        deleteID = flask.request.form["id"]
        with open("serverMeats.json", "r") as file:
            meats = json.load(file)
        meat = next(item for item in meats if item["id"] == deleteID)
        if(meat != None):
            meats.remove(meat)
            with open("serverMeats.json", "w") as file:
                json.dump(meats, file)
        # not bothering with an error this time - if its not there do nothing
        return {}, 204

api.add_resource(Meats, "/meats")

if __name__ == "__main__":
    #app.run(ssl_context='adhoc')
    app.run(ssl_context=("cert.pem", "key.pem"))
    # see the other Flask server test for notes on this
