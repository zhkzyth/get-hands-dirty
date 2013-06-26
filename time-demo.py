#!/usr/bin/env python
# encoding: utf-8
"""
time-demo.py

Created by <zhkzyth@gmail.com> on Apr 16, 2013
"""
import timeit

def main():


    print "run the inser code"
    t = timeit.Timer('test.run_insert()','import test')
    print t.timeit()
    print "run the append code"
    t = timeit.Timer('test.run_append()','import test')
    print t.timeit()


if __name__ == '__main__':
    main()

