$(window).ready(function() {
    $(".item").draggable({
        revert: true,
        drag: function() {
            $(this).css('z-index', '100');

            // Remove tooltip
            tooltip = $(this).parent().find(".tooltip");
            tooltip.hide();
        },
        stop: function() {
            $(this).css('z-index', '0');
        }
    });

    $(".guide_section").droppable({
        over: function() {
            $(this).css('background-color', 'rgba(24, 33, 33, 0.5)');
        },
        out: function() {
            $(this).css('background-color', 'rgba(24, 24, 24, 0.5)');
        },
        drop: function(event, ui) {
            $(this).css('background-color', 'rgba(24, 24, 24, 0.5)');
            item = $(ui.draggable).clone();

            // Reset the position of the item
            item.css('top', '0');
            item.css('left', '0');

            // If a hidden input field already exists, delete it.
            // This means that the user is moving an item between sections.
            if(item.children("input").length > 0) {
                item.children("input").remove();
            }

            // Add hidden field
            item.append('<input type="hidden" name="' + $(this).attr('id') + '" value="' + item.attr('id') + '"/>')

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

    /*$('#hero_name').focus(function() {
        $('.hero_list').css('display', 'inline-block');
    });*/
    $("#hero_name").chosen({no_results_text: "NOPE"});

    $('.hero').click(function() {
        hero_id = $(this).attr('id');
        $('#hero_name').val(hero_id);
        $('html, body').animate({ scrollTop: 0 }, 0);
        $('.hero_list').css('display', 'none'); 
    });

    $('#guide_submit').click(function() {
        $('#guide_form').submit() 
    });

    // Tooltips
    $('.item_container').mouseover(function(e) {

        body = $(this).find('.tooltip');

        //Set the X and Y axis of the tooltip
        $(body).css('top', e.pageY + 10 );
        $(body).css('left', e.pageX + 20 );
         
        //Show the tooltip
        $(body).show();
         
    });

    $('.item_container').mousemove(function(e) {
     
        body = $(this).find('.tooltip');

        //Keep changing the X and Y axis for the tooltip, thus, the tooltip move along with the mouse
        $(body).css('top', e.pageY + 10 );
        $(body).css('left', e.pageX + 20 );
         
    });

    $('.item_container').mouseout(function() {
     
        body = $(this).find('.tooltip');
        $(body).hide();
         
    });

    var top = $('#guide').offset().top - parseFloat($('#guide').css('marginTop').replace(/auto/, 0));
    // Set the position of the guide_section to fixed when it hit the top of the window.
    $(window).scroll(function (event) {
        // prevent the global top from getting edited
        _top = top;
        
        // what the y position of the scroll is
        var y = $(this).scrollTop();

        if($('.hero_list').css('display') == 'inline-block') {
            _top += $('.hero_list').height() + 20;
        }
      
        // whether that's below the form
        if (y >= _top) {
          // if so, ad the fixed class
          $('#guide').addClass('fixed');
        } else {
          // otherwise remove it
          $('#guide').removeClass('fixed');
        }
    });

    // Hide upgrades tab
    $(".upgrades_section").hide();
    $(".secrets_section").hide();
})
onBasics = function() {
    $(".upgrades_section").hide();
    $(".secrets_section").hide();
    $(".basics_section").show();
}

onUpgrades = function() {
    $(".basics_section").hide();
    $(".secrets_section").hide();
    $(".upgrades_section").show();
}

onSecretShop = function() {
    $(".basics_section").hide();
    $(".upgrades_section").hide();
    $(".secrets_section").show();
}