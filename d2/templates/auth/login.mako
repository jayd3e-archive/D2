    <%inherit file="../layouts/base.mako"/>

    <%def name="error(form, field)">
        % if field in form.errors:
            % for error in form.errors[field]:
                <div class="error">${error}</div>
            % endfor
        % endif
    </%def>


    <%def name="body()">
        <div class="login_register">
            <form method="POST" action="">
                <div class="login">
                    <h1>Login</h1>
                    ${login_form.username(class_="login_text")}
                    ${error(login_form, 'username')}
                    ${login_form.password(class_="login_text")}
                    ${error(login_form, 'password')}
                    <input class="submit" type="submit" name="login_submit" value="Login"/>
                </div>
            </form>
            <form method="POST" action="">
                <div class="register">
                    <h1>Register</h1>
                    ${register_form.username(class_="login_text")}
                    ${error(register_form, 'username')}
                    ${register_form.email(class_="login_text")}
                    ${error(register_form, 'email')}
                    ${register_form.password(class_="login_text")}
                    ${error(register_form, 'password')}
                    ${register_form.repeat_password(class_="login_text")}
                    ${error(register_form, 'repeat_password')}
                    <input class="submit" type="submit" name="register_submit" value="Register"/>
                </div>
            </form>
        </div>
    </%def>