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
    min_hp = Column(Integer)
    max_hp = Column(Integer)
    min_mana = Column(Integer)
    max_mana = Column(Integer)
    min_damage = Column(Integer)
    max_damage = Column(Integer)
    armor = Column(Integer)
    movespeed = Column(Integer)
    attack_range = Column(Integer)
    min_attack_animation = Column(Integer)
    max_attack_animation = Column(Integer)
    min_cast_animation = Column(Integer)
    max_cast_animation = Column(Integer)
    base_attack_time = Column(Integer)
    missile_speed = Column(Integer)
    day_site_range = Column(Integer)
    night_site_range = Column(Integer)
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
               '%s', '%s', '%s', '%s', '%s', '%s', '%s',\
               '%s', '%s', '%s', '%s', '%s', '%s')>" % (self.id,
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
                                                        self.min_hp,
                                                        self.max_hp,
                                                        self.min_mana,
                                                        self.max_mana,
                                                        self.min_damage,
                                                        self.max_damage,
                                                        self.armor,
                                                        self.movespeed,
                                                        self.attack_range,
                                                        self.min_attack_animation,
                                                        self.max_attack_animation,
                                                        self.min_cast_animation,
                                                        self.max_cast_animation,
                                                        self.base_attack_time,
                                                        self.missile_speed,
                                                        self.day_site_range,
                                                        self.night_site_range,
                                                        self.resource_name,
                                                        self.order)
