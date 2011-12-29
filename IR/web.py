#!/usr/bin/python
# coding: utf-8
import os
import sys
from jinja2 import Template
from wsgiref.simple_server import make_server
from wsgiref.util import request_uri
from urlparse import urlparse, parse_qs
import urllib
from os.path import abspath, dirname
from retrieve import get_back, get_doc
#
# IMPORTANT: Put any additional includes below this line. If placed above this
# line, it's possible required libraries won't be in your searchable path
# 

def application(environ, start_response):

    method = environ['REQUEST_METHOD'].lower()
    ctype = 'text/html; charset=utf-8'
    filename = 'index.htm'
    response_body = open(filename).read()
    path =  urlparse(request_uri(environ))
    t = Template(response_body)
    post_body = ''
    if method == 'get':
        if path.path.startswith('/list'):
            docid = path.query.split('=')[1]
            docid = int(docid)
            response_body = get_doc(docid).get_data()
        else:
            response_body = t.render(ms=None,isreturn=0)
    elif method == 'post':
        try:
            lens = int(environ.get('CONTENT_LENGTH', 0))
        except:
            lens = 0
        if lens:
            post_body = environ['wsgi.input'].read(lens)
            post_body = urllib.unquote_plus(post_body)[4:]
            post_body = post_body.decode('utf-8')
            num, docs = get_back(post_body)
        response_body = t.render(ms=docs,isreturn=1, num=num)

    status = '200 OK'
    response_headers = [('Content-Type', ctype), ('Content-Length', str(len(response_body)))]
    if type(response_body) is unicode:
        response_body = response_body.encode('utf-8')
    start_response(status, response_headers)
    return [response_body]

#
# Below for testing only
#
if __name__ == '__main__':
	from wsgiref.simple_server import make_server
	httpd = make_server('localhost', 8000, application)
        print "-------start run at localhost:8000---------"
        httpd.serve_forever()
