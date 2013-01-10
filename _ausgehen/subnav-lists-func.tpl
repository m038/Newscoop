
<script type="text/javascript">

function get_month_view_count() {
    var month_num = 3;
    var doc_width = $(document).width();
    if (1100 >= doc_width) {
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
    update_datepicker_visible();
    $('#datapicker-button').addClass('active');
    $('#top-calendar').show();
    $('.agenda-top .overlay').fadeIn(500);
};

function close_calendar() {
    var to_reload = false;

    $('#datapicker-button').removeClass('active');

    $('#top-calendar').hide();
    $('.agenda-top .overlay').fadeOut(500);

    $('#datapicker-button').html('');
    update_datepicker_button();

    var dateText = $("#wann-picker").val();
    if ($("#wann").val() != dateText) {
        to_reload = true;
    }
    $("#wann").datepicker("setDate", dateText);
    $("#wann").val(dateText);

    if (to_reload) {
        window.load_date();
        return;
    }

};

/* German initialisation for the jQuery UI date picker plugin. */
/* Written by Milian Wolff (mail@milianw.de). */
$(document).ready(function() {

    $.datepicker.regional['de'] = {
        closeText: 'schließen',
        prevText: '&#x3c;',
        nextText: '&#x3e;',
        currentText: 'heute',
        monthNames: ['Januar','Februar','März','April','Mai','Juni', 'Juli','August','September','Oktober','November','Dezember'],
        monthNamesShort: ['Jan','Feb','Mär','Apr','Mai','Jun', 'Jul','Aug','Sep','Okt','Nov','Dez'],
        dayNames: ['Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag'],
        dayNamesShort: ['So','Mo','Di','Mi','Do','Fr','Sa'],
        dayNamesMin: ['So','Mo','Di','Mi','Do','Fr','Sa'],
        weekHeader: 'Wo',
        dateFormat: 'dd.mm.yy',
        firstDay: 1,
        isRTL: false,
        numberOfMonths: get_month_view_count(),
        showMonthAfterYear: false,
        yearSuffix: ''
    };
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
    });

    var dp = $("#agenda-datepicker").datepicker({
        minDate: mindateObj,
        maxDate: maxdateObj,
        onSelect: function(dateText, inst) {
            $("#wann-picker").val(dateText);
            switch_calendar();
        }
    });

    $('#datapicker-button').click( function() { switch_calendar(); return false; });

    $("#wann").attr('disabled', true);

    $("#wann_middle").click( function () {
        $(".datepicker").datepicker("show");
    });

    var date_ini = new Date();
    if (window.preset_date) {
        var date_ini = new Date(window.preset_date);
    }
    $("#wann").datepicker("setDate", date_ini);
    $("#datapicker-button").datepicker("setDate", date_ini);
    $("#wann-picker").val(format_day_string(date_ini));

    $('#ui-datepicker-div').css('display','none'); // see http://stackoverflow.com/questions/5735888/updating-to-latest-jquery-ui-and-datepicker-is-causing-the-datepicker-to-always-b

    $("#top-calendar").hide();

});

function update_datepicker_button() {

    var chosen_date = $("#wann").val();
    var dateObj = $("#wann").datepicker("getDate");
    var display_date = dateObj.getDate() + "." + (dateObj.getMonth() + 1) + "." + dateObj.getFullYear();

    var testObj = new Date();
    var today_str = format_day_string(testObj);
    testObj.setDate(testObj.getDate() + 1);
    var tommorow_str = format_day_string(testObj);

    if (chosen_date == today_str) {
        display_date = 'Heute, ' + dateObj.getDate() + "." + (dateObj.getMonth() + 1) + ".";
    }
    if (chosen_date == tommorow_str) {
        display_date = 'Morgen, ' + dateObj.getDate() + "." + (dateObj.getMonth() + 1) + ".";
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

    var dateText = format_day_string(dateObj);
    $("#wann-picker").val(dateText);

    $("#agenda-datepicker").datepicker("setDate", dateText);

    switch_calendar();
};

function agenda_set_today() {
    var dateObj = new Date();
    var dateText = format_day_string(dateObj);
    $("#wann-picker").val(dateText);

    $("#agenda-datepicker").datepicker("setDate", dateText);

    switch_calendar();
};

</script>
