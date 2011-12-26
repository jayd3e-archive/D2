<%inherit file="../layouts/base.mako"/>

<%def name="body()">
    <div class="guides_list">
        <h1>Guides</h1>
        <div class="create_guide">
            <a href="/guides/add">
                Create A Guide
            </a>
        </div>
        <div class="clear"></div>
        % for guide in guides:
            <div class="guide">
                <a class="guide_title" href="/guides/view/${guide.id}">${guide.name}</a>
                <div class="guide_created_by">
                    Created by 
                    <a href="/profile/${guide.author.username}">${guide.author.username}</a> 
                    on ${guide.created.strftime('%B %d, %Y')}
                </div>
            </div>
        % endfor
    </div>
</%def>