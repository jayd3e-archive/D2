"""Starting to roll in the social features.  Added a groups model, 
and a relationship table to link users and groups.  
Also changed the users.id field to users.user_id.

Revision ID: 4b0639d842d5
Revises: 20a582691e14
Create Date: 2011-12-15 01:16:09.721029

"""

# downgrade revision identifier, used by Alembic.
down_revision = '20a582691e14'

from alembic.op import create_table
from alembic.op import create_foreign_key
from alembic.op import drop_constraint
from alembic.op import drop_table
from alembic.op import add_column
from alembic.op import drop_column
from alembic.op import alter_column
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    # Add columns
    add_column(u'users', sa.Column('password', sa.String(length=120), nullable=True))
    add_column(u'users', sa.Column('email', sa.String(length=100), nullable=True))
    
    # Tables
    create_table('groups',
        sa.Column('id', sa.Integer(), primary_key=True, nullable=False),
        sa.Column('name', sa.String(100))
    )
    create_table('users_groups',
        sa.Column('user_id', sa.Integer(), nullable=False),
        sa.Column('group_id', sa.Integer(), nullable=False),
        sa.ForeignKeyConstraint(['group_id'], ['groups.id'], ),
        sa.ForeignKeyConstraint(['user_id'], ['users.id'], ),
        sa.PrimaryKeyConstraint('user_id', 'group_id')
    )
    ### end Alembic commands ###

def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    # Drop Constraints
    drop_constraint('users_groups_group_id_fkey', 'users_groups')
    # Drop Tables
    drop_table('groups')
    drop_table('users_groups')
    # Drop columns
    drop_column(u'users', u'password')
    drop_column(u'users', u'email')
