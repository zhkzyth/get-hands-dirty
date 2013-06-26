#!/usr/bin/env python
# encoding: utf-8
"""
model.py

Created by <zhkzyth@gmail.com> on  6 25, 2013
"""
import web

db = web.database(dbn='mysql',db='fun',user='root')

def get_todos():
    return db.select('todo',order='id')

def new_todo(text):
    db.insert('todo',title=text)

def del_todo(id):
    db.delete('todo',where='id=$id',vars=locals())
