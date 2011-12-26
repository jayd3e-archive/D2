<%inherit file="../layouts/base.mako"/>
<%namespace name="paginator" file="../utilities/paginator.mako"/>

<%def name="body()">
    <div class="guides_list">
        <h1>${viewed_user.username}</h1>
        <div class="create_guide">
            <a href="/guides/add">
                Create A Guide
            </a>
        </div>
        <div class="clear"></div>
        % for guide in guides:
            <div class="guide">
                <img class="hero_image" src="/static/img/heroes/${guide.hero.image_name}" />
                <a class="guide_title" href="/guides/view/${guide.id}">${guide.name}</a>
                <div class="guide_created_by">
                    Created by 
                    <a href="/profile/${guide.author.username}">${guide.author.username}</a> 
                    on ${guide.created.strftime('%B %d, %Y')}
                </div>
            </div>
        % endfor
        ${paginator.paginator(num_of_pages, page)}
        <div class="clear"></div>
    </div>
</%def>