<div class='article_rating'>
    Rate this article:
    <div id="{{ $gimme->article->number }}" class="rate_widget">
        <div class="star_1 ratings_stars"></div>
        <div class="star_2 ratings_stars"></div>
        <div class="star_3 ratings_stars"></div>
        <div class="star_4 ratings_stars"></div>
        <div class="star_5 ratings_stars"></div>
        <div class="total_votes">vote data</div>
        <div class="rating_error"></div>
    </div>
</div>

<script>

$(document).ready(function() {
    
    $('.rate_widget').each(function(i) {
        var widget = this;
        var out_data = {
            f_article_number : $(widget).attr('id')
        };
        $.post(
            '/rating/show',
            out_data,
            function(INFO) {
                $(widget).data( 'fsr', INFO );
                set_votes(widget);
            },
            'json'
        );
    });


    $('.ratings_stars').hover(
        // Handles the mouseover
        function() {
            $(this).prevAll().andSelf().addClass('ratings_over');
            $(this).nextAll().removeClass('ratings_vote'); 
        },
        // Handles the mouseout
        function() {
            $(this).prevAll().andSelf().removeClass('ratings_over');
            // can't use 'this' because it wont contain the updated data
            set_votes($(this).parent());
        }
    );
    
    
    // This actually records the vote
    $('.ratings_stars').bind('click', function() {
        var star = this;
        var widget = $(this).parent();
        var score = $(star).attr('class').match(/star_(\d+)/)[1];
 
        var clicked_data = {
            f_rating_score : score,
            f_article_number : $(star).parent().attr('id')
        };
        $.post(
            '/rating/save',
            clicked_data,
            function(INFO) {
                widget.data( 'fsr', INFO );
                set_votes(widget);
            },
            'json'
        ); 
    });
    
    
    
});

function set_votes(widget) {

    var avg = $(widget).data('fsr').whole_avg;
    var votes = $(widget).data('fsr').number_votes;
    var exact = $(widget).data('fsr').dec_avg;
    var error = $(widget).data('fsr').error;

    $(widget).find('.star_' + avg).prevAll().andSelf().addClass('ratings_vote');
    $(widget).find('.star_' + avg).nextAll().removeClass('ratings_vote'); 
    $(widget).find('.total_votes').text( votes + ' votes recorded (' + exact + ' rating)' );
    $(widget).find('.rating_error').text( error );
}

</script>
