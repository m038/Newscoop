
<script type="text/javascript">

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

};


function update_type_sel(event_type) {
    $("#sel_was").val(event_type);
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

function load_sel_events(link_type) {

    var link_tag_ids = {
        event: "nav_all_link",
        kino: "nav_kino_link",
        theater: "nav_theater_link",
        concert: "nav_musik_link",
        party: "nav_party_link",
        exhibit: "nav_ausstellung_link",
        misc: "nav_andere_link",
        restaurants: "nav_restaurants_link"
    };

    if (link_type in link_tag_ids) {
        var new_link = $("#" + link_tag_ids[link_type]).attr("href");
        location.href = new_link;
    }

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


window.cinema_hash = {};

function get_cinema(cinema_id) {
    if (!window.cinemas) {
        return null;
    }
    var cinema_list = window.cinemas;

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

function get_display_date(std_date) {
    var display_date = std_date;
    var date_arr = std_date.split("-");

    if (3 == date_arr.length) {
        display_date = "";
        var disp_day = date_arr[2];
        if ("0" == disp_day.substr(0, 1)) {
            disp_day = disp_day.substr(1);
        }
        var disp_month = date_arr[1];
        if ("0" == disp_month.substr(0, 1)) {
            disp_month = disp_month.substr(1);
        }
        var disp_year = date_arr[0];

        display_date = disp_day + "." + disp_month + "." + disp_year;
    }

    return display_date;
};

</script>
