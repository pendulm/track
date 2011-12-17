import os.path
from string import Template
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


    method = environ['REQUEST_METHOD'].lower()
    if method == 'get':
        filename = '../template/index.html'

    elif method == 'post':
        filename = '../template/post.html'
        post_html = open(filename).read()
        t = Template(post_html)

        post_body = ''
        try:
            lens = int(environ.get('CONTENT_LENGTH', 0))
        except:
            lens = 0
        if not lens:
            post_body = environ['wsgi.input'].read(lens)

        template = t.substitute(cooked=post_body)

    if not locals().has_key('template'):
        f = open(filename)
        template = f.read()

    start_response(status, responce_headers)
    return [template]

httpd = make_server('', 8000, application)
print "serving on port 8000..."
httpd.serve_forever()
