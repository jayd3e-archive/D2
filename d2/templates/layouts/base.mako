<%namespace name="header" file="header.mako"/>
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
        <script type="text/javascript" src="/static/js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="/static/js/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="/static/js/chosen.jquery.min.js"></script>
    </head>
    <body>
        <div css="header">
        	<div class="centered">
            	${header.header(here)}
			</div>
        </div>
        <div class="body">
            <div class="centered">
                ${self.body()}
            </div>
        </div>
        <div class="footer">
            ${footer.footer()}
        </div>
    </body>
</html>