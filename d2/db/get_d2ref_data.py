import os
import base64
import unittest
from datetime import datetime
from d2.models.base import Base as D2Base
from d2.models.user import UserModel
from d2.models.guide import GuideModel
from d2.models.comment import CommentModel
from d2.models.hero import HeroModel
from d2.models.item import ItemModel
from d2.models.guide_item import GuideItemModel
from d2.models.item_item import ItemItemModel
from d2.models.skill import SkillModel
from d2.models.base import initializeBase
from sqlalchemy.orm import sessionmaker
from sqlalchemy import engine_from_config
from sqlalchemy import Column, Integer, String, Date, DateTime
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
# Models
class D2RefHeroModel(Base):
    __tablename__ = 'heroes'
    
    id = Column(Integer, primary_key=True)                        
    name = Column(String(140))
    common_name = Column(String(140))                 
    image = Column(String(240))
    faction = Column(String(140))
    stat = Column(String(140))
    roles = Column(String(140))
    content = Column(String(140))
    strength = Column(String(140))
    agility = Column(String(140))
    intelligence = Column(String(140))
    hp = Column(String(140))
    mana = Column(String(140))
    damage = Column(String(140))
    armor = Column(String(140))
    movespeed = Column(String(140))
    attackRange = Column(String(140))
    attackAnimation = Column(String(140))
    castAnimation = Column(String(140))
    baseAttackTime = Column(String(140))
    missileSpeed = Column(String(140))
    siteRange = Column(String(140))
    q_name = Column(String(140))
    q_image = Column(String(140))
    q_content = Column(String(140))
    w_name = Column(String(140))
    w_image = Column(String(140))
    w_content = Column(String(140))
    e_name = Column(String(140))
    e_image = Column(String(140))
    e_content = Column(String(140))
    r_name = Column(String(140))
    r_image = Column(String(140))
    r_content = Column(String(140))
    sort = Column(Integer)
    active = Column(Integer) 

class D2RefItemModel(Base):
    __tablename__ = 'items'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(140))
    image = Column(String(140))
    cost = Column(String(140))
    content = Column(String(140))
    buildsTo = Column(String(140))
    buildsFrom = Column(String(140))
    vendor = Column(String(140))
    hon = Column(String(140))
    sort = Column(String(140))
    active = Column(String(140))

settings_d2ref = {'sqlalchemy.url' : 'mysql+pymysql://root:sharp7&7@localhost/dota2reference'}
settings_d2 = {'sqlalchemy.url' : 'postgresql+psycopg2://jayd3e:sharp7&7@localhost/d2'}
        
engine_d2ref = engine_from_config(settings_d2ref, 'sqlalchemy.')
engine_d2 = engine_from_config(settings_d2, 'sqlalchemy.')
initializeBase(engine_d2)

SessionD2Ref = sessionmaker(bind=engine_d2ref)
SessionD2 = sessionmaker(bind=engine_d2)

session_d2ref = SessionD2Ref()
session_d2 = SessionD2()

# List of fields needed:
# faction = Column(String(10))
# stat = Column(String(15))
# roles = Column(String(50))
# strength = Column(Float)
# agility = Column(Float)
# intelligence = Column(Float)
# strength_gain = Column(Float)
# agility_gain = Column(Float)
# intelligence_gain = Column(Float)
# min_hp = Column(Integer)
# max_hp = Column(Integer)
# min_mana = Column(Integer)
# max_mana = Column(Integer)
# min_damage = Column(Integer)
# max_damage = Column(Integer)
# armor = Column(Float)
# movespeed = Column(Integer)
# attack_range = Column(Integer)
# min_attack_animation = Column(Float)
# max_attack_animation = Column(Float)
# min_cast_animation = Column(Float)
# max_cast_animation = Column(Float)
# base_attack_time = Column(Float)
# missile_speed = Column(Integer)
# day_site_range = Column(Integer)
# night_site_range = Column(Integer)
# resource_name = Column(String(100))
# order = Column(Integer)
#

heroes = session_d2ref.query(D2RefHeroModel).all()
for hero in heroes:
    hero_exists = session_d2.query(HeroModel).filter_by(name=hero.common_name).first()

    strength = hero.strength.split('+')
    agility = hero.agility.split('+')
    intelligence = hero.intelligence.split('+')
    hp = hero.hp.split('-')
    min_hp = hp[0]
    max_hp = hp[1]
    mana = hero.mana.split('-')
    min_mana = mana[0]
    max_mana = mana[1]
    damage = hero.damage.split('-')
    min_damage = damage[0]
    max_damage = damage[1]
    if ' ' in hero.attackRange:
        attack_range = hero.attackRange.split(' ')[0]
    elif '(' in hero.attackRange:
        attack_range = hero.attackRange.split('(')[0]
    attack_anim = hero.attackAnimation.split('/')
    min_attack_animation = attack_anim[0]
    max_attack_animation = attack_anim[1]
    cast_anim = hero.castAnimation.split('/')
    min_cast_animation = cast_anim[0]
    max_cast_animation = cast_anim[1]

    if hero.missileSpeed == 'Instant':
        missile_speed = 0
    else:
        missile_speed = hero.missileSpeed

    site_range = hero.siteRange.split('/')
    day_site_range = site_range[0]
    night_site_range = site_range[1]
    if not hero_exists:
        new_hero = HeroModel(faction=hero.faction,
                             stat=hero.stat,
                             roles=hero.roles,
                             strength=float(strength[0].strip()),
                             strength_gain=float(strength[1].strip()),
                             agility=float(agility[0].strip()),
                             agility_gain=float(agility[1].strip()),
                             intelligence=float(intelligence[0].strip()),
                             intelligence_gain=float(intelligence[1].strip()),
                             min_hp=int(min_hp),
                             max_hp=int(max_hp),
                             min_mana=int(min_mana),
                             max_mana=int(max_mana),
                             min_damage=int(min_damage),
                             armor=float(hero.armor),
                             movespeed=int(hero.movespeed),
                             attack_range=int(attack_range),
                             min_attack_animation=float(min_attack_animation),
                             max_attack_animation=float(max_attack_animation),
                             min_cast_animation=float(min_cast_animation),
                             max_cast_animation=float(max_cast_animation),
                             base_attack_time=float(hero.baseAttackTime),
                             missile_speed=int(missile_speed),
                             day_site_range=int(day_site_range),
                             night_site_range=int(night_site_range),
                             order=int(hero.sort)
                             )
        print("Hero doesn't exist: " + hero.common_name)
        session_d2.add(new_hero)
    else:
        hero_exists.faction=hero.faction
        hero_exists.stat=hero.stat
        hero_exists.roles=hero.roles
        hero_exists.strength=float(strength[0].strip())
        hero_exists.strength_gain=float(strength[1].strip())
        hero_exists.agility=float(agility[0].strip())
        hero_exists.agility_gain=float(agility[1].strip())
        hero_exists.intelligence=float(intelligence[0].strip())
        hero_exists.intelligence_gain=float(intelligence[1].strip())
        hero_exists.min_hp=int(min_hp)
        hero_exists.max_hp=int(max_hp)
        hero_exists.min_mana=int(min_mana)
        hero_exists.max_mana=int(max_mana)
        hero_exists.min_damage=int(min_damage)
        hero_exists.armor=float(hero.armor)
        hero_exists.movespeed=int(hero.movespeed)
        hero_exists.attack_range=int(attack_range)
        hero_exists.min_attack_animation=float(min_attack_animation)
        hero_exists.max_attack_animation=float(max_attack_animation)
        hero_exists.min_cast_animation=float(min_cast_animation)
        hero_exists.max_cast_animation=float(max_cast_animation)
        hero_exists.base_attack_time=float(hero.baseAttackTime)
        hero_exists.missile_speed=int(missile_speed)
        hero_exists.day_site_range=int(day_site_range)
        hero_exists.night_site_range=int(night_site_range)
        hero_exists.order=int(hero.sort)
    session_d2.flush()

# List of item fields to copy over:
# hon_name = Column(String(100))
# order = Column(Integer)

items = session_d2ref.query(D2RefItemModel).all()
for item in items:
    item_exists = session_d2.query(ItemModel).filter_by(name=item.name).first()
    if item_exists:
        item_exists.hon_name = item.hon
        item_exists.order = item.sort
    else:
        print("This item didn't get transfered: " + item.name)
    session_d2.flush()

session_d2.commit()
