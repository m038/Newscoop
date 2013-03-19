{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_ausgehen/api-teaser.tpl" }}

<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = true;

{{ assign var="cinema_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="cinema_date" value=$smarty.get.date|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

window.preset_date = "{{ $cinema_date }}";


{{ assign var="cinema_region" value="region-zentralschweiz" }}
{{ if $smarty.get.region }}
    {{ assign var="cinema_region" value=$smarty.get.region|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

{{ if $cinema_region != "kanton-luzern" }}
    {{ if $cinema_region != "kanton-nidwalden" }}
        {{ if $cinema_region != "kanton-obwalden" }}
            {{ if $cinema_region != "kanton-schwyz" }}
                {{ if $cinema_region != "kanton-uri" }}
                    {{ if $cinema_region != "kanton-zug" }}
                        {{ assign var="cinema_region" "region-zentralschweiz" }}
                    {{ /if }}
                {{ /if }}
            {{ /if }}
        {{ /if }}
    {{ /if }}
{{ /if }}

{{ assign var="movie_type" value="kino" }}
{{ if $smarty.get.type }}
    {{ assign var="movie_type" value=$smarty.get.type|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

window.movie_mode = "list";
{{ assign var="cinema_region_orig" value=$cinema_region }}
{{ if $movie_type eq 'kino' }}
    window.movie_list = {{ api_cinema cinema_date=$cinema_date cinema_region=$cinema_region }};
{{ else }}
    window.movie_list = {{ api_cinema movie_genre=$movie_type cinema_date=$cinema_date cinema_region=$cinema_region }};
{{ /if }}

window.cinemas = window.movie_list.locations;

$(document).ready(function() {
    var types_to_outlines = {
        //cinema: "kino",
        'adventure': 'abenteuer',
        'action': 'action',
        'adult': 'adult',
        'animation': 'animation',
        'biography': 'biografie',
        'crime': 'crime',
        'documentary': 'dokumentation',
        'drama': 'drama',
        'family': 'familienfilm',
        'fantasy': 'fantasy',
        'film-noir': 'film-noir',
        'history': 'historisch',
        'horror': 'horror',
        'comedy': 'komoedie',
        'war': 'kriegsfilm',
        'short': 'kurzfilm',
        'musical': 'musical',
        'music': 'musikfilm',
        'mystery': 'mystery',
        'romance': 'romanze',
        'sci-fi': 'sci-fi',
        'sport': 'sport',
        'thriller': 'thriller',
        'western': 'western',
        'other': 'andere'
    };

    var use_outline_type = "alle";
    if ("{{ $movie_type }}" in types_to_outlines) {
        use_outline_type = types_to_outlines["{{ $movie_type }}"];
    }

    update_subnav_links("{{ $cinema_date }}", 1, "{{ $cinema_region }}");
    //update_subnav_links("{{ $cinema_date }}", 1, "{{ $cinema_region_orig }}");
    outline_type("kino");
    update_type_sel("kino");

    if ("{{ $cinema_region }}") {
        $("#wo").val("{{ $cinema_region }}");
    }

    $("#wann").datepicker("setDate", new Date("{{ $cinema_date }}"));
    setTimeout("update_datepicker_button(); update_datepicker_visible();", 10);
});


$(document).ready(function() {
    var list_content = '<div class="ausgehen-message-holder clearfix"><div class="no-event-found"><p>Ihre Suche ergab keine Treffer.</p></div></div>';

    var cur_url = location.href;
    var cur_url_parts = cur_url.split("#");
    cur_url_parts = cur_url_parts[0].split("?");
    var cur_url_base = cur_url_parts[0];

    var cur_date = null;
    var cur_movie_key = null;

    var cur_url_params = location.search;
    if (cur_url_params && (0 < cur_url_params.length)) {
        cur_url_params = cur_url_params.substr(1);
        cur_url_params = cur_url_params.split("&");
        cur_url_params_count = cur_url_params.length;
        for (var cup_ind = 0; cup_ind < cur_url_params_count; cup_ind++) {
            var cur_param_info = cur_url_params[cup_ind];
            var cur_param_info_parts = cur_param_info.split("=");
            if (2 == cur_param_info_parts) {
                if ('date' == cur_param_info_parts[0]) {
                    cur_date = cur_param_info_parts[1];
                }
                if ('movie_key' == cur_param_info_parts[0]) {
                    cur_movie_key = cur_param_info_parts[1];
                }
            }
        }
    }

    if (window.movie_list && window.movie_list.films) {
        list_content = '';
        list_content += "<h3>Kino</h3>\n";

        var api_dose = window.movie_list.films;
        var api_length = api_dose.length;
        for (var api_ind = 0; api_ind < api_length; api_ind++) {
            var cur_movie = api_dose[api_ind];
            if ((!cur_movie) || (!cur_movie.title)) {
                continue;
            }

            var cur_movie_key = cur_movie["movie_key"];

            list_content += "<article>";

            var cur_detail_link = cur_url_base + "?date=" + "{{ $cinema_date|escape:'url' }}" + "&movie_key=" + encodeURIComponent(cur_movie_key) + "&region=" + "{{ $cinema_region|escape:'url' }}";

            list_content += "<h4><a href=\"" + cur_detail_link + "\">" + cur_movie.title + "</a></h4>";
            list_content += '<div class="accordion-content">';

            list_content += '<figure class="right">';
            if (cur_movie.movie_poster_url) {
                list_content += "<img src=\"" + cur_movie.movie_poster_url + "\">";

                if (cur_movie.image_copyright) {
                    list_content += '<figcaption>' + cur_movie.image_copyright + "</figcaption>\n";
                }
                else {
                    list_content += "<figcaption>Copyrighted</figcaption>\n";
                }

            }
            list_content += "</figure>\n";

            var cur_rating = 0;
            if (cur_movie.rating) {
                cur_rating = cur_movie.rating;
            }
            if (0 > cur_rating) {
                cur_rating = 0;
            }

            list_content += '<ul class="rating">';
            for (var cur_rat_ind = 0; cur_rat_ind < cur_rating; cur_rat_ind++) {
                list_content += '<li class="on">' + (cur_rat_ind + 1) + '</li>';
            }
            for (var cur_rat_ind = cur_rating; cur_rat_ind < 5; cur_rat_ind++) {
                list_content += '<li class="off">' + (cur_rat_ind + 1) + '</li>';
            }
            list_content += '</ul>' + "\n";

            list_content += "<p>";
            var max_desc_len = 300;
            if (cur_movie.synopsis) {
                var cur_synopsis = cur_movie.synopsis;
                if (cur_synopsis.length > max_desc_len) {
                    cur_synopsis = cur_synopsis.substr(0, max_desc_len) + "...";
                }
                list_content += cur_synopsis;
            }

            list_content += ' <a href="' + cur_detail_link + '">Details, Trailer & Bilder</a>';
            list_content += "</p>\n";

            list_content += '<span class="details">';
            if (cur_movie.director || cur_movie.actors) {
                list_content += '<p>';
                if (cur_movie.director) {
                    list_content += '<strong>Regisseur</strong>: ' + cur_movie.director;
                }
                if (cur_movie.director && cur_movie.actors) {
                    list_content += '<br />';
                }
                if (cur_movie.actors) {
                    list_content += '<strong>Schauspieler</strong>: ' + cur_movie.actors;
                }
                list_content += '</p>';
            }

            if (cur_movie.screenings) {
                var cur_screen_set = cur_movie.screenings;
                var cur_screen_set_count = cur_screen_set.length;
                for (var css_ind = 0; css_ind < cur_screen_set_count; css_ind++) {
                    var cur_screen = cur_screen_set[css_ind];

                    var cur_loc_id = cur_screen.location_id;
                    var cur_cinema = get_cinema(cur_loc_id);

                    if (!cur_cinema) {
                        continue;
                    }
                    var cur_cin_name = cur_cinema["location_name"];
                    var cur_cin_addr = cur_cinema["street"] + ", " + cur_cinema["town"];

                    list_content += "<p>";
                    list_content += "<strong>" + cur_cin_name + "</strong><br />" + cur_cin_addr + "<br />";

                    var cur_scr_times = cur_screen['times'];
                    if (cur_scr_times) {
                        var cur_scr_times_count = cur_scr_times.length;
                        var last_date = "";
                        var screen_row = "";
                        for (var cst_ind = 0; cst_ind < cur_scr_times_count; cst_ind++) {
                            var cur_scr_time_info = cur_scr_times[cst_ind];
                            var cur_scr_datetime_txt = cur_scr_time_info.date_time;
                            if (!cur_scr_datetime_txt) {
                                continue;
                            }
                            var cur_scr_datetime = cur_scr_datetime_txt.split(" ");
                            var cur_scr_date = " ";
                            var cur_scr_time = " ";

                            if (1 <= cur_scr_datetime.length) {
                                cur_scr_date = cur_scr_datetime[0];
                            }
                            if (2 <= cur_scr_datetime.length) {
                                cur_scr_time = cur_scr_datetime[1];
                            }

                            if (cur_scr_date != last_date) {
                                list_content += screen_row;

                                screen_row = get_display_date(cur_scr_date) + " ";
                                last_date = cur_scr_date;
                            }
                            else {
                                screen_row += ", ";
                            }

                            if (cur_scr_time_info.languages) {
                                screen_row += cur_scr_time_info.languages + " ";
                            }

                            screen_row += cur_scr_time;

                        }

                        list_content += screen_row;
                    }

                    list_content += "</p>\n";

                }
            }

            list_content += "</span>\n";
            list_content += "</div>\n";

            list_content += "</article>";
        }

    }

    $("#event_list").html(list_content);

});

</script>

<body>

    <div id="content_wrapper" class="content-wrapper">

{{ include file="_tpl/header-nav.tpl" }}

{{ include file="_tpl/header.tpl" }}

{{ include file="_ausgehen/other-common.tpl" }}

{{ include file="_ausgehen/api-teaser-place.tpl" }}

    </div><!-- / content_wrapper -->

    {{ include file="_ausgehen/subnav-common-func.tpl" }}
    {{ include file="_ausgehen/subnav-lists-func.tpl" }}

    <div class="wide-wrapper no-top-margin internal-wrapper">

        <div class="content-wrapper events-content">

            {{ include file="_ausgehen/subnav-lists-top.tpl" }}

            <div class="content no-bottom-line equal-heights clearfix">

            {{ include file="_ausgehen/subnav-lists-side.tpl" list_type="movies" }}

            <div id="event_list" class="main phone-accordion">
                &nbsp;
            </div><!-- / event_list -->

<script type="text/javascript">

$(document).ready(function() {

    $("#datapicker-button").show();
    $("#top-calendar").hide();

    $("#datepicker_single_ul").hide();
});

function load_events(ev_type) {
    return true;
};
</script>

            <div class="aside">

                <div class="ad top-space">
                    {{ include file="_ads/ausgehen-list-movies.tpl" }}
                </div>

            </div><!-- / aside -->

{{ render file="_ads/section-billboard.tpl" }} 

        </div><!-- / content -->
        </div><!-- / content_wrapper -->

    </div><!-- / wide_wrapper -->

    <div id="footer">

{{ include file="_tpl/footer.tpl" }}

    </div><!-- / footer -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
