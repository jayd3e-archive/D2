from pyramid.view import view_config

class GuideViews(object):
    def __init__(self, request):
        self.request = request
        self.here = request.environ['PATH_INFO']
        self.matchdict = request.matchdict
    
    @view_config(route_name='root', renderer='issues/index.mako') 
    @view_config(route_name='guides_root', renderer='issues/index.mako')
    def index(self):
        pass