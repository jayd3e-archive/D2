from pyramid.exceptions import NotFound
from pyramid.exceptions import Forbidden
from pyramid.httpexceptions import HTTPFound
from pyramid.view import view_config

@view_config(context=NotFound,
             renderer='exceptions/not_found.mako',
             permission='__no_permission_required__')
def notFound(self, request):
    title = 'Page Not Found'
    return {'title':title}

@view_config(context=Forbidden,
             renderer='exceptions/forbidden.mako', 
             permission='__no_permission_required__')
def forbidden(self, request):
    return HTTPFound(location='/auth/login')