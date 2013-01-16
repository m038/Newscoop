{{ assign var="omit_canonical" true }}
{{ include file="_tpl/_html-head.tpl" }}
{{ include file="_tpl/auto_playlists.tpl" }}

{{ assign var="movie_key" value=$smarty.get.movie_key|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}

<script type="text/javascript">
window.useCanonicalForSocialBar = true;
window.ausgehen_url = "{{ url options="root_level" }}ausgehen/search?type=movie&key={{ $movie_key|escape:'url' }}";
</script>
<link rel="canonical" href="{{ url options="root_level" }}{{ $gimme->language->code }}/{{ $gimme->issue->url_name }}/{{ $gimme->section->url_name }}/?movie_key={{ $movie_key|escape:'url' }}" />

<script type="text/javascript">
window.teaser_width = "158";
window.teaser_height = "79";
</script>
{{ include file="_ausgehen/api-teaser.tpl" }}

<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = false;

{{ assign var="cinema_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="cinema_date" value=$smarty.get.date|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

window.preset_date = "{{ $cinema_date }}";

{{ assign var="cinema_region" value="" }}
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

window.api_mode = "detail";
window.movie_key = "{{ $movie_key }}";
{{ if $cinema_region eq "" }}
    window.api_detail = {{ api_cinema movie_key=$movie_key cinema_date=$cinema_date cinema_region="region-zentralschweiz" }};
    $(document).ready(function() {
        update_subnav_links("{{ $cinema_date }}", 1, "region-zentralschweiz");
    });
{{ else }}
    window.api_detail = {{ api_cinema movie_key=$movie_key cinema_date=$cinema_date cinema_region=$cinema_region }};
    $(document).ready(function() {
        update_subnav_links("{{ $cinema_date }}", 1, "{{ $cinema_region }}");
    });
{{ /if }}

window.cinemas = window.api_detail.locations;

function get_date_string(date_obj) {
    date_day = date_obj.getDate();
    if (10 > date_day) {
        date_day = "0" + date_day;
    }
    date_month = date_obj.getMonth() + 1;
    if (10 > date_month) {
        date_month = "0" + date_month;
    }
    date_year = date_obj.getFullYear();
    var date_str = date_year + "-" + date_month + "-" + date_day;

    return date_str;
};

function get_day_display_info(date_str) {
    var date_obj = new Date(date_str);

    var week_days = ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa']
    var date_week_day = week_days[date_obj.getDay()];

    date_day = date_obj.getDate();
    if (10 > date_day) {
        date_day = "0" + date_day;
    }
    date_month = date_obj.getMonth() + 1;
    if (10 > date_month) {
        date_month = "0" + date_month;
    }

    var date_simple = '' + date_day + '.' + date_month;

    var date_info = {'week': date_week_day, 'simple': date_simple};

    return date_info;
};

$(document).ready(function() {
    var detail_content = '<div class="ausgehen-message-holder clearfix"><div class="event-not-found"><p>Film nicht gefunden.</p></div></div>';

    outline_type("kino");
    update_type_sel("kino");

    var run_date_obj = new Date();
    var run_date = get_date_string(run_date_obj);

    var sel_date = window.preset_date;

    var cur_url = location.href;
    var cur_url_parts = cur_url.split("#");
    cur_url_parts = cur_url_parts[0].split("?");
    var cur_url_base = cur_url_parts[0];

    var cur_date = null;
    var cur_cinema_region = null;
    var cur_movie_type = null;

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
                if ('region' == cur_param_info_parts[0]) {
                    cur_cinema_region = cur_param_info_parts[1];
                }
            }
        }
    }

    var got_movie = null;

    if (window.api_detail && window.api_detail.film) {
        got_movie = window.api_detail.film;

        if (got_movie.title) {
            document.title = "zentral+" + String.fromCharCode(160) + "|" + String.fromCharCode(160) + got_movie.title;
        }

        detail_content = "";

        detail_content += "<h3>" + got_movie.title + "</h3>\n";

        if (got_movie.movie_poster_url && ("" != got_movie.movie_poster_url)) {
            detail_content += '<figure class="left">';
            detail_content += '<img src="' + got_movie.movie_poster_url + '" alt="" />';
            if (got_movie.image_copyright) {
                detail_content += '<figcaption>' + got_movie.image_copyright + "</figcaption>\n";
            }
            detail_content += '</figure>';
        }

        if (got_movie.synopsis) {
            var desc_arr = got_movie.synopsis.split("\n");
            var desc_arr_count = desc_arr.length;
            for (var desc_ind = 0; desc_ind < desc_arr_count; desc_ind++) {
                if (desc_arr[desc_ind] && ("" != desc_arr[desc_ind])) {
                    detail_content += "<p>" + desc_arr[desc_ind] + "</p>";
                }
            }
        }

        var got_rating = 0;
        if (got_movie.rating) {
            got_rating = got_movie.rating;
        }
        if (0 > got_rating) {
            got_rating = 0;
        }

        detail_content += '<ul class="rating">';
        for (var cur_rat_ind = 0; cur_rat_ind < got_rating; cur_rat_ind++) {
            detail_content += '<li class="on">' + (cur_rat_ind + 1) + '</li>';
        }
        for (var cur_rat_ind = got_rating; cur_rat_ind < 5; cur_rat_ind++) {
            detail_content += '<li class="off">' + (cur_rat_ind + 1) + '</li>';
        }
        detail_content += '</ul>' + "\n";

        detail_content += '<div class="details"><p>';
        if (got_movie.director) {
            detail_content += '<strong>Regisseur</strong>: ' + got_movie.director + "<br />\n";
        }
        if (got_movie.actors) {
            detail_content += '<strong>Schauspieler</strong>: ' + got_movie.actors + "\n";
        }
        detail_content += '</p></div>';

    }

    $("#movie_detail").html(detail_content);

    if (got_movie) {

        var vimeo_id = null;
        if (false) { // TODO: debugging
            vimeo_id = '49214422';
        }
        if (got_movie.vimeo_id) {
            vimeo_id = got_movie.vimeo_id;
        }
        if (vimeo_id) {
            $("#trailer_link").attr("src", "http://player.vimeo.com/video/" + vimeo_id + "?title=0&byline=0&portrait=0");
            $("#trailer_holder").show();
        }

        var slide_content = "";
        var thumb_content = "";
		var having_images = false;

        if (got_movie.movie_image_urls && (0 != got_movie.movie_image_urls.length)) {
            thumb_content += '<ul class="carousel_mov jcarousel-skin-gallery clearfix">';

            var img_count = got_movie.movie_image_urls.length;
			if (img_count && (0 < img_count)) {
				having_images = true;
			}
            for (var cur_img_ind = 0; cur_img_ind < img_count; cur_img_ind++) {
                var cur_img_link = got_movie.movie_image_urls[cur_img_ind];

                cur_img_link = cur_img_link.replace(/ImageHeight=\d*/, "ImageHeight=480");
                cur_img_link = cur_img_link.replace(/ImageWidth=\d*/, "ImageWidth=720");

                var class_img_hidden = "";
                if (0 < cur_img_ind) {
                    class_img_hidden = " mov_img_part_hidden ";
                }

                slide_content += '<div id="tab-' + (cur_img_ind + 1) + '" class="gall-box' + class_img_hidden + '">';
                slide_content += '<figure>';
                slide_content += '<a href="' + cur_img_link + '" rel="fancybox-thumb_mov" class="zoom fancybox-thumb_mov" style="display:none">Zoom</a>';
                slide_content += '<img alt="" src="' + cur_img_link + '">';
                if (got_movie.image_copyright) {
                    slide_content += '<small>' + got_movie.image_copyright + '</small>';
                }
                slide_content += '</figure>';
                slide_content += "</div>\n";

                var cur_thm_link = cur_img_link;
                cur_thm_link = cur_thm_link.replace(/ImageHeight=\d*/, "ImageHeight=43");
                cur_thm_link = cur_thm_link.replace(/ImageWidth=\d*/, "ImageWidth=90");

                thumb_content += '<li><a href="#tab-' + (cur_img_ind + 1) + '"><img src="' + cur_thm_link + '" alt="" /></a></li>';
            }

            thumb_content += "</ul>\n";
        }


        $("#image_gallery").html(slide_content + thumb_content);

		if (having_images) {
			$("#image_gallery").show();
		}
		else {
			$("#image_gallery").hide();
		}

        var screen_content = "";

                if (got_movie.screenings) {
                    var cur_screen_set = got_movie.screenings;
                    var cur_screen_set_count = cur_screen_set.length;
                    for (var css_ind = 0; css_ind < cur_screen_set_count; css_ind++) {
                        var cur_screen = cur_screen_set[css_ind];

                        var cur_loc_id = cur_screen.location_id;
                        var cur_cinema = get_cinema(cur_loc_id);

                        if (!cur_cinema) {
                            continue;
                        }
                        var cur_cin_name = cur_cinema["location_name"];
                        var cur_cin_addr = cur_cinema["street"] + "<br />" + cur_cinema["town"];
                        var cur_cin_tel = cur_cinema["phone"];
                        var cur_cin_tel_cost = cur_cinema["phone_costinformation"];
                        var cur_cin_lat = cur_cinema["latitude"];
                        var cur_cin_lon = cur_cinema["longitude"];
                        var cur_cin_town = cur_cinema["town"];

                        var date_min = null;
                        var date_max = null;
                        var date_arr = {};

                        var cur_scr_times = cur_screen['times'];

                        if (cur_scr_times) {
                            var cur_scr_times_count = cur_scr_times.length;
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

                                if ((!date_min) || (cur_scr_date < date_min)) {
                                    date_min = cur_scr_date;
                                }
                                if ((!date_max) || (cur_scr_date > date_max)) {
                                    date_max = cur_scr_date;
                                }

                                if (!date_arr[cur_scr_date]) {
                                    date_arr[cur_scr_date] = [];
                                }

                                var one_scr_info = {'time': cur_scr_time, 'lang': null};
                                if (cur_scr_time_info.languages) {
                                    one_scr_info['lang'] = cur_scr_time_info.languages;
                                }
                                date_arr[cur_scr_date].push(one_scr_info);

                            }

                        }

                        var date_span = 1 + ((Date.parse(date_max) - Date.parse(date_min))/86400000);
                        if (7 > date_span) {
                            if (run_date < date_min) {
                                date_min = get_date_string(new Date(Date.parse(date_min) - ((7 - date_span)*86400000)));
                                if (run_date > date_min) {
                                    date_min = run_date;
                                }
                            }
                        }
                        date_span = 1 + ((Date.parse(date_max) - Date.parse(date_min))/86400000);
                        if (7 > date_span) {
                            date_max = get_date_string(new Date(Date.parse(date_max) + ((7 - date_span)*86400000)));
                        }

                        if (7 < date_span) {
                            if (sel_date > date_max) {
                                date_min = get_date_string(new Date(Date.parse(date_max) - (6*86400000)));
                            }
                            else if (sel_date < date_min) {
                                date_max = get_date_string(new Date(Date.parse(date_min) + (6*86400000)));
                            }
                            else {
                                var aux_span = 1 + ((Date.parse(date_max) - Date.parse(sel_date))/86400000);
                                if (aux_span >= 7) {
                                    date_min = sel_date;
                                    date_max = get_date_string(new Date(Date.parse(date_min) + (6*86400000)));
                                }
                                else {
                                    date_min = get_date_string(new Date(Date.parse(date_max) - (6*86400000)));
                                }
                            }
                        }

                        var min_msec = Date.parse(date_min);
                        var max_msec = Date.parse(date_max);

                        for (var cur_msec = min_msec; cur_msec <= max_msec; cur_msec += 86400000) {
                            var arr_date_str = get_date_string(new Date(cur_msec));
                            if (!date_arr[arr_date_str]) {
                                date_arr[arr_date_str] = null;
                            }
                        }
            
                        var cinema_content = "";

                        var map_param_q = cur_cin_lat + ',' + cur_cin_lon;
                        if (cur_cin_name) {
                            map_param_q += '+(' + encodeURIComponent(cur_cin_name) + ')';
                        }
                        var map_link = 'http://maps.google.com/maps?hl=de&q=' + map_param_q + '&ll=' + cur_cin_lat + ',' + cur_cin_lon +'&hnear=' + encodeURIComponent(cur_cin_town) + ',+Switzerland&t=m&ie=UTF8&z=16';

                        var tel_title = "";
                        if (cur_cin_tel_cost) {
                            tel_title = 'title="' + cur_cin_tel_cost + '"';
                        }

                        cinema_content += '<div class="movie-table">';
                        cinema_content += '<table cellspacing="0" cellpadding="0"><tbody>';
                        cinema_content += '<tr><td class="table-info" rowspan="2"><ul>';
                        cinema_content += '<li><h5>' + cur_cin_name + '</h5></li>';
                        cinema_content += '<li><p>' + cur_cin_addr + '</p><p><a href="' + map_link + '" class="gmap">Google Maps</a></p></li>';
                        cinema_content += '<li><p ' + tel_title + '>Tel ' + cur_cin_tel + '</p></li>';
                        cinema_content += '</ul></td>';
                        for (var date_key in date_arr) {
                            var date_info = get_day_display_info(date_key);
                            cinema_content += '<td class="cinema_screen_list date_hl_all">' + date_info['week'] + '<br>' + date_info['simple'] + '</td>';
                        }
                        cinema_content += '</tr>';
                        cinema_content += '<tr>';
                        for (var date_key in date_arr) {
                            cinema_content += '<td class="screen_time_list">';
                            if (date_arr[date_key]) {
                                var scr_count = date_arr[date_key].length;
                                cinema_content += '<ul>';
                                for (var sind = 0; sind < scr_count; sind++) {
                                    var lang_title = "";
                                    if (date_arr[date_key][sind]['lang']) {
                                        lang_title = 'title="' + date_arr[date_key][sind]['lang'] + '"';
                                    }
                                    cinema_content += '<li ' + lang_title + '>' + date_arr[date_key][sind]['time'] + '</li>';
                                }
                                cinema_content += '</ul>';
                            }
                            cinema_content += '</td>';
                        }
                        cinema_content += '</tr>';
                        cinema_content += '</tbody></table>' + "\n";
                        cinema_content += '</div>';

                        screen_content += cinema_content;

                    }
                }

        $("#movie_tables").html(screen_content);

    }

    setTimeout("set_slideshow();", 10);
});

</script>

<body>

    <div id="content_wrapper" class="content-wrapper">

{{ include file="_tpl/header-nav.tpl" }}

{{ include file="_tpl/header.tpl" }}

{{ include file="_ausgehen/other-common.tpl" }}

{{ include file="_ausgehen/subnav-common-func.tpl" }}

{{ include file="_ausgehen/subnav-detail-top.tpl" }}

<div class="content no-bottom-line clearfix movie-detail">

    <div class="main event-single">

        <div class="box top-line back-link bottom-line">
{{ local }}
{{ set_current_issue }}
{{ set_section number="72" }}
            <a href="{{ uri options="section" }}?date={{ $cinema_date|escape:'url' }}&region={{ $cinema_region }}" id="list_back_link_icon" class="button white prev">&lsaquo;</a> <a id="list_back_link_text" href="{{ uri options="section" }}?date={{ $cinema_date|escape:'url' }}&region={{ $cinema_region }}">zur Übersicht Film</a>
{{ /local }}
        </div>

        <article id="movie_detail" class="bottom-line">
            &nbsp;
        </article><!-- /movie_detail -->

    {{ include file="_tpl/article-tools.tpl" }}

        <article class="bottom-line">
            <div id="image_gallery" class="thumb-gallery tabs_mov clearfix" style="display:none;">
            </div>

            <figure id="trailer_holder" class="movie-trailer margin-bottom" style="display:none;">
                <iframe id="trailer_link" ar="0.5625" width="722" height="406" src="#" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
            </figure>

            <div id="movie_tables">
                &nbsp;
            </div>

        </article>


        <div class="box back-link bottom-line">
{{ local }}
{{ set_current_issue }}
{{ set_section number="72" }}
            <a href="{{ uri options="section" }}?date={{ $cinema_date|escape:'url' }}&region={{ $cinema_region }}" id="list_back_link_icon" class="button prev">&lsaquo;</a> <a id="list_back_link_text" href="{{ uri options="section" }}?date={{ $cinema_date|escape:'url' }}&region={{ $cinema_region }}">zur Übersicht Film</a>
{{ /local }}
        </div>

    </div><!-- /main -->

    <div class="aside top-line">

        <div class="box blog-list single-line left-thumb bottom-line">
            <article id="teaser_movie" style="display:none;">
            </article>
            <article id="teaser_event" style="display:none;">
            </article>
        </div>

        <div class="ad">
            {{ include file="_ads/ausgehen-detail-movie.tpl" }}
        </div>

    </div><!-- /aside -->

</div><!-- /content -->

</div><!-- /content_wrapper -->

<script type="text/javascript">

$(document).ready(function() {

    $("#datapicker-button").hide();
    $("#top-calendar").hide();

    $("#datepicker_single_ul").hide();
});

</script>


    <div id="footer">

{{ include file="_tpl/footer.tpl" }}

    </div><!-- /footer -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
