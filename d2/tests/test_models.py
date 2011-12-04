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
from d2.models.base import initializeBase
from sqlalchemy.orm import sessionmaker
from sqlalchemy import engine_from_config

class TestModels(unittest.TestCase):
    def setUp(self):
        settings = {'sqlalchemy.url' : 'sqlite://'}
        
        engine = engine_from_config(settings, 'sqlalchemy.')
        initializeBase(engine)
        self.Session = sessionmaker(bind=engine)
    
    def testUserModel(self):
        session = self.Session()

        user = UserModel(username="jayd3e")
        guide = GuideModel(name="Super Guide",
                           created=datetime.now(),
                           edited=datetime.now())
        comment = CommentModel(body="U Suck",
                               created=datetime.now(),
                               edited=datetime.now())
        user.guides.append(guide)
        user.comments.append(comment)

        session.add(user)
        session.flush()
        self.assertTrue(str(user).startswith('<User'),
                        msg="str(UserModel) must start with '<User'")
        self.assertEqual(guide.author, user)
        self.assertIn(guide, user.guides)
        self.assertEqual(comment.author, user)
        self.assertIn(comment, user.comments)
        
    def testGuideModel(self):
        session = self.Session()

        guide = GuideModel(name="Super Guide",
                           created=datetime.now(),
                           edited=datetime.now())
        
        user = UserModel(username="jayd3e")
        guide.author = user

        hero = HeroModel(name="Earthshaker",
                         description="Badass fissure maker.")
        guide.hero = hero

        session.add(guide)
        session.flush()
        self.assertTrue(str(guide).startswith('<Guide'),
                        msg="str(GuideModel) must start with '<Guide'")
        self.assertEqual(guide.hero, hero)
        self.assertIn(guide, hero.guides)
        self.assertEqual(guide.author, user)
        self.assertIn(guide, user.guides)
        
    def testHeroModel(self):
        session = self.Session()

        hero = HeroModel(name="Earthshaker",
                         description="Badass fissure maker.")
        
        guide = GuideModel(name="Super Guide",
                           created=datetime.now(),
                           edited=datetime.now())
        hero.guides.append(guide)

        session.add(hero)
        session.flush()
        self.assertTrue(str(hero).startswith('<Hero'),
                        msg="str(HeroModel) must start with '<Hero'")
        self.assertIn(guide, hero.guides)
        self.assertEqual(hero, guide.hero)

    def testItemModel(self):
        session = self.Session()

        item = ItemModel(name="Sword of 1,000 Truths",
                         description="Stan needs this item, GAWD sharon!")

        session.add(item)
        session.flush()
        self.assertTrue(str(item).startswith('<Item'),
                        msg="str(ItemModel) must start with '<Item'")
        
    def testCommentModel(self):
        session = self.Session()

        comment = CommentModel(body="U Suck",
                               created=datetime.now(),
                               edited=datetime.now())
        user = UserModel(username="jayd3e")
        comment.author = user
        
        session.add(comment)
        session.flush()
        self.assertTrue(str(comment).startswith('<Comment'),
                        msg="str(CommentModel) must start with '<Comment'")
        self.assertEqual(comment.author, user)
        self.assertIn(comment, user.comments)

    def testGuideItemModel(self):
        session = self.Session()    

        item = ItemModel(id=5768,
                         name="Sword of 1,000 Truths",
                         description="Stan needs this item, GAWD sharon!")
        session.add(item)
        
        guide = GuideModel(id=5889,
                           name="Super Guide",
                           created=datetime.now(),
                           edited=datetime.now())
        session.add(guide)

        guide_item = GuideItemModel(guide_id=5889,
                               item_id=5768,
                               section="starting")
        session.add(guide_item)
        session.flush()
        self.assertIn(guide, item.guides)
        self.assertIn(item, guide.items)
        self.assertIn(guide_item, item.guide_item)
        self.assertIn(guide_item, guide.guide_item)
        self.assertEqual(item, guide_item.item)
        self.assertEqual(guide, guide_item.guide)



