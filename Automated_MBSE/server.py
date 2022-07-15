from http.server import BaseHTTPRequestHandler, HTTPServer
from MBSE_Library import MBSE
hostName = "localhost"
serverPort = 8080


class MyServer(BaseHTTPRequestHandler):

    def do_POST(self):
        #self.send_response(200)
        self.send_response_only(200)
        print("works")
        print(self.command)
        print(self.headers)
        print(self.connection)
        print(self.request)
        content_len = int(self.headers.get('Content-Length'))
        post_body = self.rfile.read(content_len)
        print(post_body)

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
        command = self.path.split('/')
        print(command)

        # /create_package/package_name
        if command[1] == "create_package":
            MBSE.add_package(command[2])
            print("created " + command[2])

        # /create_class/class_name
        elif command[1] == "create_class":
            MBSE.add_class(command[2])
            print("created " + command[2])

        # /create_method/class_name/method_name
        elif command[1] == "create_method":
            MBSE.add_method_to_class(command[2], command[3])
            print("created " + command[2] + " with " + command[3])
        else:
            print("error")
        print("received")
        MBSE.print_uml("code")


if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")
