<script type="text/javascript">

window.event_teaser = {{ api_events event_teaser=1 event_region="region-zentralschweiz" service_provider="http://edge.sourcefabric.org/newscoop/wobs-motm-13-events-for-luzern" http_userpwd="dev:SoFab" }};
console.log(window.event_teaser);

window.movie_teaser = {{ api_cinema movie_teaser=1 movie_rating=3 cinema_date="2012-10-26" cinema_region="region-basel" service_provider="http://edge.sourcefabric.org/newscoop/wobs-motm-13-events-for-luzern" http_userpwd="dev:SoFab" }};
console.log(window.movie_teaser);

$(document).ready(function() {

{{ local }}
{{ set_current_issue }}
{{ set_section number="71" }}
    var event_base_dir = "{{ uri options="section" }}";
{{ /local }}

{{ local }}
{{ set_current_issue }}
{{ set_section number="72" }}
    var movie_base_dir = "{{ uri options="section" }}";
{{ /local }}

    var default_icon_event = "ico-kat_0005_diverse.png";
    var default_icon_movie = "ico-kat_0003_kino.png";
    var cur_icon_name = "";

    var icon_image_names = {
        kino: "ico-kat_0003_kino.png",
        theater: "ico-kat_0001_theater.png",
        concert: "ico-kat_0002_konzert.png",
        party: "ico-kat_0000_party.png",
        exhibit: "ico-kat_0004_ausstellung.png",
        misc: "ico-kat_0005_diverse.png"
    };

    var types_to_display = {
        theater: "Theater",
        concert: "Konzert",
        party: "Party",
        exhibit: "Ausstellung",
        misc: "Andere"
    };

    var today = new Date();
    var cur_day = today.getDate();
    if (10 > cur_day) {
        cur_day = '0' + cur_day;
    }
    cur_day = '' + cur_day;
    var cur_mon = today.getMonth() + 1;
    if (10 > cur_mon) {
        cur_mon = '0' + cur_mon;
    }
    cur_mon = '' + cur_mon;
    var cur_year = '' + today.getFullYear();

    var event_date = cur_year + '-' + cur_mon + '-' + cur_day;

    var cinema_date = "2012-10-26";
    var cinema_region = "region-basel";

    var teaser_img_sizes = "";
    if (window.teaser_width) {
        teaser_img_sizes += ' width="' + window.teaser_width + '" ';
    }
    if (window.teaser_height) {
        teaser_img_sizes += ' height="' + window.teaser_height + '" ';
    }

    if (window.event_teaser && window.event_teaser.events && window.event_teaser.events[0]) {
        var use_event = window.event_teaser.events[0];

        if (use_event && use_event['title'] && use_event['event_key']) {

            var event_icon_alt = "Ausgehen";
            if (use_event['type'] && (use_event['type'] in types_to_display)) {
                event_icon_alt = types_to_display[use_event['type']];
            }

            cur_icon_name = default_icon_event;
            if (use_event['type'] && (use_event['type'] in icon_image_names)) {
                cur_icon_name = icon_image_names[use_event['type']];
            }

            var event_desc = use_event['description'];
            if (!event_desc) {
                event_desc = "&nbsp;";
            }
            var event_desc_lim = 100;
            if (event_desc_lim < event_desc.length) {
                event_desc = event_desc.substr(0, event_desc_lim) + "...";
            }

            var event_link = event_base_dir + "?event_key=" + use_event['event_key'] + "&date=" + event_date;

            var event_display = "<h6><a href=\"" + event_link + "\">Tipps des Tages</a></h6>";
            event_display += "<figure><img src=\"{{ uri static_file="pictures/" }}" + cur_icon_name + "\" alt=\"" + event_icon_alt + "\" " + teaser_img_sizes + " /></figure>\n";
            event_display += "<h3><a href=\"" + event_link + "\">" + use_event['title'] + "</a></h3>\n";

            event_display += "<p>" + event_desc;
            event_display += "<br /><a href=\"" + event_link + "\">weiterlesen</a></p>";

            $("#teaser_event").html(event_display);
            $("#teaser_event").show();

        }

    }

    if (window.movie_teaser && window.movie_teaser.films && window.movie_teaser.films[0]) {
        var use_movie = window.movie_teaser.films[0];

        if (use_movie && use_movie['title'] && use_movie['movie_key']) {
/*
            var movie_display = "<h4><a href=\"" + movie_base_dir + "?movie_key=" + use_movie['movie_key'] + "&date=" + cinema_date + "&region=" + cinema_region + "\">" + use_movie['title'] + "</a></h4>";
            if (use_movie['director']) {
                movie_display += " by " + use_movie['director'];
            }
*/

            var movie_icon_alt = "Kino";
            cur_icon_name = default_icon_movie;

            var movie_desc = use_movie['synopsis'];
            if (!movie_desc) {
                movie_desc = "&nbsp;";
            }
            var movie_desc_lim = 100;
            if (movie_desc_lim < movie_desc.length) {
                movie_desc = movie_desc.substr(0, movie_desc_lim) + "...";
            }

            var movie_link = movie_base_dir + "?movie_key=" + use_movie['movie_key'] + "&date=" + cinema_date + "&region=" + cinema_region;

            var movie_display = "<h6><a href=\"" + movie_link + "\">Neu im Kino</a></h6>";
            movie_display += "<figure><img src=\"{{ uri static_file="pictures/" }}" + cur_icon_name + "\" alt=\"" + movie_icon_alt + "\" " + teaser_img_sizes + " /></figure>\n";
            movie_display += "<h3><a href=\"" + movie_link + "\">" + use_movie['title'] + "</a></h3>";

            movie_display += "<p>" + movie_desc;
            movie_display += "<br /><a href=\"" + movie_link + "\">weiterlesen</a></p>";

            $("#teaser_movie").html(movie_display);
            $("#teaser_movie").show();
        }

    }

});

</script>

