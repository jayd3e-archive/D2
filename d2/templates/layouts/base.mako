<%namespace name="header" file="header.mako"/>
<%namespace name="banner" file="banner.mako"/>
<%namespace name="footer" file="footer.mako"/>
<!-- base.mako --> 
<!DOCTYPE html>
<html>
    <head>
        <title>${title}</title>
        <link rel="stylesheet" type="text/css" href="/static/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="/static/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/static/css/type.css" />
        <link rel="stylesheet" type="text/css" href="/static/css/fonts/trajan/stylesheet.css" charset="utf-8" />

        <!-- JavaScript -->
        <script>
            here = "${here}";
        </script>
        <script type="text/javascript" src="/static/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="/static/js/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="/static/js/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="/static/js/d2.js"></script>
    </head>
    <body>
        <%
            header_class = 'header'
            if here.startswith('/users'):
                header_class = 'header_condensed'
        %>
        <div class="${header_class} centered">
            % if here == '/' or here == '/login':
                ${banner.banner(here)}
            % else:
                ${header.header(here)}
            % endif
        </div>
        <div class="body centered">
            ${self.body()}
        </div>
        <div class="footer">
            ${footer.footer()}
        </div>
    </body>
</html>