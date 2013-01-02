{{ assign var="omit_canonical" true }}
{{ include file="_tpl/_html-head.tpl" }}

{{ assign var="event_key" value=$smarty.get.event_key|replace:" ":"\\ "|replace:'"':"" }}

<script type="text/javascript">
window.useCanonicalForSocialBar = true;
window.ausgehen_url = "{{ url options="root_level" }}ausgehen/search?type=event&key={{ $event_key|escape:'url' }}";
</script>
<link rel="canonical" href="{{ url options="root_level" }}{{ $gimme->language->code }}/{{ $gimme->issue->url_name }}/{{ $gimme->section->url_name }}/?event_key={{ $event_key }}" />


<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = false;

{{ assign var="event_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="event_date" value=$smarty.get.date|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

window.preset_date = "{{ $event_date }}";

window.event_mode = "detail";
window.event_key = "{{ $event_key }}";
window.event_detail = {{ api_events event_key=$event_key event_date=$event_date }};

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
    var detail_content = 'Event not found';

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
/*
                if ('event_region' == cur_param_info_parts[0]) {
                    cur_event_region = cur_param_info_parts[1];
                }
                if ('event_type' == cur_param_info_parts[0]) {
                    cur_event_type = cur_param_info_parts[1];
                }
*/
            }
        }
    }

    if (window.event_detail && window.event_detail.event) {
        detail_content = '';

        var got_event = window.event_detail.event;

        var use_outline_type = "all";
        if (got_event['type'] in types_to_outlines) {
            use_outline_type = types_to_outlines[got_event['type']];
        }

        update_subnav_links("{{ $event_date }}", 1, got_event['canton']);
        outline_type(use_outline_type);

        //if (got_event['canton']) {
        //    $("#wo").val(got_event['canton']);
        //    $("#wo").hide();
        //    //$("#wo").dropdownized({fixed:true,reload:true});
        //}

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
        if (got_event.date_time) {
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

function load_area(area) {

    var link_region = $(area).val();

    if (/^[a-zA-Z-]+$/.test(link_region)) {
        old_link = location.href;
        new_link = old_link.replace(/&region=[a-zA-Z-]+/i, "&region="+link_region);
        location.href = new_link;
    }

    return true;

};
</script>


<body>

    <div id="content_wrapper" class="content-wrapper">

{{ include file="_tpl/header-nav.tpl" }}

{{ include file="_tpl/header.tpl" }}

{{ include file="_ausgehen/subnav-common-func.tpl" }}

{{ include file="_ausgehen/subnav-detail-top.tpl" }}

<div class="content no-bottom-line equal-heights clearfix">

    <div class="main event-single">

        <div class="box back-link bottom-line">
{{ local }}
{{ set_current_issue }}
{{ set_section number="71" }}
            <a href="{{ uri options="section" }}" id="list_back_link_icon" class="button white prev">&lsaquo;</a> <a id="list_back_link_text" href="{{ uri options="section" }}">zur Ubersicht Veranstaltungen</a>
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
            <small>Werbung</small>
{{*
                {{ include file="_ads/section-sidebar.tpl" }}
*}}
            <a href="#"><img src="{{ uri static_file="pictures/" }}ad-2.jpg" alt="" /></a>
        </div>

    </div><!-- /aside -->

</div><!-- /content -->

</div><!-- /content_wrapper -->


<script type="text/javascript">
window.reload_date_direct = true;
window.reload_date = function() {
    var link_date = window.used_date("", true);

    if (/^(\d){4}-(\d){2}-(\d){2}$/.test(link_date)) {

        old_link = location.href;
        new_link = old_link.replace(/&date=[\d-]+/i, "&date="+link_date);
        location.href = new_link;

    }


};

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


window.get_basic_path = function() {
    return "{{ local }}{{ set_current_issue }}{{ set_section number="71" }}{{ uri options="section" }}{{ /local }}" + "?load=1";
};

window.what_val = 'theater';

window.last_search = window.get_basic_path();
window.last_search_spec = "";

$(document).ready(function() {

    $("#date_picker_button_new").hide();
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
