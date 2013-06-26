import web
import view
from view import render

urls = ('/.*','hello')
app = web.application(urls,globals())

class hello:
    def GET(self):
        return render.zhkzyth()

if __name__ == '__main__':
    app.run()
