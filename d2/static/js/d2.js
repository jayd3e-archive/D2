$(window).ready(function() {
	$(".item").draggable({
		revert: true
	});
	$(".guide_section").droppable();

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