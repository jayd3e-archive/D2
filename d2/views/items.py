from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
from d2.forms import ItemsAddForm
from d2.models.item import ItemModel

class ItemViews(object):
    def __init__(self, request):
        self.request = request
        self.matchdict = request.matchdict
        self.db = request.db
        self.user = request.user
    
    @view_config(route_name='items_add', renderer='items/add.mako', permission='admin')
    def add(self):
        title = "Add Item"

        request = self.request
        db = self.db
        
        form = ItemsAddForm(request.POST)
        if request.method == 'POST' and form.validate():
            item = ItemModel()
            item.name = form.name.data
            item.cost = form.cost.data
            item.category = form.category.data
            item.resource_name = form.resource_name.data
            item.description = form.description.data
            item.image_name = form.image_name.data
            db.add(item)
            db.flush()
            return HTTPFound(location='/items/add')
        return {'title':title,
                'form':form}
        