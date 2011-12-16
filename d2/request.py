from pyramid.request import Request
from pyramid.decorator import reify
from pyramid.security import unauthenticated_userid
from d2.models.user import UserModel

class D2Request(Request):
    @reify
    def db(self):
        maker = self.registry.settings['db.sessionmaker']
        return maker()
    
    @reify
    def user(self):
    	session = self.db
    	user_id = unauthenticated_userid(self)
    	if user_id is not None:
             # this should return None if the user doesn't exist
             # in the database
             return session.query(UserModel).filter_by(id=user_id).first()