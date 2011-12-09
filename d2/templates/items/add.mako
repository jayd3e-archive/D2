<%inherit file="../layouts/base.mako"/>

<%def name="body()">
    <div class="content">
        <h1>Add Item</h1>
        <form method="POST" action="">
            <div>${form.name(class_='item_field')}</div>
            <div>${form.cost(class_='item_field')}</div>
            <div>${form.image_name(class_='item_field')}</div>
            <div>${form.category(class_='item_field')}</div>
            <div>${form.resource_name(class_='item_field')}</div>
            <div>${form.description(class_='item_textarea_field', rows='20')}</div>
            <input class="submit" type="submit" value="Add"/>
        </form>
    </div>
</%def>