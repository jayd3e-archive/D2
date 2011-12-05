#D2/setup.py
import os
from setuptools import setup

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README')).read()
CHANGES = open(os.path.join(here, 'CHANGES')).read()

entry_points = """
      [paste.app_factory]
      main = d2:main
      """

requires = ['pyramid',
            'pyramid_debugtoolbar',
            'sqlalchemy',
            'mako',
	    'psycopg2',
	    'WTForms']

setup(name='D2',
      version='0.1dev',
      description='',
      long_description=README + '\n\n' + CHANGES,
      install_requires=requires,
      url='http://localhost',
      packages=['d2'],
      test_suite='d2.tests',
      entry_points = entry_points
)
