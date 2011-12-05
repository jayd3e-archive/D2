from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
from d2.forms import HeroesAddForm
from d2.models.hero import HeroModel

class HeroViews(object):
    def __init__(self, request):
        self.request = request
        self.here = request.environ['PATH_INFO']
        self.matchdict = request.matchdict
        self.db = request.db
    
    @view_config(route_name='heroes_add', renderer='heroes/add.mako')
    def add(self):
        title = "Add Hero"

        request = self.request
        db = self.db

        form = HeroesAddForm(request.POST)
        if request.method == 'POST' and form.validate():
            hero = HeroModel()
            hero.name = form.name.data
            hero.description = form.description.data
            hero.image_name = form.image_name.data
            db.add(hero)
            db.flush()
            return HTTPFound(location='/heroes/add')
        return {'here':self.here,
                'title':title,
                'form':form}
        