#!/usr/bin/env python

import dlna
import json
import os
import coloredlogs

from bottle import route, run, template,static_file,get,response,redirect
from config import SERVER_PATH

fs = dlna.start()

@get('/')
def goto_html():
    redirect('/static/index.html')


@get('/static/<filename:path>')
def send_static(filename):
    root = os.path.dirname(__file__)
    root = os.path.join(root,'static')
    return static_file(filename, root=root)

def json_encode(obj):
    return json.dumps(obj,indent=4)        

@get('/media/')
def list_media():
    response.headers['Content-Type'] = 'application/json'
    # Add this for test on local server
    # response.headers['Access-Control-Allow-Origin'] = '*'
    r = dlna.extract_dlna(fs,SERVER_PATH)
    return json_encode(r)

@get('/media/<path:path>')
def list_media(path):
    response.headers['Content-Type'] = 'application/json'
    r = dlna.extract_dlna(fs,SERVER_PATH+path)
    return json_encode(r)



if __name__ == '__main__':
    coloredlogs.install(level='INFO')
    run(host='0.0.0.0', port=7777)
    
