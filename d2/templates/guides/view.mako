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
        <h1 class="guide_title">${guide.name}</h1>
        <div class="left_column_view">
            % for header, id in sections.items():
                <h1>${header}</h1>
                <div id="${id}" class="guide_section">
                    % for section, item_list in items.items():
                        % for item in item_list:
                            % if section == id:
                                <div class="item" id="${item.id}">
                                    <img src="/static/img/items/${item.image_name}"/>
                                </div>
                            % endif
                        % endfor
                    % endfor
                </div>
            % endfor
        </div>
        <div class="right_column">
            <h1>Config</h1>
			<textarea cols="50" rows="30">
${guide_layout.guide_layout(guide, items) | trim}
            </textarea>
        </div>
    </div>
</%def>