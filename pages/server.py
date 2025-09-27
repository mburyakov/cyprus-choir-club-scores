import http.server
import socketserver

import generate_static

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory="../out/pages", **kwargs)

if __name__ == "__main__":
    generate_static.main()

    PORT = 8000
    handler = Handler
    handler.directory = "../out/pages"
    with socketserver.TCPServer(("", PORT), handler) as httpd:
        print("serving at port", PORT)
        httpd.serve_forever()