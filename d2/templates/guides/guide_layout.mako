<%def name="guide_layout(guide, items)">\
"itembuilds/${guide.hero.default_filename}"
{
    "author"        "d2.jayd3e.com"
    "hero"           "${guide.hero.resource_name}"
    "Title"           "${guide.name}"
    
    "Items"
    {        
        "#DOTA_Item_Build_Starting_Items"
        {
        	% if 'starting' in items:
            % for item in items['starting']:
            "item"        "${item.resource_name}"
            % endfor
            % endif
        }
        
        "#DOTA_Item_Build_Early_Game"
        {
        	% if 'starting' in items:
            % for item in items['early']:
            "item"        "${item.resource_name}"
            % endfor
            % endif
        }
        
        "#DOTA_Item_Build_Core_Items"
        {
        	% if 'starting' in items:
            % for item in items['core']:
            "item"        "${item.resource_name}"
            % endfor
            % endif
        }
        
        "#DOTA_Item_Build_Luxury"
        {
        	% if 'starting' in items:
            % for item in items['luxury']:
            "item"        "${item.resource_name}"
            % endfor
            % endif
        }
    }
}
</%def>