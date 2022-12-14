from http.server import BaseHTTPRequestHandler, HTTPServer
from MBSE_Library import MBSE
import cgi

hostName = "localhost"
serverPort = 8080


class MyServer(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_POST(self):
        self._set_headers()
        form = cgi.FieldStorage(
            fp=self.rfile,
            headers=self.headers,
            environ={'REQUEST_METHOD': 'POST'}
        )
        for v1 in form.keys():
            if v1 == "create_class":
                MBSE.create_class(form.getvalue(v1))
            if v1 == "create_method":
                method_name = ""
                class_name = ""
                isStatic = False
                scope = ""
                return_type = ""
                for v2 in form.keys():
                    if v2 == "create_method":
                        class_name = form.getvalue(v2)
                    if v2 == "method_name":
                        method_name = form.getvalue(v2)
                    if v2 == "return_type":
                        return_type = form.getvalue(v2)
                    if v2 == "scope":
                        scope = form.getvalue(v2)
                    if v2 == "static":
                        if form.getvalue(v2) == "True":
                            isStatic = True

                MBSE.add_method_to_class(method_name, class_name, scope, isStatic, return_type)

        MBSE.print_uml("code")

    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(bytes("<html><head><title>MBSE Library Server</title></head>", "utf-8"))
        self.wfile.write(bytes("<p>Request: %s</p>" % self.path, "utf-8"))
        self.wfile.write(bytes("<body>", "utf-8"))
        self.wfile.write(bytes("<p>Your request was received and is processing.</p>", "utf-8"))
        self.wfile.write(bytes("</body></html>", "utf-8"))


if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")
