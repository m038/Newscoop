{{ assign var="omit_canonical" true }}
{{ include file="_tpl/_html-head.tpl" }}

{{ assign var="event_key" value=$smarty.get.event_key|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}

<script type="text/javascript">
window.useCanonicalForSocialBar = true;
window.ausgehen_url = "{{ url options="root_level" }}ausgehen/search?type=event&key={{ $event_key|escape:'url' }}";
</script>
<link rel="canonical" href="{{ url options="root_level" }}{{ $gimme->language->code }}/{{ $gimme->issue->url_name }}/{{ $gimme->section->url_name }}/?event_key={{ $event_key|escape:'url' }}" />


<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = false;

window.use_region = "region-zentralschweiz";
window.use_type = "all";
window.use_type_sel = "event";

{{ assign var="event_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="event_date" value=$smarty.get.date|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

window.preset_date = "{{ $event_date }}";

window.event_mode = "detail";
window.event_key = "{{ $event_key }}";
window.event_detail = {{ api_events event_key=$event_key event_date=$event_date event_region="region-zentralschweiz" }};

function display_date_time(date_time_str) {

    var cur_time = null;
    var cur_date = null;
    if (date_time_str) {
        date_time_str = '' + date_time_str;

        var cur_datetime_parts = date_time_str.split(" ");
        if (1 <= cur_datetime_parts.length) {
            var cur_date_parts = cur_datetime_parts[0].split("-");
            if (3 <= cur_date_parts.length) {
                cur_date = cur_date_parts[2] + "." + cur_date_parts[1] + "." + cur_date_parts[0];
            }
        }
        if (2 <= cur_datetime_parts.length) {
            var cur_time_parts = cur_datetime_parts[1].split(":");
            if (2 <= cur_time_parts.length) {
                cur_time = cur_time_parts[0] + ":" + cur_time_parts[1];
            }
        }
    }

    var ret_vals = {
        'date': cur_date,
        'time': cur_time
    };

    return ret_vals;
};

$(document).ready(function() {
    var detail_content = '<div class="ausgehen-message-holder clearfix"><div class="event-not-found"><p>Veranstaltung nicht gefunden.</p></div></div>';

    var types_to_outlines = {
        theater: "theater",
        concert: "musik",
        party: "party",
        exhibit: "ausstellung",
        misc: "andere"
    }

    var cur_url = location.href;
    var cur_url_parts = cur_url.split("#");
    cur_url_parts = cur_url_parts[0].split("?");
    var cur_url_base = cur_url_parts[0];

    var cur_date = null;
    var cur_event_region = null;
    var cur_event_type = null;

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
            }
        }
    }

    if (window.event_detail && window.event_detail.event && window.event_detail.event['canceled']) {
        detail_content = '<div class="ausgehen-message-holder clearfix"><div class="event-canceled"><p>Veranstaltung abgesagt.</p></div></div>';
    }

    if (window.event_detail && window.event_detail.event && (!window.event_detail.event['canceled'])) {
        detail_content = '';

        var got_event = window.event_detail.event;

        if (got_event['type'] in types_to_outlines) {
            window.use_type = types_to_outlines[got_event['type']];
			window.use_type_sel = got_event['type'];
        }

        if (got_event['canton'] && ("" != got_event['canton'])) {
            window.use_region = got_event['canton'];
        }

        detail_content += "<h3>" + got_event.title + "</h3>\n";

        if (got_event.description) {
            var desc_arr = got_event.description.split("\n");
            var desc_arr_count = desc_arr.length;
            for (var desc_ind = 0; desc_ind < desc_arr_count; desc_ind++) {
                if (desc_arr[desc_ind] && ("" != desc_arr[desc_ind])) {
                    detail_content += "<p>" + desc_arr[desc_ind] + "</p>";
                }
            }
        }

        var date_time_str = null;
        if (got_event.postponed) {
            date_time_str = '<div class="event_postponed">verschoben</div>';
        }

        if (got_event.date_time && (!got_event.postponed)) {
            var date_time_info = display_date_time(got_event.date_time);
            if (date_time_info['date'] || date_time_info['time']) {
                date_time_str = '';
            }
            if (date_time_info['date']) {
                date_time_str += date_time_info['date'];
            }
            if (date_time_info['date'] && date_time_info['time']) {
                date_time_str += ', ';
            }
            if (date_time_info['time']) {
                date_time_str += date_time_info['time'] + ' Uhr';
            }
        }

        var have_details = false;
        if (got_event.genre || got_event.minimal_age || got_event.languages || date_time_str) {
            have_details = true;
        }
        if (have_details) {
            detail_content += '<dl class="details">';
            if (got_event.genre) {
                detail_content += '<dt>Genre:</dt><dd>' + got_event.genre + "</dd>\n";
            }
            if (date_time_str) {
                detail_content += '<dt>Wann:</dt><dd>' + date_time_str + "</dd>\n";
            }
            if (got_event.minimal_age) {
                detail_content += '<dt>Mindestalter:</dt><dd>' + got_event.minimal_age + "</dd>\n";
            }
            if (got_event.languages) {
                detail_content += '<dt>Sprache:</dt><dd>' + got_event.languages + "</dd>\n";
            }
            detail_content += "</dl>\n";
        }

        if (got_event.description_links) {
            detail_content += '<ul class="simple-list">';

            var desc_lnk = got_event.description_links;
            var desc_lnk_count = desc_lnk.length;
            for (var desc_lnk_ind = 0; desc_lnk_ind < desc_lnk_count; desc_lnk_ind++) {
                if (desc_lnk[desc_lnk_ind] && ("" != desc_lnk[desc_lnk_ind])) {
                    detail_content += '<li><a href="' + desc_lnk[desc_lnk_ind] + '">' + desc_lnk[desc_lnk_ind] + '</a></li>';
                }
            }

            detail_content += "</ul>\n";
        }

    }

    update_subnav_links("{{ $event_date }}", 1, window.use_region);
    outline_type(window.use_type);
	update_type_sel(window.use_type_sel);

    $("#list_back_link_icon").attr("href", $("#list_back_link_icon").attr("href") + "&region=" + window.use_region)
    $("#list_back_link_text").attr("href", $("#list_back_link_text").attr("href") + "&region=" + window.use_region)

    $("#event_detail").html(detail_content);

    var location_content = "";

    location_content += '<p>';
    if (got_event.event_location_name) {
        location_content += '<strong>' + got_event.event_location_name + '</strong><br />';
    }
    if (got_event.street) {
        location_content += got_event.street;
    }
    if (got_event.street && got_event.town) {
        location_content += ', ';
    }
    if (got_event.town) {
        location_content += got_event.town;
    }
    location_content += "</p>\n";

    location_content += '<p>';
    if (got_event.email) {
        location_content += '<a href="mailto:' + got_event.email + '">' + got_event.email + '</a><br />';
    }
    if (got_event.web) {
        location_content += '<a href="' + got_event.web + '">' + got_event.web + '</a><br />';
    }
    location_content += "</p>\n";

    if (got_event.latitude && got_event.longitude) {
        var map_param_q = got_event.latitude + ',' + got_event.longitude;
        if (got_event.event_location_name) {
            map_param_q += '+(' + encodeURIComponent(got_event.event_location_name) + ')';
        }
        location_content += '<iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.com/maps?hl=de&q=' + map_param_q + '&ll=' + got_event.latitude + ',' + got_event.longitude +'&hnear=' + encodeURIComponent(got_event.town) + ',+Switzerland&t=m&ie=UTF8&z=16&output=embed"></iframe>';
    }

    $("#event_location").html(location_content);

});

</script>

<body>

    <div id="content_wrapper" class="content-wrapper">

{{ include file="_tpl/header-nav.tpl" }}

{{ include file="_tpl/header.tpl" }}

{{ include file="_ausgehen/other-common.tpl" }}

{{ include file="_ausgehen/subnav-common-func.tpl" }}

{{ include file="_ausgehen/subnav-detail-top.tpl" }}

<div class="content no-bottom-line equal-heights clearfix">

    <div class="main event-single">

        <div class="box back-link bottom-line">
{{ local }}
{{ set_current_issue }}
{{ set_section number="71" }}
            <a href="{{ uri options="section" }}?date={{ $event_date|escape:'url' }}" id="list_back_link_icon" class="button white prev">&lsaquo;</a> <a id="list_back_link_text" href="{{ uri options="section" }}?date={{ $event_date|escape:'url' }}">zur Ubersicht Veranstaltungen</a>
{{ /local }}
        </div>

        <article id="event_detail" class="bottom-line">
            &nbsp;
        </article><!-- /event_detail -->

    {{ include file="_tpl/article-tools.tpl" }}

    </div><!-- /main -->

    <div class="aside">

        <article id="event_location" class="bottom-line">
            &nbsp;
        </article>

        <div class="ad">
            {{ include file="_ads/ausgehen-detail-event.tpl" }}
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
