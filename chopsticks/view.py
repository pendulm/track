# coding: utf-8

from bottle import request, run, get, post

@get('/')
@get('/index')
def index():
    return "it's works"

@post('/new')
def add_new():
    pass

@post('/edit/<item:int>')
def edit(method, item):
    pass


@post('/delete/<item:int>')
def delete(item):
    pass
