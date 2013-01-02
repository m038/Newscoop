{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_ausgehen/api-teaser.tpl" }}

<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = true;
window.load_date_direct = true;


{{ assign var="cinema_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="cinema_date" value=$smarty.get.date|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

window.preset_date = "{{ $cinema_date }}";


{{ assign var="cinema_region" value="region-zentralschweiz" }}
{{ if $smarty.get.region }}
    {{ assign var="cinema_region" value=$smarty.get.region|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

{{ assign var="movie_type" value="kino" }}
{{ if $smarty.get.type }}
    {{ assign var="movie_type" value=$smarty.get.type|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

window.movie_mode = "list";
{{* TODO: This date/region setting is just temporary, for testing purposes *}}
{{* assign var="cinema_date" value="2012-10-26" *}}
{{ assign var="cinema_region_orig" value=$cinema_region }}
{{* assign var="cinema_region" value="region-basel" *}}
{{ if $movie_type eq 'kino' }}
    window.movie_list = {{ api_cinema cinema_date=$cinema_date cinema_region=$cinema_region }};
{{ else }}
    window.movie_list = {{ api_cinema movie_genre=$movie_type cinema_date=$cinema_date cinema_region=$cinema_region }};
{{ /if }}

{{* assign var="cinema_region" value=$cinema_region_orig *}}
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

    if ("{{ $cinema_region }}") {
        $("#wo").val("{{ $cinema_region }}");
        //$("#wo").dropdownized({fixed:true,reload:true});
    }

    $("#wann").datepicker("setDate", new Date("{{ $cinema_date }}"));
    setTimeout("update_datepicker_button(); update_datepicker_visible();", 10);
});

/*
window.cinema_hash = {};

function get_cinema(cinema_id) {
    if ((!window.movie_list) || (!window.movie_list.locations)) {
        return null;
    }
    var cinema_list = window.movie_list.locations;

    if (cinema_id in window.cinema_hash) {
        return window.cinema_hash[cinema_id];
    }

    var found_cinema = null;
    var cinema_list_count = cinema_list.length;
    for (var cl_ind = 0; cl_ind < cinema_list_count; cl_ind++) {
        var cur_cinema = cinema_list[cl_ind];
        if (cur_cinema && (cinema_id == cur_cinema["location_id"])) {
            found_cinema = cur_cinema;
            window.cinema_hash[cinema_id] = cur_cinema;
            break;
        }
    }

    return found_cinema;
};
*/


$(document).ready(function() {
    var list_content = 'Ihre Suche ergab keine Treffer';

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
/*
            var cur_time = null;
            var cur_date = null;
            if (cur_event['date_time']) {
                var cur_datetime_parts = cur_event['date_time'].split(" ");
                if (2 == cur_datetime_parts.length) {
                    cur_date = cur_datetime_parts[0];
                    var cur_time_parts = cur_datetime_parts[1].split(":");
                    if (2 <= cur_time_parts.length) {
                        cur_time = cur_time_parts[0] + ":" + cur_time_parts[1];
                    }
                }
            }
*/

            var cur_movie_key = cur_movie["movie_key"];

            list_content += "<article {{*style=\"min-height:300px;\"*}}>";

            var cur_detail_link = cur_url_base + "?date=" + "{{ $cinema_date }}" + "&movie_key=" + cur_movie_key + "&region=" + "{{ $cinema_region }}";

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

<style type="text/css">

.loading_block_events {
    margin-top: 25px;
    margin-bottom: 100px;
    background: none repeat scroll 0 0 #F5F5F5;
}
.loading_image_events {
    margin-left: 25px;
}
.loading_text_events {
    margin-top: -35px;
    margin-bottom: 150px;
    margin-left: 100px;
}

.option_styled {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #A5A5A5;
    float: left;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 11px;
    height: 18px;
    line-height: 16px;
    padding: 1px 1px 2px 4px;
    width: 120px;
}

.text_hidden {
    display: none;
}

</style>


<script type="text/javascript">

window.list_spec = {
    type: '',
    date: '',
    period: '',
    region: '',
    page: 0
};

window.update_list_on_params = function(params) {
    return;
};


function outline_type(ev_type) {

    window.what_val = ev_type;
    $(".nav_one").removeClass("active");
    $("#nav_" + ev_type).addClass("active");

};

/*
function load_type(ev_type) {

    outline_type(ev_type);

    window.reload();

    //alert("not implemented: " + genre);
    return false;
};
*/

</script>


<body>

    <div id="content_wrapper" class="content-wrapper">

{{ include file="_tpl/header-nav.tpl" }}

{{ include file="_tpl/header.tpl" }}

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


<div id="newslist" style="display:none;">
    <div class="no_movie_found"><p>Ihre Suche ergab keine Treffer</p></div>
</div><!-- end of newslist -->



<script type="text/javascript">

window.used_date = function(separator, value_only) {
    var when = "" + $("#wann").val();
    when = escape(when.replace(/^\s+|\s+$/g, ""));

    var evdate = "";
    var evdateobj = null;
    var evdate_day = "";
    var evdate_month = "";
    var evdate_year = "";

    if ("" != when) {
        if (!evdateobj) {
            //evdateobj = $(".datepicker").datepicker("getDate");
            evdateobj = $("#wann").datepicker("getDate");
        }
    }
    if (!evdateobj) {
        evdateobj = new Date();
    }
    var has_get_date = false;
    if ('getDate' in evdateobj) {
        has_get_date = true;
    }
    if (!has_get_date) {
        evdateobj = new Date();
    }

    evdate_day = evdateobj.getDate();
    if (10 > evdate_day) {
        evdate_day = "0" + evdate_day;
    }
    evdate_month = evdateobj.getMonth() + 1;
    if (10 > evdate_month) {
        evdate_month = "0" + evdate_month;
    }
    evdate_year = evdateobj.getFullYear();

    //$(".datepicker").datepicker("setDate" , evdateobj);
    $("#wann").datepicker("setDate" , evdateobj);
    update_datepicker_visible();

    var date_value = evdate_year + "-" + evdate_month + "-" + evdate_day;
    if (value_only) {
        return date_value;
    }

    return separator + "date=" + date_value;
};

window.used_period = function(separator, value_only) {
    var span = "" + agenda_get_span();

    var spec = "";

    if ("" == span) {
        span = "1";
    }

    if (value_only) {
        return span;
    }

    spec = separator + "period=" + span;

    return spec;
};

window.used_place = function(separator, value_only) {
    var where = "" + $("#wo").val();
    where = escape(where.replace(/^\s+|\s+$/g, ""));

    var spec = "";

    if ("" == where) {
        where = "region-zentralschweiz";
        //return "";
    }


    if (value_only) {
        return where;
    }

    spec = separator + "region=" + where;

    return spec;
};

window.set_list_content = function(data, direct) {
    if (direct) {
        $('#newslist').html(data);
        //$('#newslist_pagination').html('&nbsp;');
        $('#newslist_pagination').hide();

        adapt_global_sizes(true);

        return;
    }

    var dom = $(data);
    $('#newslist').html($('#newslist', dom).html());
    $('#newslist_pagination').html($('#newslist_pagination', dom).html());
    $('#newslist_pagination').show();

    //window.set_cufon_fonts();
    //Cufon.now();

    adapt_global_sizes(true);

};

window.get_basic_path = function() {
    return "{{ local }}{{ set_current_issue }}{{ set_section number="71" }}{{ uri options="section" }}{{ /local }}" + "?load=1";
};

window.what_val = 'kino';

window.last_search = window.get_basic_path();
window.last_search_spec = "";

$(document).ready(function() {

    $("#date_picker_button_new").hide();
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
                    <small>Werbung</small>
{{*
                {{ include file="_ads/section-sidebar.tpl" }}
*}}
                    <a href="#"><img alt="" src="{{ uri static_file="pictures/" }}ad-2.jpg"></a>
                </div>

            </div><!-- / aside -->

        </div><!-- / content -->
        </div><!-- / content_wrapper -->

    </div><!-- / wide_wrapper -->

    <div id="footer">

{{ include file="_tpl/footer.tpl" }}

    </div><!-- / footer -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
