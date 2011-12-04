from d2.models.base import Base
from d2.models.guide  import GuideModel
from d2.models.comment import CommentModel
from sqlalchemy import Column, Integer, String, Date, DateTime
from sqlalchemy.orm import relationship

class UserModel(Base):
    __tablename__ = 'users'
    
    id = Column(Integer, primary_key=True)
    username = Column(String(50))

    guides = relationship(GuideModel, backref="author")
    comments = relationship(CommentModel, backref="author")

    def __init__(self, **fields):
        self.__dict__.update(fields)

    def __repr__(self):
        return "<User('%s', '%s')>" % (self.id,
                                       self.username)