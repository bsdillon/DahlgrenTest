from http.server import BaseHTTPRequestHandler, HTTPServer
from MBSE_Library import MBSE
hostName = "localhost"
serverPort = 8080


class MyServer(BaseHTTPRequestHandler):

    def do_POST(self):
        self.send_response(200)
        self.send_response_only(200)
        content_len = int(self.headers.get('Content-Length'))
        command = str(self.rfile.read(content_len))
        command = command.split('=')
        print(command)
        # /create_package/package_name
        if command[0] == "b'create_package":
            MBSE.add_package(command[1][:-1])
            print("created " + command[1][:-1])

        # /create_class/class_name
        elif command[0] == "b'create_class":
            MBSE.add_class(command[1][:-1])
            print("created " + command[1][:-1])

        # /create_method/class_name/method_name
        # Class_name = " + member.Represented.Code + " = " + static + " = " + scope;
        elif command[0] == "b'create_method":
            MBSE.add_method_to_class(command[2], command[1], command[4], bool(command[3]), "")
            print("created " + command[1] + " with " + command[3])
        elif command[0] == "b'print_uml":
            MBSE.print_uml()
        else:
            print("error")
        print("received")
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
        print(self.path)
        command = self.path.split('=')
        print(command)


if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")
