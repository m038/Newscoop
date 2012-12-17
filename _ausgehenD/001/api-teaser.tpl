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

    var types_to_display = {
        theater: "Theater",
        concert: "Konzert",
        party: "Party",
        exhibit: "Ausstellung",
        misc: "Andere"
    }

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

    if (window.event_teaser && window.event_teaser.events && window.event_teaser.events[0]) {
        var use_event = window.event_teaser.events[0];

        if (use_event && use_event['title'] && use_event['event_key']) {
            var event_display = "<h4><a href=\"" + event_base_dir + "?event_key=" + use_event['event_key'] + "&date=" + event_date + "\">" + use_event['title'] + "</a></h4>";

            if (use_event['type'] && (use_event['type'] in types_to_display)) {
                event_display += " " + types_to_display[use_event['type']];
            }

            $("#teaser_event").html(event_display);
            $("#teaser_event").show();
        }

    }

    if (window.movie_teaser && window.movie_teaser.films && window.movie_teaser.films[0]) {
        var use_movie = window.movie_teaser.films[0];

        if (use_movie && use_movie['title'] && use_movie['movie_key']) {
            var movie_display = "<h4><a href=\"" + movie_base_dir + "?movie_key=" + use_movie['movie_key'] + "&date=" + cinema_date + "&region=" + cinema_region + "\">" + use_movie['title'] + "</a></h4>";

            if (use_movie['director']) {
                movie_display += " by " + use_movie['director'];
            }

            $("#teaser_movie").html(movie_display);
            $("#teaser_movie").show();
        }

    }

});

</script>

