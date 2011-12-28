<%inherit file="../layouts/base.mako"/>
<%namespace name="guide_layout" file="guide_layout.mako"/>

<%def name="body()">
    <div id="guide">
        <%
            from collections import OrderedDict
            sections = OrderedDict()
            sections['Starting Items'] = 'starting'
            sections['Early Game'] = 'early'
            sections['Core Items'] = 'core'
            sections['Luxury Items'] = 'luxury'
        %>
        <img class="hero_image" src="/static/img/heroes/${guide.hero.image_name}" />
        <h1 class="guide_view_title">${guide.name} 
            <span class="created_by">by 
                <a href="/users/${guide.author.username}">
                    ${guide.author.username}
                </a>
            </span>
        </h1>
        <div class="download">
            <a href="/download/${guide.id}">Download</a>
        </div>
        <div class="clear"></div>
        % if guide.description:
            <div class="description">${guide.description}</div>
        % endif
        <div class="left_column_view">
            % for header, id in sections.items():
                <h1>${header}</h1>
                <div id="${id}" class="guide_section">
                    % for section, item_list in items.items():
                        % for item in item_list:
                            % if section == id:
                                <div class="item_container">
                                    <div class="item" id="${item.id}">
                                        <img src="/static/img/items/${item.image_name}"/>
                                    </div>
                                    <div class="tooltip">
                                        <div class="tipHead">
                                            ${item.name} <span class="item_cost">(${item.cost})</span>
                                        </div>
                                        <div class="tipBody">
                                            ${'<br />'.join(item.description.splitlines()) | n}
                                        </div>
                                    </div>
                                </div>
                            % endif
                        % endfor
                    % endfor
                </div>
            % endfor
        </div>
        <div class="right_column">
            <h1>Config <a class="help" href="#">(need help!?)</a></h1>
            <div class="tooltip">
                <div class="tipHead">
                    Instructions
                </div>
                <div class="tipBody">
                    <ol>
                        <li>1. Press the download button, or copy and paste this text into a file named after what appears in the first line of the config file, should look like: "default_venomancer.txt".</li>
                        <li>2. Save that file in "Steam/steamapps/common/dota 2 beta/dota/itembuilds/".</li>
                    </ol>
                </div>
            </div>
            <textarea wrap="off">
${guide_layout.guide_layout(guide, items) | trim}
            </textarea>
        </div>
    </div>
</%def>