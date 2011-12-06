<%inherit file="../layouts/base.mako"/>

<%def name="body()">
	<div class="guide_info">
		<form method="POST" action="">
	        <div>${form.name(class_='guide_name')}</div>
	        <a class="guide_submit" href="/">
	        	Create
			</a>
	    </form>
	</div>
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
		</ul>
		% for key, items in basic_items.items():
			<div class="basics_section">
				<h1>${key}</h1>
				<div class="items">
					% for item in items:
						<div class="item">
							<img src="/static/img/items/${item.image_name}"/>
						</div>
					% endfor
				</div>
			</div>
		% endfor
		% for key, items in upgrade_items.items():
			<div class="upgrades_section">
				<h1>${key}</h1>
				<div class="items">
					% for item in items:
						<div class="item">
							<img src="/static/img/items/${item.image_name}"/>
						</div>
					% endfor
				</div>
			</div>
		% endfor
	</div>
</%def>