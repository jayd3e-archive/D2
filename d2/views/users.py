from datetime import datetime
from pyramid.view import view_config
from d2.models.guide import GuideModel
from d2.models.user import UserModel
from sqlalchemy import func
from sqlalchemy.sql.expression import desc

class UserViews(object):
    def __init__(self, request):
        self.request = request
        self.matchdict = request.matchdict
        self.db = request.db
    
    @view_config(route_name='users_profile', renderer='users/profile.mako')
    def profile(self):
        db = self.db
        request = self.request
        title = "User Profile"
        
        # Page variables
        username = request.matchdict.get('username', 'Anonymous')

        # Paginator values
        page = int(request.GET.get('page', 0))
        guides_per_page = 50
        
        user = db.query(UserModel).filter_by(username=username).first()
        query = db.query(GuideModel).order_by(desc(GuideModel.created))
        query = query.filter_by(user_id=user.id)
        guides = query.slice((guides_per_page * page) + 1, 
                             guides_per_page * (page + 1)).all()
        num_of_guides = db.query(func.count(GuideModel.id)).filter_by(user_id=user.id).first()
        num_of_pages = num_of_guides[0] / guides_per_page

        if num_of_pages < 1:
            num_of_pages = 1
        
        page = page if page is not 0 else page + 1
        return {'title':title,
                'viewed_user':user,
                'guides':guides,
                'num_of_pages':num_of_pages,
                'page':page}
