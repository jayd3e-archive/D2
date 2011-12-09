from wtforms import Form, SelectField, TextField, IntegerField, TextAreaField, validators

class HeroesAddForm(Form):
    name = TextField('Name',
                     [validators.Length(min=3, max=50)],
                     default="name")
    image_name = TextField('Image Name',
                            [validators.Length(min=4, max=50)],
                            default="image name")
    description = TextAreaField('Description',
                                default="description")
   
class ItemsAddForm(Form):
    name = TextField('Name',
                     [validators.Length(min=4, max=50)],
                     default="name")
    cost = IntegerField('Cost',
                        [validators.required()],
                        default="cost")
    image_name = TextField('Image Name',
                            [validators.Length(min=4, max=50)],
                            default="image name")
    category = TextField('Category',
                         [validators.Length(min=4, max=50)],
                         default="category")
    resource_name = TextField('Resource Name',
                              [validators.Length(min=4, max=50)],
                              default="resource name")
    description = TextAreaField('Description',
                                [validators.Length(min=10, max=1000)],
                                default="description")

class GuidesAddForm(Form):
    name = TextField('Name',
                     [validators.Length(min=4, max=50)],
                     default="Name Of Guide")
    hero_name = SelectField('Hero Name',
                            [validators.required()],
                            coerce=int)