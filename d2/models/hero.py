from d2.models.base import Base
from d2.models.guide  import GuideModel
from d2.models.skill  import SkillModel
from sqlalchemy import ForeignKey
from sqlalchemy import Column, Integer, String, Date, DateTime
from sqlalchemy.orm import relationship

class HeroModel(Base):
    __tablename__ = 'heroes'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100))
    description = Column(String(1000))
    image_name = Column(String(100))
    default_filename = Column(String(100))
    faction = Column(String(10))
    stat = Column(String(15))
    roles = Column(String(50))
    strength = Column(Integer)
    agility = Column(Integer)
    intelligence = Column(Integer)
    strength_gain = Column(Integer)
    agility_gain = Column(Integer)
    intelligence_gain = Column(Integer)
    hp = Column(Integer)
    mana = Column(Integer)
    damage = Column(Integer)
    armor = Column(Integer)
    movespeed = Column(Integer)
    attack_range = Column(Integer)
    attack_animation = Column(Integer)
    cast_animation = Column(Integer)
    base_attack_time = Column(Integer)
    missile_speed = Column(Integer)
    site_range = Column(Integer)
    resource_name = Column(String(100))
    order = Column(Integer)

    guides = relationship(GuideModel, backref="hero")
    skills = relationship(SkillModel, backref="hero")

    def __init__(self, **fields):
        self.__dict__.update(fields)

    def __repr__(self):
        return "<Hero('%s', '%s', '%s', '%s', '%s', '%s',\
               '%s', '%s', '%s', '%s', '%s', '%s', '%s',\
               '%s', '%s', '%s', '%s', '%s', '%s', '%s',\
               '%s', '%s', '%s', '%s', '%s', '%s', '%s')>" % (self.id,
                                                             self.name,
                                                             self.description,
                                                             self.image_name,
                                                             self.default_filename,
                                                             self.faction,
                                                             self.stat,
                                                             self.roles,
                                                             self.strength,
                                                             self.agility,
                                                             self.intelligence,
                                                             self.strength_gain,
                                                             self.agility_gain,
                                                             self.intelligence_gain,
                                                             self.hp,
                                                             self.mana,
                                                             self.damage,
                                                             self.armor,
                                                             self.movespeed,
                                                             self.attack_range,
                                                             self.attack_animation,
                                                             self.cast_animation,
                                                             self.base_attack_time,
                                                             self.missile_speed,
                                                             self.site_range,
                                                             self.resource_name,
                                                             self.order)
