$(window).ready(function() {
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

    // Help tooltip
    $('.help').mouseover(function(e) {

        body = $('.right_column').find('.tooltip');

        //Set the X and Y axis of the tooltip
        $(body).css('top', e.pageY + 10 );
        $(body).css('left', e.pageX + 20 );
         
        //Show the tooltip
        $(body).show();
         
    });

    $('.help').mousemove(function(e) {
     
        body = $('.right_column').find('.tooltip');

        //Keep changing the X and Y axis for the tooltip, thus, the tooltip move along with the mouse
        $(body).css('top', e.pageY + 10 );
        $(body).css('left', e.pageX + 20 );
         
    });

    $('.help').mouseout(function() {
     
        body = $('.right_column').find('.tooltip');
        $(body).hide();
         
    });
});