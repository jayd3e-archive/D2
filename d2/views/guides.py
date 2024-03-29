from datetime import datetime
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
from d2.models.hero import HeroModel
from d2.models.item import ItemModel
from d2.models.guide import GuideModel
from d2.models.guide_item import GuideItemModel
from d2.forms import GuidesAddForm
from sqlalchemy import func
from sqlalchemy.sql.expression import desc

class GuideViews(object):
    def __init__(self, request):
        self.request = request
        self.matchdict = request.matchdict
        self.db = request.db
    
    @view_config(route_name='root', renderer='guides/index.mako') 
    @view_config(route_name='guides_root', renderer='guides/index.mako')
    def index(self):
        db = self.db
        request = self.request
        title = "D2"
        
        # Paginator values
        page = int(request.GET.get('page', 1))
        guides_per_page = 50

        guides = db.query(GuideModel).order_by(desc(GuideModel.created)).slice(guides_per_page * (page - 1), 
                                                                               guides_per_page * page).all()
        num_of_guides = db.query(func.count(GuideModel.id)).first()
        num_of_pages = num_of_guides[0] / guides_per_page

        if num_of_pages < 1:
            num_of_pages = 1
        
        return {'title':title,
                'guides':guides,
                'num_of_pages':num_of_pages,
                'page':page}

    @view_config(route_name='guides_add', renderer='guides/add.mako')
    def add(self):
        db = self.db
        request = self.request
        user = request.user
        
        title = "Create Guide"
        sections = ['starting', 'early', 'core', 'luxury']

        heroes = db.query(HeroModel).order_by(HeroModel.name).all()

        items = db.query(ItemModel).all()
        items = self.splitItems(items)
        
        hero_choices = []
        form = GuidesAddForm(request.POST)
        for hero in heroes:
            hero_choices.append((hero.id, hero.name))
        form.hero_name.choices = hero_choices
        if request.method == 'POST' and form.validate():
            POST = request.POST

            id = user.id if user else 1
            
            guide = GuideModel(name=POST['name'],
                               description=POST['description'],
                               created=datetime.now(),
                               edited=datetime.now(),
                               hero_id=POST['hero_name'],
                               user_id=id)
            db.add(guide)
            db.flush()
            guide_id = guide.id
            for section in sections:
                section_items = POST.getall(section)
                for item_id in section_items:
                    guide_item = GuideItemModel(guide_id=guide_id,
                                                item_id=item_id,
                                                section=section)
                    db.add(guide_item)
            db.flush()
            return HTTPFound('/guides/view/' + str(guide_id))
        
        return {'title':title,
                'basic_items':items['basic_items'],
                'upgrade_items':items['upgrade_items'],
                'secret_items':items['secret_items'],
                'form':form}
    
    @view_config(route_name='guides_view', renderer='guides/view.mako')
    def view(self):
        db = self.db
        request = self.request
        title = "View Guide"
        items = {}
        
        id = request.matchdict['id']
        guide = db.query(GuideModel).filter_by(id=id).first()
        for guide_item in guide.guide_item:
            section = guide_item.section
            if section in items:
                items[section].append(guide_item.item)
            else:
                items[section] = []
                items[section].append(guide_item.item)
        
        return {'title':title,
                'items':items,
                'guide':guide}

    @view_config(route_name='download', renderer='guides/download.mako')
    def download(self):
        db = self.db
        request = self.request
        items = {}
        
        id = request.matchdict['id']
        guide = db.query(GuideModel).filter_by(id=id).first()
        for guide_item in guide.guide_item:
            section = guide_item.section
            if section in items:
                items[section].append(guide_item.item)
            else:
                items[section] = []
                items[section].append(guide_item.item)
        
        request.response.content_disposition = "attachment; filename=" + guide.hero.default_filename
        return {'items':items,
                'guide':guide}
    
    def splitItems(self, items):
        item_dict = {}
        basic_items = {}
        upgrade_items = {}
        secret_items = {}
        basic_vendors = ['consumables', 'attributes', 'armaments', 'arcane']
        upgrade_vendors= ['common', 'support', 'caster', 'weapons', 'armor', 'artifacts']
        secret_vendors= ['secret']

        for item in items:
            if item.vendor in basic_vendors:
                bucket = basic_items
            elif item.vendor in upgrade_vendors:
                bucket = upgrade_items
            elif item.vendor in secret_vendors:
                bucket = secret_items

            key = item.vendor.capitalize()
            bucket = bucket.setdefault(key, [])
            bucket.append(item)
        
        item_dict['basic_items'] = basic_items
        item_dict['upgrade_items'] = upgrade_items
        item_dict['secret_items'] = secret_items
        return item_dict
