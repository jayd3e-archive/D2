import os
import base64
import unittest
from datetime import datetime
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

settings_old = {'sqlalchemy.url' : 'postgresql+psycopg2://jayd3e:sharp7&7@localhost/d2_dev'}
settings_new = {'sqlalchemy.url' : 'postgresql+psycopg2://jayd3e:sharp7&7@localhost/d2'}
        
engine_old = engine_from_config(settings_old, 'sqlalchemy.')
engine_new = engine_from_config(settings_new, 'sqlalchemy.')

SessionOld = sessionmaker(bind=engine_old)
SessionNew = sessionmaker(bind=engine_new)

session_old = SessionOld()
session_new = SessionNew()

heroes = session_old.query(HeroModel).all()
for hero in heroes:
    new_hero = HeroModel(id=hero.id,
    				     name=hero.name,
                         description=hero.description,
                         image_name=hero.image_name,
                         default_filename=hero.default_filename,
                         resource_name=hero.resource_name)
    session_new.add(new_hero)

items = session_old.query(ItemModel).all()
for item in items:
    new_item = ItemModel(id=item.id,
    					 name=item.name,
                         cost=item.cost,
                         description=item.description,
                         image_name=item.image_name,
                         vendor=item.vendor,
                         resource_name=item.resource_name)
    session_new.add(new_item)

session_new.commit()