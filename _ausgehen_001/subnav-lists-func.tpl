
<script type="text/javascript">

var closing_datepicker_text = 'Fertig';

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
        maxDate: maxdateObj
        //showOn: "button",
        //buttonImage: "{{ uri static_file="_css/tw2011/img/calendar.png" }}",
        //buttonImageOnly: true
  });

  //var dp = $(".datepicker").datepicker({});
  var dp = $("#agenda-datepicker").datepicker({
        minDate: mindateObj,
        maxDate: maxdateObj,
        onSelect: function(dateText, inst) {
            $("#wann-picker").val(dateText);
            switch_calendar();
        }
        //showOn: "button",
        //buttonImage: "{{ uri static_file="_css/tw2011/img/calendar.png" }}",
        //buttonImageOnly: true
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

</script>
