from wtforms import Form,\
                    SelectField,\
                    TextField,\
                    IntegerField,\
                    PasswordField,\
                    TextAreaField,\
                    validators
from wtforms.validators import ValidationError
from d2.models.user import UserModel

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

class LoginForm(Form):
    username = TextField('Username',
                         [validators.Length(min=4, max=50),
                          validators.required()],
                         default="Username")
    password = PasswordField('Password',
                             [validators.required()])

class RegisterForm(Form):
    def __init__(form, db, *args, **kwargs):
        Form.__init__(form, *args, **kwargs)
        form.db = db

    username = TextField('Username',
                         [validators.Length(min=4, max=50),
                         validators.required()],
                         default="Username")
    email = TextField('E-mail',
                      [validators.Email("E-mail is of the incorrect format."),
                      validators.required()],
                      default="Email")
    password = PasswordField('Password',
                             [validators.required()])
    repeat_password = PasswordField('Repeat Password',
                                    [validators.required()])
    
    def validate_repeat_password(form, field):
        if form.password.data != field.data:
            raise ValidationError('The passwords do not match.')
    
    def validate_username(form, field):
        username_ok = form.db.query(UserModel).filter_by(username=field.data).first()
        if username_ok is not None:
            raise ValidationError('That username is already taken.')