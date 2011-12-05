from d2.models.base import Base
from sqlalchemy import ForeignKey
from sqlalchemy import Column, Integer, String, Date, DateTime
from sqlalchemy.ext.associationproxy import association_proxy

class ItemModel(Base):
    __tablename__ = 'items'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100))
    category = Column(String(100))
    cost = Column(Integer)
    description = Column(String(1000))
    image_name = Column(String(100))

    guides = association_proxy('guide_item', 'guide')
    builds = association_proxy('require_items', 'build')
    requires = association_proxy('build_items', 'require')

    def __init__(self, **fields):
        self.__dict__.update(fields)

    def __repr__(self):
        return "<Item('%s', '%s', '%s')>" % (self.id,
                                             self.name,
                                             self.description,
                                             self.image_name)