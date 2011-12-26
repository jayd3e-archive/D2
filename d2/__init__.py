from pyramid.config import Configurator
from pyramid.authentication import SessionAuthenticationPolicy
from pyramid.authorization import ACLAuthorizationPolicy
from d2.models.base import initializeBase
from d2.models.comment import CommentModel
from d2.models.guide import GuideModel
from d2.models.guide_item import GuideItemModel
from d2.models.hero import HeroModel
from d2.models.item import ItemModel
from d2.models.user import UserModel
from d2.resources import Site
from d2.request import D2Request
from d2.security import groupfinder
from sqlalchemy import engine_from_config
from sqlalchemy.orm import sessionmaker

def main(global_config, **settings):
        '''Main config function'''
        engine = engine_from_config(settings, 'sqlalchemy.')
        initializeBase(engine)
        # NOTE: A transaction is created by default in postgres, so I have added the
        # 'autocommit' kwarg so that I don't have to deal with transactions for
        # the moment.  Remove it once I have pyramid_tm & zope.sqlalchemy implemented.
        maker = sessionmaker(bind=engine, autocommit=True)
        settings['db.sessionmaker'] = maker
        
        authentication_policy = SessionAuthenticationPolicy(callback=groupfinder)
        authorization_policy = ACLAuthorizationPolicy()
        config = Configurator(settings=settings,
                              root_factory=Site,
                              request_factory=D2Request,
                              authentication_policy=authentication_policy,
                              authorization_policy=authorization_policy)
        
        # Includes
        config.include('pyramid_beaker')

        # Security
        config.set_default_permission('everyone')

        config.add_static_view(name='static', path='d2:static')
                            
        config.add_route('root', '/')            
        #Handler Root Routes
        config.add_route('guides_root', '/guides')
        config.add_route('login', '/login')
        config.add_route('logout', '/logout')
        config.add_route('download', '/download/{id}')
        #Handler Action Routes
        config.add_route('guides_add', '/guides/add')
        config.add_route('guides_view', '/guides/view/{id}')
        config.add_route('heroes_add', '/heroes/add')
        config.add_route('items_add', '/items/add')
                          
        config.scan('d2')
        return config.make_wsgi_app()

if __name__ == '__main__':
    from paste.httpserver import serve
    serve(main(), host="0.0.0.0", port="5432")
