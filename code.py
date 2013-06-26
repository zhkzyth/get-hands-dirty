#!/usr/bin/env python
# encoding: utf-8
"""
code.py

Created by <zhkzyth@gmail.com> on  6 24, 2013
"""

import web
import view,config
from view import render

urls = ( '/','index')

class index:
    def GET(self):
        return render.base(view.listing())

if __name__ == '__main__':
    app = web.application(urls,globals())
    app.internalerror = web.debugerror
    app.run()
