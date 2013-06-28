from cherrypy import wsgiserver

def my_crazy_app(environ, start_response):
    status = '200 OK'
    response_headers = [('Content-type','text/plain')]
    start_response(status,response_headers)
    return ['Hello world']

server = wsgiserver.CherryPyWSGIServer(
        ('0.0.0.0',8070),my_crazy_app,
        server_name='www.cherrypy.example')
try:
    server.start()
except (KeyboardInterrupt,SystemExit):
    print "good bye~~"
    server.stop()
    server = None
