$(window).ready(function() {
	$(".item").draggable({
		revert: true,
		drag: function() {
			$(this).css('z-index', '100');
		},
		stop: function() {
			$(this).css('z-index', '0');
		}
	});
	$(".guide_section").droppable({
        over: function() {
            $(this).css('backgroundColor', '#182121');
        },
        out: function() {
            $(this).css('backgroundColor', '#181818');
        },
        drop: function(event, ui) {
            $(this).css('backgroundColor', '#181818');
            item = $(ui.draggable).clone();
            
            // Reset the position of the item
            item.css('top', '0');
            item.css('left', '0');

            // make the item draggable
            item.draggable({
				drag: function() {
					$(this).css('z-index', '100');
				},
				stop: function() {
					$(this).css('z-index', '0');
					$(this).remove()
				}
			});

            $(this).append(item)
        }
	});

	var top = $('#guide').offset().top - parseFloat($('#guide').css('marginTop').replace(/auto/, 0));
	// Set the position of the guide_section to fixed when it hit the top of the window.
	$(window).scroll(function (event) {
	    // what the y position of the scroll is
	    var y = $(this).scrollTop();
	  
	    // whether that's below the form
	    if (y >= top) {
	      // if so, ad the fixed class
	      $('#guide').addClass('fixed');
	    } else {
	      // otherwise remove it
	      $('#guide').removeClass('fixed');
	    }
  	});

	// Hide upgrades tab
    $(".upgrades_section").hide();
});

onBasics = function() {
	$(".upgrades_section").hide();
	$(".basics_section").show();
}

onUpgrades = function() {
	$(".basics_section").hide();
	$(".upgrades_section").show();
}