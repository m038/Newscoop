
<style type="text/css">
.event_withdrawn {
    color: #a0a0a0;
}
.event_withdrawn_description {
    margin-top: 30px;
}
.agenda_hidden {
    display:none !important;
}

.movie_cross_hidden {
    display:none !important;
}

.movie_cinema_hidden {
    display:none !important;
}

.movie_lang_hidden {
    display:none !important;
}

.movie_age_hidden {
    display:none !important;
}

.agenda_span_selected {
    color: #008148 !important;
    font-weight: bold;
}

#wo {
    border: #cdcdcd solid 1px;
    background-color: #f1f1f1;
    height: 25px;
    width: 136px;
    margin-bottom: 10px;
    height: 28px;
    font-size: 86%;
}

#wo-mover {
    width: 136px !important;
}

/*
#wo-mover {
    border: #cdcdcd solid 1px;
    background-color: #f1f1f1;
    height: 25px;
    width: 136px;
    margin-bottom: 10px;
    height: 28px;
    font-size: 86%;
}
*/

#wann {
    width: 80px !important;
    margin-top: 0px;
    height: 14px;
    background: #fafafa;
    border: 1px inset;
    display: none;
}

#wann_middle {
    margin-top: 6px;
}

#datepicker_single_ul {
    z-index: 600 !important;
}
#ui-datepicker-div {
/*
    top: 234px !important;
*/
    left: 60px !important;
    z-index: 600 !important;
}

.ui-datepicker-prev {
/*
    width: 60px !important;
*/
    width: 30px !important;
}
.ui-datepicker-next {
/*
    width: 60px !important;
*/
    width: 30px !important;
}

.ui-datepicker-group-first {
    margin-left: 11px;
}

.ui-datepicker-trigger {
    display: none;
}
/*
.ui-datepicker-inline-narrow {
    width: 320px !important;
    
}
*/
.top-calendar-narrow {
    width: 280px !important;
}

.agenda-datepicker-narrow {
    width: 300px !important;
    margin-left: -12px !important;
}

.place_selector_narrow {
    margin-left: 150px !important;
    margin-top: 12px !important;
}

.place_selector_narrow_alone {
    margin-left: 10px !important;
    margin-top: 12px !important;
}

.nav_events_narrow {
    margin-top: 5px !important;
    margin-left: 10px !important;
}

.nav_events_narrow_alone {
    margin-left: 10px !important;
}

.datapicker-button_narrow {
    margin-left: 5px;
}

.movie-table_narrow {
    /*width: 380px !important;*/
}

.lang_info_label {
    z-index: 1000;
    position: absolute;
    background: #ffffff;
    padding-left: 5px;
    padding-right: 5px;
    margin-left: 2px;
    text-decoration: none;
}

</style>

<script type="text/javascript">
var closing_datepicker_text = 'Fertig';
var desktop_view = true;
var last_doc_width = 0;
window.movie_trailer_height = 0;
window.last_pano_width = 640;
window.last_pano_height = 240;

function adapt_global_sizes(force) {
    //var doc_width = $(document).width();
    var doc_width = $(window).width();

    if (last_doc_width != doc_width) {
        last_doc_width = doc_width;

        $("#rest_panorama").each(function(ind_elm, elm) {
            var pano_link_src_width = 640;
            var pano_link_src_height = 240;
            if(769 < doc_width) {
                $(elm).css("width", "640px");
                pano_link_src_width = doc_width-360;
                if (640 < pano_link_src_width) {
                    pano_link_src_width = 640;
                }
            }
            else {
                $(elm).css("width", (doc_width-10)+"px");
                pano_link_src_width = doc_width-10;
                pano_link_src_height = 240;
            }
            if ((pano_link_src_width != window.last_pano_width) || (pano_link_src_height != window.last_pano_height)) {
                window.last_pano_width = pano_link_src_width;
                window.last_pano_height = pano_link_src_height;
                var pano_link_src = $(elm).attr("src");
                pano_link_src = pano_link_src.replace(/&w=[\d]+/, "&w="+pano_link_src_width);
                pano_link_src = pano_link_src.replace(/&h=[\d]+/, "&h="+pano_link_src_height);
                $(elm).attr("src", pano_link_src);
            }
        });
    }

    $("iframe").each(function(ind_elm, elm) {
        var ar_str = $(elm).attr("ar");
        if (ar_str && ("" != ar_str)) {
            var ar_num = parseFloat(ar_str);
            if (ar_num && (0 < ar_num)) {
                var video_width = parseInt("" + $(elm).css("width"));
                if (video_width && (0 < video_width)) {
                    var video_height = video_width * ar_num;
                    video_height = parseInt("" + (video_height + 0.5));
                    if (window.movie_trailer_height != video_height) {
                        window.movie_trailer_height = video_height;
                        $(elm).css("height", video_height + "px");
                    }
                }
            }
        }
    });


    if (769 > doc_width) {
        if (force || desktop_view) {
            //$(".movie-table").each(function(ind_elm, elm) {
            //    $(elm).addClass("movie-table_narrow");
            //});

            $("#datapicker-button").after($("#wo-mover"));
            if (window.agenda_has_date_picker) {
                $("#datapicker-button").addClass("datapicker-button_narrow");
                $("#wo-mover").addClass("place_selector_narrow");
            }
            else {
                $("#wo-mover").addClass("place_selector_narrow_alone");
            }

            if (window.agenda_has_select_tags) {
                $("#events_nav").addClass("nav_events_narrow");
            }
            else {
                $("#events_nav").addClass("nav_events_narrow_alone");
            }
        }
        desktop_view = false;
    }
    else {
        if (force || (!desktop_view)) {
            //$(".movie-table").each(function(ind_elm, elm) {
            //    $(elm).removeClass("movie-table_narrow");
            //});

            $("#wo-place").after($("#wo-mover"));
            $("#wo-mover").removeClass("place_selector_narrow");
            $("#events_nav").removeClass("nav_events_narrow");
            $("#events_nav").removeClass("nav_events_narrow_alone");
            $("#datapicker-button").removeClass("datapicker-button_narrow");
        }
        desktop_view = true;
    }

};

function get_month_view_count() {
    var month_num = 3;
    var doc_width = $(document).width();
    if (640 > doc_width) {
        month_num = 1;
    }

    if (1 == month_num) {
        $("#agenda-datepicker").addClass("agenda-datepicker-narrow");
        $("#top-calendar").addClass("top-calendar-narrow");
    }
    else {
        $("#agenda-datepicker").removeClass("agenda-datepicker-narrow");
        $("#top-calendar").removeClass("top-calendar-narrow");
    }

    return month_num;
};

var calendar_is_open = false;

function switch_calendar() {
    if (!calendar_is_open) {
        calendar_is_open = true;
        open_calendar();
        return;
    }

    calendar_is_open = false;
    close_calendar();
};

function open_calendar() {
            $("#agenda-datepicker").datepicker("option", "numberOfMonths", get_month_view_count());

/*
            var dateText = $("#wann").val();
            var dateObj = $("#wann").datepicker("getDate");
            $("#wann-picker").val(dateText);
            $("#agenda-datepicker").datepicker("setDate", dateObj);
*/
            update_datepicker_visible();

            //$(this).addClass('active');
            $('#datapicker-button').addClass('active');

            $('#top-calendar').show();
            $('.agenda-top .overlay').fadeIn(500);
/*
            $('#datapicker-button').css('border', '#008148 solid 1px');
            $('#datapicker-button').css('background-color', '#008148');
            $('#datapicker-button').html(closing_datepicker_text);
*/
};

function close_calendar() {
            var to_reload = false;

            if (agenda_get_span(true) != agenda_get_span()) {
                agenda_sync_span();
                to_reload = true;
            }

            //$(this).removeClass('active');
            $('#datapicker-button').removeClass('active');

            $('#top-calendar').hide();
            $('.agenda-top .overlay').fadeOut(500);
/*
            $('#datapicker-button').css('border', '#CDCDCD solid 1px');
            $('#datapicker-button').css('background-color', '#F1F1F1');
*/
            $('#datapicker-button').html('');
            update_datepicker_button();
            //$('#datapicker-button').html('Heute, 7.3.');

            var dateText = $("#wann-picker").val();
            if ($("#wann").val() != dateText) {
                to_reload = true;
            }
            $("#wann").datepicker("setDate", dateText);
            $("#wann").val(dateText);
            //alert($("#wann").val());

            if (to_reload) {
                if (window.load_date_direct) {
                    window.load_date();
                    return;
                }
                window.reload();
            }

};

/* German initialisation for the jQuery UI date picker plugin. */
/* Written by Milian Wolff (mail@milianw.de). */
$(document).ready(function() {

    adapt_global_sizes();
    setInterval("adapt_global_sizes();", 1000);

  $.datepicker.regional['de'] = {
    closeText: 'schließen',
//    prevText: '&#x3c;&nbsp;zurück',
//    nextText: 'Vor&nbsp;&#x3e;',
    prevText: '&#x3c;',
    nextText: '&#x3e;',
    currentText: 'heute',
    monthNames: ['Januar','Februar','März','April','Mai','Juni',
    'Juli','August','September','Oktober','November','Dezember'],
    monthNamesShort: ['Jan','Feb','Mär','Apr','Mai','Jun',
    'Jul','Aug','Sep','Okt','Nov','Dez'],
    dayNames: ['Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag'],
    dayNamesShort: ['So','Mo','Di','Mi','Do','Fr','Sa'],
    dayNamesMin: ['So','Mo','Di','Mi','Do','Fr','Sa'],
    weekHeader: 'Wo',
    dateFormat: 'dd.mm.yy',
    firstDay: 1,
    isRTL: false,
    numberOfMonths: get_month_view_count(),
    showMonthAfterYear: false,
    yearSuffix: ''};
  $.datepicker.setDefaults($.datepicker.regional['de']);

    var todayObj = new Date();
    var mindateObj = new Date();
    mindateObj.setDate(todayObj.getDate() - 30);
    var maxdateObj = new Date();
    maxdateObj.setDate(todayObj.getDate() + 90);

  // Datepicker
  var dp_wann = $("#wann").datepicker({
        minDate: mindateObj,
        maxDate: maxdateObj,
        showOn: "button",
        buttonImage: "{{ uri static_file="_css/tw2011/img/calendar.png" }}",
        buttonImageOnly: true
  });

  //var dp = $(".datepicker").datepicker({});
  var dp = $("#agenda-datepicker").datepicker({
        minDate: mindateObj,
        maxDate: maxdateObj,
        onSelect: function(dateText, inst) {
            $("#wann-picker").val(dateText);
            switch_calendar();
        },
        showOn: "button",
        buttonImage: "{{ uri static_file="_css/tw2011/img/calendar.png" }}",
        buttonImageOnly: true
  });

    //$("#agenda-datepicker").datepicker("minDate", mindateObj);
    //$("#agenda-datepicker").datepicker("maxDate", maxdateObj);

    //$('.agenda-top a.trigger').toggle();
/*
    $('#datapicker-button').toggle(
        function(){
        },
        function(){
        }
    );
*/
    $('#datapicker-button').click( function() { switch_calendar(); return false; });

    $("#wann").attr('disabled', true);

    $("#wann_middle").click( function () {
        $(".datepicker").datepicker("show");
    });

    //$(".datepicker").datepicker("setDate", new Date());
    var date_ini = new Date();
    if (window.preset_date) {
        var date_ini = new Date(window.preset_date);
    }
    $("#wann").datepicker("setDate", date_ini);
    $("#datapicker-button").datepicker("setDate", date_ini);
    $("#wann-picker").val(format_day_string(date_ini));

    $('#ui-datepicker-div').css('display','none'); // see http://stackoverflow.com/questions/5735888/updating-to-latest-jquery-ui-and-datepicker-is-causing-the-datepicker-to-always-b

    $("#wann").change( function() {
        window.reload();
    });

    //$("#date_picker_button_new").hide();
    $("#top-calendar").hide();
    //$("#date_picker_button_new").show();
    //$("#top-calendar").show();

    //$("#datepicker_single_ul").show();

});

function update_datepicker_button() {
    if ($('#datapicker-button').html() == closing_datepicker_text) {
        return;
    }

    var chosen_date = $("#wann").val();
    var dateObj = $("#wann").datepicker("getDate");
    var display_date = dateObj.getDate() + "." + (dateObj.getMonth() + 1) + "." + dateObj.getFullYear();

    var testObj = new Date();
    var today_str = format_day_string(testObj);
    testObj.setDate(testObj.getDate() + 1);
    var tommorow_str = format_day_string(testObj);

    var day_span = agenda_get_span();

    if (1 == day_span) {
        if (chosen_date == today_str) {
            display_date = 'Heute, ' + dateObj.getDate() + "." + (dateObj.getMonth() + 1) + ".";
        }
        if (chosen_date == tommorow_str) {
            display_date = 'Morgen, ' + dateObj.getDate() + "." + (dateObj.getMonth() + 1) + ".";
        }
    }
    //else if (7 == day_span) {
    //    display_date = "Woche vom " + dateObj.getDate() + "." + (dateObj.getMonth() + 1) + ".";
    //}
    else {
        if (1 < day_span) {
            display_date = dateObj.getDate() + "." + (dateObj.getMonth() + 1) + "." + " bis ";
            dateObj.setTime(dateObj.getTime() + (86400000 * (day_span - 1)));
            display_date += dateObj.getDate() + "." + (dateObj.getMonth() + 1) + ".";
        }
    }

    $('#datapicker-button').html(display_date);
};

function update_datepicker_visible() {
    var dateText = $("#wann").val();
    var dateObj = $("#wann").datepicker("getDate");
    $("#wann-picker").val(dateText);
    $("#agenda-datepicker").datepicker("setDate", dateObj);

    update_datepicker_button();
};

function update_subnav_links(link_date, link_period, link_region) {
    var old_link = "";
    var new_link = "";

    var repl_links = [
        "nav_all_link",
        "nav_kino_link", 
        "nav_theater_link",
        "nav_musik_link",
        "nav_party_link",
        "nav_ausstellung_link",
        "nav_andere_link",
        "nav_restaurants_link"
    ];
    var repl_count = repl_links.length;

    if (/^(\d){4}-(\d){2}-(\d){2}$/.test(link_date)) {
        for (var dind = 0; dind < repl_count; dind++) {
            var d_ident = "#" + repl_links[dind];

            old_link = $(d_ident).attr("href");
            new_link = old_link.replace(/&date=[\d-]+/i, "&date="+link_date);
            new_link = new_link.replace(/\?date=[\d-]+/i, "?date="+link_date);
            $(d_ident).attr("href", new_link);
        }
    }
/*
    if (/^([1-9]){1}$/.test(link_period)) {
        for (var pind = 0; pind < repl_count; pind++) {
            var p_ident = "#" + repl_links[pind];

            old_link = $(p_ident).attr("href");
            new_link = old_link.replace(/&period=[\d]+/i, "&period="+link_period);
            new_link = new_link.replace(/\?period=[\d]+/i, "?period="+link_period);
            $(p_ident).attr("href", new_link);
        }
    }
*/
    if (/^[a-zA-Z-]+$/.test(link_region)) {
        for (var rind = 0; rind < repl_count; rind++) {
            var r_ident = "#" + repl_links[rind];

            old_link = $(r_ident).attr("href");
            new_link = old_link.replace(/&region=[a-zA-Z-]+/i, "&region="+link_region);
            new_link = new_link.replace(/\?region=[a-zA-Z-]+/i, "?region="+link_region);
            $(r_ident).attr("href", new_link);
        }
    }

};

function highlight_agenda_type(ag_type) {
    $(".nav_one").removeClass("active");

    $("#nav_" + ag_type).addClass("active");
};

function format_day_string(dateObj) {
    var day_str = "00" + dateObj.getDate();
    day_str = day_str.substr(day_str.length - 2, 2);
    var month_str = "00" + (dateObj.getMonth() + 1);
    month_str = month_str.substr(month_str.length - 2, 2);

    var dateText = day_str + '.' + month_str + '.' + dateObj.getFullYear();
    return dateText;
};

function agenda_set_tomorrow() {
    var dateObj = new Date();
    dateObj.setDate(dateObj.getDate() + 1);
/*
    var day_str = "00" + dateObj.getDate();
    day_str = day_str.substr(day_str.length - 2, 2);
    var month_str = "00" + (dateObj.getMonth() + 1);
    month_str = month_str.substr(month_str.length - 2, 2);

    var dateText = day_str + '.' + month_str + '.' + dateObj.getFullYear();
*/
    var dateText = format_day_string(dateObj);
    $("#wann-picker").val(dateText);

    $("#agenda-datepicker").datepicker("setDate", dateText);
    //$("#wann").datepicker("setDate", dateText);

    switch_calendar();
};

function agenda_set_today() {
    var dateObj = new Date();
/*
    var day_str = "00" + dateObj.getDate();
    day_str = day_str.substr(day_str.length - 2, 2);
    var month_str = "00" + (dateObj.getMonth() + 1);
    month_str = month_str.substr(month_str.length - 2, 2);

    var dateText = day_str + '.' + month_str + '.' + dateObj.getFullYear();
*/
    var dateText = format_day_string(dateObj);
    $("#wann-picker").val(dateText);

    $("#agenda-datepicker").datepicker("setDate", dateText);
    //$("#wann").datepicker("setDate", dateText);

    switch_calendar();
};

window.agenda_day_span = 1;
window.agenda_day_span_tmp = 1;

function agenda_sync_span() {
    window.agenda_day_span = window.agenda_day_span_tmp;
};

function agenda_get_span(tmp) {
    if (tmp) {
        return window.agenda_day_span_tmp;
    }

    return window.agenda_day_span;
};

function agenda_set_span(days, tmp) {
    var allowed_spans = {1:1, 2:2, 7:7};

    days = parseInt("" + days);
    if (!days in allowed_spans) {
        days = 1;
    }

    $(".agenda_span").removeClass("agenda_span_selected");
    $("#agenda_span_" + days).addClass("agenda_span_selected");

    window.agenda_day_span_tmp = days;
    if (!tmp) {
        window.agenda_day_span = days;
    }

    //alert("" + days + " days");
    return days;
};

window.load_date = function() {
    var link_date = window.used_date("", true);

    if (/^(\d){4}-(\d){2}-(\d){2}$/.test(link_date)) {

        old_link = location.href;
        new_link = old_link.replace(/&date=[\d-]+/i, "&date="+link_date);
        new_link = new_link.replace(/\?date=[\d-]+/i, "?date="+link_date);

        if (-1 == new_link.indexOf("date="+link_date)) {
            var param_conn = "&";
            if (-1 == new_link.indexOf("?")) {
                param_conn = "?";
            }
            new_link += param_conn + "date="+link_date;
        }

        location.href = new_link;

    }
};

window.load_area = function(area) {

    var link_region = $(area).val();

    if (/^[a-zA-Z-]+$/.test(link_region)) {
        old_link = location.href;
        new_link = old_link.replace(/&region=[a-zA-Z-]+/i, "&region="+link_region);
        new_link = new_link.replace(/\?region=[a-zA-Z-]+/i, "?region="+link_region);

        if (-1 == new_link.indexOf("region="+link_region)) {
            var param_conn = "&";
            if (-1 == new_link.indexOf("?")) {
                param_conn = "?";
            }
            new_link += param_conn + "region="+link_region;
        }

        location.href = new_link;
    }

    return true;

};

</script>

        <div class="content-box agenda-top events-top">

            <div id="datepicker_single_ul" style="display:none">
                <div id="wann_middle" class="left">
                        <input type="text" value="" id="wann" class="datepicker_orig" style="width:80px;" />
                </div>
            </div>

            {{ assign var="month_str" $smarty.now|date_format:"%m" }}
            {{ php }}
                $month_str = $template->get_template_vars('month_str');
                $month_str = ltrim($month_str, "0");
                $template->assign('month_str', $month_str);
            {{ /php }}
            <a style="display:none;cursor:pointer;" id="datapicker-button" href="#" class="trigger grey-button arrow">Heute, {{ $smarty.now|date_format:"%e" }}.{{ $month_str }}.</a>
            <div id="top-calendar" class="clearfix" style="width:644px;height:292px;">
            
                <ul class="left" style="margin-top:20px;">
                    <li style="position:absolute;margin-left:0px;"><a href="#" onClick="agenda_set_today(); return false;">Heute</a></li>
                    <li style="position:absolute;margin-left:60px;"><a href="#" onClick="agenda_set_tomorrow(); return false;">Morgen</a></li>
{{ assign var="day_span_notice" "Bitte Zeitspanne auswählen"}}
                    <li style="display:none;position:absolute;margin-left:128px;width:175px;"><div class="agenda_span" style="font-size:20px;margin-top:-4px;" title="{{ $day_span_notice }}">|</div></li>
                    <li style="display:none;position:absolute;margin-left:140px;"><a id="agenda_span_1" class="agenda_span agenda_span_selected" href="#" onClick="agenda_set_span(1, true); return false;" title="{{ $day_span_notice }}">1 Tag</a></li>
                    <li style="display:none;position:absolute;margin-left:183px;"><a id="agenda_span_2" class="agenda_span" href="#" onClick="agenda_set_span(2, true); return false;" title="{{ $day_span_notice }}">2 Tage</a></li>
                    <li style="display:none;position:absolute;margin-left:230px;"><a id="agenda_span_7" class="agenda_span" href="#" onClick="agenda_set_span(7, true); return false;" title="{{ $day_span_notice }}">1 Woche</a></li>

                    <li style="display:none;">
                        <fieldset>
                            <input id="wann-picker" type="text" disabled="disabled" style="background:#ffffff;" />
                        </fieldset>
                    </li>
                    <li style="display:none;">
                        <input type="submit" value="Fertig" class="button" />
                    </li>
                </ul>
            
                <div id="agenda-datepicker" style="position:absolute;margin-left:-10px;margin-top:50px;margin-bottom:8px;"></div>
            
            </div>

            <ul class="nav" id="events_nav">
{{ local }}
{{* agenda *}}
{{ set_current_issue }}
{{ set_section number="71" }}
                <li id="nav_all" class="nav_one active"><a id="nav_all_link" href="{{ uri options="section" }}?type=event&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt">Alles</a></li>
{{* movies *}}
{{ set_current_issue }}
{{ set_section number="72" }}
                <li id="nav_kino" class="nav_one"><a id="nav_kino_link" href="{{ uri options="section" }}?type=kino&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt">Kino</a></li>
{{* events *}}
{{ set_current_issue }}
{{ set_section number="71" }}
                <li id="nav_theater" class="nav_one"><a id="nav_theater_link" href="{{ uri options="section" }}?type=theater&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt" onClick="return load_events('theater');">Theater</a></li>
                <li id="nav_musik" class="nav_one"><a id="nav_musik_link" href="{{ uri options="section" }}?type=concert&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt" onClick="return load_events('musik');">Konzerte</a></li>
                <li id="nav_party" class="nav_one"><a id="nav_party_link" href="{{ uri options="section" }}?type=party&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt" onClick="return load_events('party');">Partys</a></li>
                <li id="nav_ausstellung" class="nav_one"><a id="nav_ausstellung_link" href="{{ uri options="section" }}?type=exhibit&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt" onClick="return load_events('ausstellung');">Ausstellungen</a></li>
                <li id="nav_andere" class="nav_one"><a id="nav_andere_link" href="{{ uri options="section" }}?type=misc&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt" onClick="return load_events('andere');">Diverse</a></li>
{{* restaurants *}}
{{ set_current_issue }}
{{ set_section number="73" }}
                <li id="nav_restaurants" class="nav_one"><a id="nav_restaurants_link" href="{{ uri options="section" }}?type=all&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=kanton-basel-stadt">Restaurants</a></li>
            </ul>
{{ /local }}
        
        </div>
