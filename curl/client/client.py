import falcon, json

class CompaniesResource(object):
  companies = [{"id": 1, "name": "Company One"}, {"id": 2, "name": "Company Two"}]
  def on_get(self, req, resp):
    print("it was returned")
    resp.body = json.dumps(self.companies)

api = falcon.API()
companies_endpoint = CompaniesResource()
api.add_route('/companies', companies_endpoint)