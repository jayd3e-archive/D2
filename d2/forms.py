from wtforms import Form, TextField, IntegerField, TextAreaField, validators

class HeroesAddForm(Form):
    name = TextField('Name',
    				 [validators.Length(min=4, max=50)],
    				 default="name")
    image_name = TextField('Image Name',
                     	   [validators.Length(min=4, max=50)],
                     	   default="image name")
    description = TextAreaField('Description',
                                [validators.Length(min=25, max=1000)],
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
    description = TextAreaField('Description',
                                [validators.Length(min=25, max=1000)],
                                default="description")

class GuidesAddForm(Form):
    name = TextField('Name',
                     [validators.Length(min=4, max=50)],
                     default="Name Of Guide")