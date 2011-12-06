from pyramid.view import view_config
from d2.models.item import ItemModel
from d2.models.hero import HeroModel
from d2.models.guide import GuideModel
from d2.forms import GuidesAddForm

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
        request = self.request
        title = "Create Guide"
        sections = ['starting', 'early', 'core', 'luxury']

        heroes = db.query(HeroModel).all()

        items = db.query(ItemModel).all()
        items = self.splitItems(items)
        
        form = GuidesAddForm(request.POST)
        if request.method == 'POST' and form.validate():
            POST = request.POST
            guide = GuideModel(name=POST['name'],
                               created=datetime.now(),
                               edited=datetime.now(),
                               hero_id=['hero_id'],
                               user_id=1)
            for section in sections:
                section_items = request.getall(section)
                for section_item in section_items:
                    pass
        return {'title':title,
                'basic_items':items['basic_items'],
                'upgrade_items':items['upgrade_items'],
                'heroes':heroes,
                'form':form}
    
    def splitItems(self, items):
        item_dict = {}
        basic_items = {}
        upgrade_items = {}
        basic_categories = ['consumables', 'attributes', 'armaments', 'arcane']
        upgrade_categories= ['common', 'support', 'caster', 'weapons', 'armor', 'artifacts']

        
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
        
        item_dict['basic_items'] = basic_items
        item_dict['upgrade_items'] = upgrade_items
        return item_dict
