from d2.models.base import Base
from d2.models.guide  import GuideModel
from sqlalchemy import ForeignKey
from sqlalchemy import Column, Integer, String, Date, DateTime
from sqlalchemy.orm import relationship

class HeroModel(Base):
    __tablename__ = 'heroes'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100))
    description = Column(String(400))
    image_name = Column(String(100))

    guides = relationship(GuideModel, backref="hero")

    def __init__(self, **fields):
        self.__dict__.update(fields)

    def __repr__(self):
        return "<Hero('%s', '%s', '%s', '%s')>" % (self.id,
                                                   self.name,
                                                   self.description,
                                                   self.image_name)
