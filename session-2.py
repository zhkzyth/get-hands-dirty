# Session example

import time
import web

urls = (
        '/(.*)', 'index'
        )
web.config.debug = False

class index:
    def GET(self, rest):
        # if you are going to use FileHandler
            #web.config.session_parameters.handler = 'file'
            # set the file prefix
            #web.config.handler_parameters.file_prefix = 'sess'
            # and directory
            #web.config.handler_parameters.file_dir = '/tmp'

            if rest == 'logout':
                web.ctx.session.start()
                web.ctx.session.destroy()
                web.redirect('/')
                return

            print '<html><body>'
            print 'don\'t forget to create sqlite db-file web.db and table session_data'
            print '<br>'
            print '------------------------------------'
            print '<br>'
            print 'client cookies at start: ', web.websafe(web.cookies())
            print '<br>'
            print '------------------------------------'
            print '<br>'

            s = web.ctx.session
            print 'starting session ...'
            print '<br>'
            s.start()
            print '------------------------------------'
            print '<br>'

            print 'got session: ', web.websafe(s)
            print '<br>'
            print '------------------------------------'
            print '<br>'

            try:
                t = s.time
            except AttributeError:
                t = False

            print 'last hit at: ', web.websafe(t)
            print '<br>'
            print '------------------------------------'
            print '<br>'

            if not t:
                s['1'] = 0
                s['2'] = 0
                s['3'] = 0

            if rest in ('1', '2', '3'):
                print '<b>you\'re on page no. ', rest, '</b>'
                print '<br>'
                print '------------------------------------'
                print '<br>'
                s[rest] += 1

            print 'changing data ...'
            print '<br>'
            s.time = time.strftime('%a, %d %b %Y %H:%M:%S')

            print '------------------------------------'
            print '<br>'
            print 'page <a href="/1">1</a>: ', s['1'], ' times'
            print '<br>'
            print 'page <a href="/2">2</a>: ', s['2'], ' times'
            print '<br>'
            print 'page <a href="/3">3</a>: ', s['3'], ' times'
            print '<br>'
            print '------------------------------------'
            print '<br>'

            print '<a href="/logout">destroy session</a>'
            print '<br>'

            s.save()

            print '<!--'
            print web.ctx
            print '-->'
            print '</body></html>'

web.webapi.internalerror = web.debugerror

if __name__ == '__main__':
    web.config.db_printing = True
    app = web.application(urls, globals())
    db = web.database(dbn='mysql',db='fun',user='root',pw='')
    store = web.session.DBStore(db,'sessions')
    #start our sessions here
    session = web.session.Session(app, web.session.DiskStore('sessions'), initializer={'count': 0})

    app.run()
