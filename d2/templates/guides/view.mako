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
                    Copy and paste this text into a file named after what appears in the first line of the config file, should look like: "default_venomancer.txt".  Then save that file in "Steam/steamapps/ common/dota 2 beta/dota/ itembuilds/".
                </div>
              </div>
            <textarea wrap="off">
${guide_layout.guide_layout(guide, items) | trim}
            </textarea>
        </div>
    </div>
</%def>