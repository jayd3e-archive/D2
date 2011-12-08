from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
from d2.forms import ItemsAddForm
from d2.models.item import ItemModel

class ItemViews(object):
    def __init__(self, request):
        self.request = request
        self.here = request.environ['PATH_INFO']
        self.matchdict = request.matchdict
        self.db = request.db
    
    #@view_config(route_name='items_add', renderer='items/add.mako')
    def add(self):
        title = "Add Item"

        request = self.request
        db = self.db
        
        form = ItemsAddForm(request.POST)
        if request.method == 'POST' and form.validate():
            item = ItemModel()
            item.name = form.name.data
            item.cost = form.cost.data
            item.description = form.description.data
            item.image_name = form.image_name.data
            db.add(item)
            db.flush()
            return HTTPFound(location='/items/add')
        return {'here':self.here,
                'title':title,
                'form':form}
        