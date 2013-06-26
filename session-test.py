import web

web.config.debug = False

web.config.db_parameters = {
        'dbn' : 'mysql',
        'host' : 'localhost',
        'user' : 'root',
        'pw' : '',
        'db' : 'fun'
        }

urls = (
        '/', 'index'
        )

class index:
    def GET(self):
        s = web.ctx.session
        s.start()

        try:
            s.click += 1
        except AttributeError:
            s.click = 1

        print 'click: ', s.click
        s.save()

if __name__ == '__main__':
    app =  web.application(urls, globals())
    app.run()
