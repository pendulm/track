import os.path
from wsgiref.simple_server import make_server
from wsgiref.util import request_uri
from urlparse import urlparse

BASEDIR = os.path.abspath('..')
MIMETYPE = {'css' : 'css',
        'js' : 'javascript'
        }

def application(environ, start_response):
    status = '200 OK'
    responce_headers = [('Content-type', 'text/html; charset=utf-8')]
    path = urlparse(request_uri(environ)).path
    print urlparse(request_uri(environ)).path

    if path.startswith('/pub'):
        if os.path.isfile(BASEDIR + path):
            filename = BASEDIR + path
            mime = path.rsplit('.', 1)[1]
            responce_headers = [('Content-type', 'text/' + MIMETYPE.get(mime, 'plain'))]
        else:
            template = status = '404 Not Found'
    else:
        filename = BASEDIR + '/template/index.html'

    if not locals().has_key('template'):
        f = open(filename)
        template = f.read()
    start_response(status, responce_headers)
    return [template]

httpd = make_server('', 8000, application)
print "serving on port 8000..."
httpd.serve_forever()
