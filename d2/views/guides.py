from pyramid.view import view_config
from d2.models.item import ItemModel

class GuideViews(object):
    def __init__(self, request):
        self.request = request
        self.here = request.environ['PATH_INFO']
        self.matchdict = request.matchdict
        self.db = request.db
    
    @view_config(route_name='root', renderer='guides/index.mako') 
    @view_config(route_name='guides_root', renderer='guides/index.mako')
    def index(self):
        title = "D2"
        return {'title':title}

    @view_config(route_name='guides_add', renderer='guides/add.mako')
    def add(self):
        db = self.db
        title = "Create Guide"

        basic_items = {}
        upgrade_items = {}
        basic_categories = ['consumables', 'attributes', 'armaments', 'arcane']
        upgrade_categories= ['common', 'support', 'caster', 'weapons', 'armor', 'artifacts']

        items = db.query(ItemModel).all()
        for item in items:
            if item.category in basic_categories:
                key = item.category.capitalize()
                if key in basic_items:
                    basic_items[key].append(item)
                else:
                    basic_items[key] = [item]
            elif item.category in upgrade_categories:
                key = item.category.capitalize()
                if key in upgrade_items:
                    upgrade_items[key].append(item)
                else:
                    upgrade_items[key] = [item]

        return {'title':title,
                'basic_items':basic_items,
                'upgrade_items':upgrade_items}
