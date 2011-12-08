<%inherit file="../layouts/base.mako"/>

<%def name="body()">
    <div class="content">
        <h1>Add Item</h1>
        <form method="POST" action="">
            <div>${form.name(class_='name')}</div>
            <div>${form.cost(class_='cost')}</div>
            <div>${form.image_name(class_='image_name')}</div>
            <div>${form.description(class_='description', rows='20')}</div>
            <input class="submit" type="submit" value="Add"/>
        </form>
    </div>
</%def>