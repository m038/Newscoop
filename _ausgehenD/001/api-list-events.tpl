{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_ausgehen/api-teaser.tpl" }}

<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = true;
window.load_date_direct = true;


{{ assign var="event_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="event_date" value=$smarty.get.date|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

window.preset_date = "{{ $event_date }}";


{{ assign var="event_region" value="region-zentralschweiz" }}
{{ if $smarty.get.region }}
    {{ assign var="event_region" value=$smarty.get.region|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

{{ assign var="event_type" value="event" }}
{{ if $smarty.get.type }}
    {{ assign var="event_type" value=$smarty.get.type|replace:" ":"\\ "|replace:'"':"" }}
{{ /if }}

window.event_mode = "list";
{{ if $event_type eq 'event' }}
    window.event_list = {{ api_events event_date=$event_date event_region=$event_region service_provider="http://edge.sourcefabric.org/newscoop/wobs-motm-13-events-for-luzern" http_userpwd="dev:SoFab" }};
    window.events_mixed = true;
{{ else }}
    window.event_list = {{ api_events event_genre=$event_type event_date=$event_date event_region=$event_region service_provider="http://edge.sourcefabric.org/newscoop/wobs-motm-13-events-for-luzern" http_userpwd="dev:SoFab" }};
    window.events_mixed = false;
{{ /if }}
console.log(window.event_list);


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

    update_subnav_links("{{ $event_date }}", 1, "{{ $event_region }}");
    outline_type(use_outline_type);

    if ("{{ $event_region }}") {
        $("#wo").val("{{ $event_region }}");
        $("#wo").dropdownized({fixed:true,reload:true});
    }

    $("#wann").datepicker("setDate", new Date("{{ $event_date }}"));
    setTimeout("update_datepicker_button(); update_datepicker_visible();", 10);
});

$(document).ready(function() {
    var list_content = 'Ihre Suche ergab keine Treffer';

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

            var cur_genre = cur_event["genre"];
            var cur_location = cur_event["event_location_name"];
            var cur_genre_loc = '';

            if (window.events_mixed) {
                var cur_event_type = cur_event["type"];
                if (cur_event_type && (cur_event_type in types_to_display)) {
                    var cur_event_type_display = types_to_display[cur_event_type];
                    cur_genre_loc += cur_event_type_display;
                }
            }

            if (cur_genre) {
                if ('' != cur_genre_loc) {
                    cur_genre_loc += ', ';
                }
                cur_genre_loc += cur_genre;
            }
            if (cur_location) {
                if ('' != cur_genre_loc) {
                    cur_genre_loc += ', ';
                }
                cur_genre_loc += cur_location;
            }
            if ('' == cur_genre_loc) {
                cur_genre_loc = null;
            }

            var cur_event_key = cur_event["event_key"];

            list_content += "<li>";
            list_content += "<h3><a href=\"" + cur_url_base + "?date=" + cur_date + "&event_key=" + cur_event_key +"\">" + cur_event.title + "</a></h3>";
            list_content += "<div>";

            if (cur_time) {
                list_content += cur_time;
            }
            if (cur_time && cur_genre_loc) {
                list_content += " &mdash; ";
            }
            if (cur_genre_loc) {
                list_content += cur_genre_loc;
            }

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

            if ('' != cur_addr)
            list_content += "<div>" + cur_addr + "</div>";

            list_content += "</li>";
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

    <div id="wrapper">

{{ include file="_tpl/header-omnibox.tpl" }}

{{ include file="_tpl/header.tpl" }}

{{ include file="_ausgehen/subnav.tpl" }}

        <div class="content-box clearfix reverse-columns agenda-content">

            <aside class="mobile-hide">
            
                <h3>Ort</h3>
                <ul>
                    <li id="wo-place"><div id="wo-mover"><div>
                        <select id="wo" name="region" class="{{*omit_dropdown*}} {{*option_styled*}}" onChange="window.load_area(this); return true;">
                                    <option value="region-zentralschweiz" selected>Zentralschweiz</option>
<!--
                                    <option value="kanton-aargau">Aargau</option>
                                    <option value="kanton-appenzell-ausserrhoden">Appenzell Ausserrhoden</option>
                                    <option value="kanton-appenzell-innerrhoden">Appenzell Innerrhoden</option>
                                    <option value="region-basel">Region Basel</option>
                                    <option value="kanton-basel-stadt">Basel-Stadt</option>
                                    <option value="kanton-basel-landschaft">Basel-Landschaft</option>
                                    <option value="kanton-bern">Bern</option>
                                    <option value="kanton-freiburg">Freiburg</option>
                                    <option value="kanton-genf">Genf</option>
                                    <option value="kanton-glarus">Glarus</option>
                                    <option value="kanton-graubuenden">Graubünden</option>
                                    <option value="kanton-jura">Jura</option>
-->
                                    <option value="kanton-luzern">Luzern</option>
<!--
                                    <option value="kanton-neuenburg">Neuenburg</option>
-->
                                    <option value="kanton-nidwalden">Nidwalden</option>
                                    <option value="kanton-obwalden">Obwalden</option>
<!--
                                    <option value="kanton-schaffhausen">Schaffhausen</option>
-->
                                    <option value="kanton-schwyz">Schwyz</option>
<!--
                                    <option value="kanton-solothurn">Solothurn</option>
                                    <option value="kanton-st-gallen">St. Gallen</option>
                                    <option value="kanton-tessin">Tessin</option>
                                    <option value="kanton-thurgau">Thurgau</option>
-->
                                    <option value="kanton-uri">Uri</option>
<!--
                                    <option value="kanton-waadt">Waadt</option>
                                    <option value="kanton-wallis">Wallis</option>
-->
                                    <option value="kanton-zug">Zug</option>
<!--
                                    <option value="kanton-zuerich">Zürich</option>
-->
                        </select>
                    </div></div></li>
                </ul>
                
                <p><a href="mailto:agenda@tageswoche.ch">Melden Sie Ihre Veranstaltung!</a></p>
            
            </aside>

            <section>

<div>
<ul class="teaser_list">
<li id="teaser_movie" class="teaser_item" style="display:none;">&nbsp;</li>
<li id="teaser_event" class="teaser_item" style="display:none;">&nbsp;</li>
</ul>
</div>
<div>
<ul id="event_list">&nbsp;
</ul>
</div>

<div id="newslist" style="display:none;">
    <div class="no_movie_found"><p>Ihre Suche ergab keine Treffer</p></div>
</div><!-- end of newslist -->

            </section>

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
        where = "kanton-basel-stadt";
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

window.what_val = 'theater';

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


        </div><!-- end of agenda-content -->
        
    </div><!-- / Wrapper -->

    <div id="footer">

{{ include file="_tpl/footer.tpl" }}

    </div><!-- / Footer -->

{{ include file="_tpl/_html-foot.tpl" }}
