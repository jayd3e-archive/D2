<%def name="header(here)">
    <a class="small_logo" href="/">
    </a>
    <div class="account">
        % if user != None:
            <a href="#">${user.username}</a> | 
            <a href="/logout">logout</a>
        % else:
            <a href="/login">login</a>
        % endif
    </div>
</%def>