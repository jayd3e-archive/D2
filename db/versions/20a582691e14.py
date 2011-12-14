"""Added all of the additional columns to the db from dota2reference.com.

Revision ID: 20a582691e14
Revises: None
Create Date: 2011-12-13 23:44:45.629239

"""

# downgrade revision identifier, used by Alembic.
down_revision = None

from alembic.op import create_table
from alembic.op import drop_table
from alembic.op import add_column
from alembic.op import drop_column
from alembic.op import alter_column
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    create_table('skills',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=100), nullable=True),
    sa.Column('image_name', sa.String(length=100), nullable=True),
    sa.Column('description', sa.String(length=1000), nullable=True),
    sa.Column('hero_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['hero_id'], ['heroes.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    add_column(u'items', sa.Column('hon_name', sa.String(length=100), nullable=True))
    add_column(u'items', sa.Column('order', sa.Integer(), nullable=True))
    alter_column(u'items', 'category', name='vendor')
    add_column(u'heroes', sa.Column('day_site_range', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('min_damage', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('intelligence', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('agility', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('night_site_range', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('min_attack_animation', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('attack_range', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('strength_gain', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('strength', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('min_hp', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('armor', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('intelligence_gain', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('movespeed', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('max_hp', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('max_cast_animation', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('stat', sa.String(length=15), nullable=True))
    add_column(u'heroes', sa.Column('faction', sa.String(length=10), nullable=True))
    add_column(u'heroes', sa.Column('missile_speed', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('max_damage', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('min_cast_animation', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('max_mana', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('roles', sa.String(length=50), nullable=True))
    add_column(u'heroes', sa.Column('base_attack_time', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('agility_gain', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('min_mana', sa.Integer(), nullable=True))
    add_column(u'heroes', sa.Column('max_attack_animation', sa.Float(), nullable=True))
    add_column(u'heroes', sa.Column('order', sa.Integer(), nullable=True))
    ### end Alembic commands ###

def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    drop_table('skills')
    drop_column(u'items', 'hon_name')
    drop_column(u'items', 'order')
    alter_column(u'items', 'vendor', name='category')
    drop_column(u'heroes', 'day_site_range')
    drop_column(u'heroes', 'min_damage')
    drop_column(u'heroes', 'intelligence')
    drop_column(u'heroes', 'agility')
    drop_column(u'heroes', 'night_site_range')
    drop_column(u'heroes', 'min_attack_animation')
    drop_column(u'heroes', 'attack_range')
    drop_column(u'heroes', 'strength_gain')
    drop_column(u'heroes', 'strength')
    drop_column(u'heroes', 'min_hp')
    drop_column(u'heroes', 'armor')
    drop_column(u'heroes', 'intelligence_gain')
    drop_column(u'heroes', 'movespeed')
    drop_column(u'heroes', 'max_hp')
    drop_column(u'heroes', 'max_cast_animation')
    drop_column(u'heroes', 'stat')
    drop_column(u'heroes', 'faction')
    drop_column(u'heroes', 'missile_speed')
    drop_column(u'heroes', 'max_damage')
    drop_column(u'heroes', 'min_cast_animation')
    drop_column(u'heroes', 'max_mana')
    drop_column(u'heroes', 'roles')
    drop_column(u'heroes', 'base_attack_time')
    drop_column(u'heroes', 'agility_gain')
    drop_column(u'heroes', 'min_mana')
    drop_column(u'heroes', 'max_attack_animation')
    drop_column(u'heroes', 'order')
    ### end Alembic commands ###
