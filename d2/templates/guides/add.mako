<%inherit file="../layouts/base.mako"/>

<%def name="body()">
    <script type="text/javascript" src="/static/js/d2.js"></script>
    <form id="guide_form" method="POST" action="">
        <div class="top">
            <div class="guide_info">
                <div>${form.name(class_='guide_name')}</div>
                <div class="guide_hero_name">${form.hero_name(class_='guide_hero_name')}</div>
                <a class="guide_submit" id="guide_submit" href="#">
                    Create
                </a>
            </div>
            <%doc>
                ## Possibly add this back in at some point, once I have access to all of the
                ## hero images
                <div class="hero_list">
                    % for hero in heroes:
                        <div class="hero" id="${hero.name}">
                            <img src="/static/img/heroes/${hero.image_name}"/>
                        </div>
                    % endfor
                </div>
            </%doc>
        </div>
        <div class="bottom">
            <div class="left_column">
                <div id="guide">
                    <h1>Starting Items</h1>
                    <div id="starting" class="guide_section"></div>
                    <h1>Early Game</h1>
                    <div id="early" class="guide_section"></div>
                    <h1>Core Items</h1>
                    <div id="core" class="guide_section"></div>
                    <h1>Luxury Items</h1>
                    <div id="luxury" class="guide_section"></div>
                </div>
            </div>
            <div class="right_column">
                <ul class="shop_sections">
                    <li onclick="javascript:onBasics()">Basics</li>
                    <li onclick="javascript:onUpgrades()">Upgrades</li>
                    <li onclick="javascript:onSecretShop()">Secret Shop</li>
                </ul>
                <%
                    tabs = {'basics_section':basic_items, 
                            'upgrades_section':upgrade_items, 
                            'secrets_section':secret_items}
                %>
                % for class_name, items_set in tabs.items():
                    % for key, items in items_set.items():
                        <div class="${class_name}">
                            <h1>${key}</h1>
                            <div class="items">
                                % for item in items:
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
                                % endfor
                            </div>
                        </div>
                    % endfor
                % endfor
            </div>
        </div>
    </form>
</%def>