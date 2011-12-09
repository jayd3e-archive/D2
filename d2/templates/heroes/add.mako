<%inherit file="../layouts/base.mako"/>

<%def name="body()">
    <div class="content">
        <h1>Add Hero</h1>
        <form method="POST" action="">
            <div>${form.name(class_='hero_field')}</div>
            <div>${form.image_name(class_='hero_field')}</div>
            <div>${form.description(class_='hero_textarea_field', rows='20')}</div>
            <input class="submit" type="submit" value="Add"/>
        </form>
    </div>
</%def>