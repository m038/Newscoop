{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_ausgehen/api-teaser.tpl" }}

<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = true;

{{ assign var="event_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="event_date" value=$smarty.get.date|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

window.preset_date = "{{ $event_date }}";


{{ assign var="event_region" value="region-zentralschweiz" }}
{{ if $smarty.get.region }}
    {{ assign var="event_region" value=$smarty.get.region|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

{{ if $event_region != "kanton-luzern" }}
    {{ if $event_region != "kanton-nidwalden" }}
        {{ if $event_region != "kanton-obwalden" }}
            {{ if $event_region != "kanton-schwyz" }}
                {{ if $event_region != "kanton-uri" }}
                    {{ if $event_region != "kanton-zug" }}
                        {{ assign var="event_region" "region-zentralschweiz" }}
                    {{ /if }}
                {{ /if }}
            {{ /if }}
        {{ /if }}
    {{ /if }}
{{ /if }}

{{ assign var="event_type" value="event" }}
{{ if $smarty.get.type }}
    {{ assign var="event_type" value=$smarty.get.type|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

window.event_mode = "list";
{{ if $event_type eq 'event' }}
    window.event_list = {{ api_events event_date=$event_date event_region=$event_region }};
    window.events_mixed = true;
{{ else }}
    window.event_list = {{ api_events event_genre=$event_type event_date=$event_date event_region=$event_region }};
    window.events_mixed = false;
{{ /if }}

$(document).ready(function() {
    var types_to_outlines = {
        theater: "theater",
        concert: "musik",
        party: "party",
        exhibit: "ausstellung",
        misc: "andere"
    };

    var use_outline_type = "all";
    if ("{{ $event_type }}" in types_to_outlines) {
        use_outline_type = types_to_outlines["{{ $event_type }}"];
    }

    update_type_sel("{{ $event_type }}");

    update_subnav_links("{{ $event_date }}", 1, "{{ $event_region }}");
    outline_type(use_outline_type);

    if ("{{ $event_region }}") {
        $("#wo").val("{{ $event_region }}");
    }

    $("#wann").datepicker("setDate", new Date("{{ $event_date }}"));
    setTimeout("update_datepicker_button(); update_datepicker_visible();", 10);
});

$(document).ready(function() {
    var list_content_none = '<div class="ausgehen-message-holder clearfix"><div class="no-event-found">Ihre Suche ergab keine Treffer.</div></div>';
    var list_content = "";
    var some_regular_event = false;

    var types_to_display = {
        theater: "Theater",
        concert: "Konzert",
        party: "Party",
        exhibit: "Ausstellung",
        misc: "Andere"
    }

    var cantons_to_display = {
        "kanton-zug": "Kanton Zug",
        "kanton-luzern": "Kanton Luzern",
        "kanton-schwyz": "Kanton Schwyz",
        "kanton-nidwalden": "Kanton Nidwalden",
        "kanton-obwalden": "Kanton Obwalden",
        "kanton-uri": "Kanton Uri"
    }

    var cur_url = location.href;
    var cur_url_parts = cur_url.split("#");
    cur_url_parts = cur_url_parts[0].split("?");
    var cur_url_base = cur_url_parts[0];

    var cur_date = null;
    var cur_event_key = null;

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
                if ('event_key' == cur_param_info_parts[0]) {
                    cur_event_key = cur_param_info_parts[1];
                }
            }
        }
    }

    if (window.event_list && window.event_list.events) {
        list_content = '';

        var ev_dose = window.event_list.events;
        var ev_length = ev_dose.length;
        for (var el_ind = 0; el_ind < ev_length; el_ind++) {
            var cur_event = ev_dose[el_ind];
            if ((!cur_event) || (!cur_event.title)) {
                continue;
            }
            if (cur_event['canceled']) {
                continue;
            }

            some_regular_event = true;

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

            var cur_genre_spec = '';
            var cur_genre = cur_event["genre"];

            var cur_location = cur_event["event_location_name"];

            if (window.events_mixed) {
                var cur_event_type = cur_event["type"];
                if (cur_event_type && (cur_event_type in types_to_display)) {
                    var cur_event_type_display = types_to_display[cur_event_type];
                    cur_genre_spec += cur_event_type_display;
                }
            }

            if (cur_genre) {
                if ('' != cur_genre_spec) {
                    cur_genre_spec += ', ';
                }
                cur_genre_spec += cur_genre;
            }

            var cur_event_key = cur_event["event_key"];

            list_content += "<article>";
            list_content += "<h4><a href=\"" + cur_url_base + "?date=" + cur_date + "&event_key=" + cur_event_key +"\">" + cur_event.title + "</a></h4>";
            list_content += "<ul>";

            if (!cur_time) {
                cur_time = "&nbsp;";
            }
            list_content += "<li>" + cur_time + "</li>";

            if (!cur_genre_spec) {
                cur_genre_spec = "&nbsp;";
            }
            list_content += "<li>" + cur_genre_spec + "</li>";

            if (!cur_location) {
                cur_location = "&nbsp;";
            }
            list_content += "<li>" + cur_location + "</li>";

            var cur_addr = '';
            if (cur_event["street"]) {
                cur_addr += cur_event["street"];
            }
            if (cur_event["town"]) {
                if ('' != cur_addr) {
                    cur_addr += ', ';
                }
                cur_addr += cur_event["town"];
            }
            if (cur_event["canton"] && (cur_event["canton"] in cantons_to_display)) {
                var cur_canton = cur_event["canton"];
                if ('' != cur_addr) {
                    cur_addr += ', ';
                }
                cur_addr += cantons_to_display[cur_canton];
            }

            if (!cur_addr) {
                cur_addr = "&nbsp;";
            }
            list_content += "<li>" + cur_addr + "</li>";

            list_content += "</ul>";
            list_content += "</article>";
        }

    }

    if (!some_regular_event) {
        list_content = list_content_none;
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

            {{ include file="_ausgehen/subnav-lists-side.tpl" list_type="events" }}

            <div id="event_list" class="main event-list">
                &nbsp;
            </div><!-- / event_list -->


<div id="newslist" style="display:none;">
    <div class="no_movie_found"><p>Ihre Suche ergab keine Treffer</p></div>
</div><!-- end of newslist -->



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
                    {{ include file="_ads/ausgehen-list-events.tpl" }}
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
