{{ include file="_tpl/_html-head.tpl" }}
<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = false;

{{ assign var="event_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="event_date" value=$smarty.get.date|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

window.preset_date = "{{ $event_date }}";

{{ assign var="event_key" value=$smarty.get.event_key|replace:" ":"\\ "|replace:'"':"" }}
window.event_mode = "detail";
window.event_key = "{{ $event_key }}";
window.event_detail = {{ api_events event_key=$event_key event_date=$event_date service_provider="http://edge.sourcefabric.org/newscoop/wobs-motm-13-events-for-luzern" http_userpwd="dev:SoFab" }};
console.log(window.event_detail);


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
        var got_event = window.event_detail.event;

        var use_outline_type = "all";
        if (got_event['type'] in types_to_outlines) {
            use_outline_type = types_to_outlines[got_event['type']];
        }

        update_subnav_links("{{ $event_date }}", 1, got_event['canton']);
        outline_type(use_outline_type);

        if (got_event['canton']) {
            $("#wo").val(got_event['canton']);
            $("#wo").hide();
            //$("#wo").dropdownized({fixed:true,reload:true});
        }

        detail_content = "<li>" + got_event.title + "</li>";
    }

    $("#event_detail").html(detail_content);

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

    <div id="wrapper">

{{* include file="_tpl/header-omnibox.tpl" *}}

{{ include file="_tpl/header.tpl" }}

{{ include file="_ausgehen/subnav.tpl" }}

        <div class="content-box clearfix reverse-columns agenda-content">

            <aside class="mobile-hide">

                <p><a href="mailto:agenda@tageswoche.ch">Melden Sie Ihre Veranstaltung!</a></p>

            </aside>

            <section>


<div>
<ul id="event_detail">&nbsp;
</ul>
</div>


            </section>

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
        where = "kanton-basel-stadt";
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


        </div><!-- end of agenda-content -->
        
    </div><!-- / Wrapper -->

    <div id="footer">

{{ include file="_tpl/footer.tpl" }}

    </div><!-- / Footer -->

{{ include file="_tpl/_html-foot.tpl" }}
