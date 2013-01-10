{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_ausgehen/api-teaser.tpl" }}


{{ assign var="event_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
{{ if $smarty.get.date }}
    {{ assign var="event_date" value=$smarty.get.date|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}
{{ assign var="event_region" value="region-zentralschweiz" }}
{{ if $smarty.get.region }}
    {{ assign var="event_region" value=$smarty.get.region|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

<script type="text/javascript">
window.preset_date = "{{ $event_date }}";

$(document).ready(function() {
    $("#date_picker_button_new").hide();
    $("#datapicker-button").show();
    $("#top-calendar").hide();

    $("#datepicker_single_ul").hide();

    $("#wann").datepicker("setDate", new Date("{{ $cinema_date }}"));
    setTimeout("update_datepicker_button(); update_datepicker_visible();", 10);

});


$(document).ready(function() {
    update_type_sel("restaurants");
    outline_type("restaurants");
    update_subnav_links("{{ $event_date }}", 1, "{{ $event_region }}");

    if ("{{ $event_region }}") {
        $("#wo").val("{{ $event_region }}");
    }

    show_cuisines();
});

</script>



<script type="text/javascript">
window.agenda_has_select_tags = true;
window.agenda_has_date_picker = true;
</script>

{{ php }}
function get_kueche_list() {
    return array(
        'restaurant_cuisine' => array('label' => 'all', 'display' => 'Alle', 'topic' => 'Restaurant: Küche',),
        //'arabic_cuisine' => array('label' => 'arabic', 'display' => 'Arabisch', 'topic' => 'Küche:\\ Arabisch',), // id 2
        //'american_cuisine' => array('label' => 'american', 'display' => 'Amerikanisch', 'topic' => 'Küche:\\ Amerikanisch',), // id 3
        'italian_cuisine' => array('label' => 'italian', 'display' => 'Italienisch', 'topic' => 'Küche:\\ Italienisch',), // id 4
        'spanish_cuisine' => array('label' => 'spanish', 'display' => 'Spanisch', 'topic' => 'Küche:\\ Spanisch',), // id 5
        'turkish_cuisine' => array('label' => 'turkish', 'display' => 'Türkisch', 'topic' => 'Küche:\\ Türkisch',), // id 6
        'asiatic_cuisine' => array('label' => 'asiatic', 'display' => 'Asiatisch', 'topic' => 'Küche:\\ Asiatisch',), // id 7
        'chinese_cuisine' => array('label' => 'chinese', 'display' => 'Chinesisch', 'topic' => 'Küche:\\ Chinesisch',), // id 8
        'fish_cuisine' => array('label' => 'fish', 'display' => 'Fisch', 'topic' => 'Küche:\\ Fisch',), // id 10
        'french_cuisine' => array('label' => 'french', 'display' => 'Französisch', 'topic' => 'Küche:\\ Französisch',), // id 11
        'gourmet_cuisine' => array('label' => 'gourmet', 'display' => 'Gourmet', 'topic' => 'Küche:\\ Gourmet',), // id 12
        'greek_cuisine' => array('label' => 'greek', 'display' => 'Griechisch', 'topic' => 'Küche:\\ Griechisch',), // id 13
        //'grills_cuisine' => array('label' => 'grills', 'display' => 'Grilladen', 'topic' => 'Küche:\\ Grilladen',), // id 14
        'good_style_cuisine' => array('label' => 'good_style', 'display' => 'Gut bürgerlich', 'topic' => 'Küche:\\ Gut\\ bürgerlich',), // id 15
        'hamburger_cuisine' => array('label' => 'hamburger', 'display' => 'Hamburger', 'topic' => 'Küche:\\ Hamburger',), // id 16
        'indian_cuisine' => array('label' => 'indian', 'display' => 'Indisch', 'topic' => 'Küche:\\ Indisch',), // id 17
        'indonesian_cuisine' => array('label' => 'indonesian', 'display' => 'Indonesisch', 'topic' => 'Küche:\\ Indonesisch',), // id 18
        //'international_cuisine' => array('label' => 'international', 'display' => 'International', 'topic' => 'Küche:\\ International',), // id 19
        'japanese_cuisine' => array('label' => 'japanese', 'display' => 'Japanisch', 'topic' => 'Küche:\\ Japanisch',), // id 21
        'creole_caribbean_cuisine' => array('label' => 'creole_caribbean', 'display' => 'Kreolisch (Karibik)', 'topic' => 'Küche:\\ Kreolisch\\ (Karibik)',), // id 23
        'korean_cuisine' => array('label' => 'korean', 'display' => 'Koreanisch', 'topic' => 'Küche:\\ Koreanisch',), // id 24
        //'malay_cuisine' => array('label' => 'malay', 'display' => 'Malayisch', 'topic' => 'Küche:\\ Malayisch',), // id 25
        //'mediterranean_cuisine' => array('label' => 'mediterranean', 'display' => 'Mediterran', 'topic' => 'Küche:\\ Mediterran',), // id 26
        'mexican_cuisine' => array('label' => 'mexican', 'display' => 'Mexikanisch', 'topic' => 'Küche:\\ Mexikanisch',), // id 27
        'mongolian_cuisine' => array('label' => 'mongolian', 'display' => 'Mongolisch', 'topic' => 'Küche:\\ Mongolisch',), // id 28
        //'oriental_cuisine' => array('label' => 'oriental', 'display' => 'Orientalisch', 'topic' => 'Küche:\\ Orientalisch',), // id 29
        'pizzeria_cuisine' => array('label' => 'pizzeria', 'display' => 'Pizzeria', 'topic' => 'Küche:\\ Pizzeria',), // id 31
        'sushi_cuisine' => array('label' => 'sushi', 'display' => 'Sushi', 'topic' => 'Küche:\\ Sushi',), // id 32
        //'swiss_cuisine' => array('label' => 'swiss', 'display' => 'Schweizerisch', 'topic' => 'Küche:\\ Schweizerisch',), // id 34
        'thai_cuisine' => array('label' => 'thai', 'display' => 'Thailändisch', 'topic' => 'Küche:\\ Thailändisch',), // id 35
        'vietnamese_cuisine' => array('label' => 'vietnamese', 'display' => 'Vietnamesisch', 'topic' => 'Küche:\\ Vietnamesisch',), // id 37
        //'austrian_cuisine' => array('label' => 'austrian', 'display' => 'Österreichisch', 'topic' => 'Küche:\\ Österreichisch',), // id 38
        //'exotic_cuisine' => array('label' => 'exotic', 'display' => 'Exotisch', 'topic' => 'Küche:\\ Exotisch',), // id 40
        //'traditional_cuisine' => array('label' => 'traditional', 'display' => 'Traditionell', 'topic' => 'Küche:\\ Traditionell',), // id 41
        'moroccan_cuisine' => array('label' => 'moroccan', 'display' => 'Marokkanisch', 'topic' => 'Küche:\\ Marokkanisch',), // id 42
        'brasserie_cuisine' => array('label' => 'brasserie', 'display' => 'Brasserie', 'topic' => 'Küche:\\ Brasserie',), // id 43
        'portuguese_cuisine' => array('label' => 'portuguese', 'display' => 'Portugiesisch', 'topic' => 'Küche:\\ Portugiesisch',), // id 44
        //'walser_specialties_cuisine' => array('label' => 'walser_specialties', 'display' => 'Walliser-Spezialitäten', 'topic' => 'Küche:\\ Walliser-Spezialitäten',), // id 45
        'vegetarian_cuisine' => array('label' => 'vegetarian', 'display' => 'Vegetarisch', 'topic' => 'Küche:\\ Vegetarisch',), // id 46
        'argentine_cuisine' => array('label' => 'argentine', 'display' => 'Argentinisch', 'topic' => 'Küche:\\ Argentinisch',), // id 47
        //'gratin_cuisine' => array('label' => 'gratin', 'display' => 'Gratin', 'topic' => 'Küche:\\ Gratin',), // id 48
        //'cold_and_hot_sandwiches_cuisine' => array('label' => 'cold_and_hot_sandwiches', 'display' => 'Cold and Hot Sandwiches', 'topic' => 'Küche:\\ Cold\\ and\\ Hot\\ Sandwiches',), // id 49
        'pies_and_biscuits_cuisine' => array('label' => 'pies_and_biscuits', 'display' => 'Kuchen und Gebäck', 'topic' => 'Küche:\\ Kuchen\\ und\\ Gebäck',), // id 51
        //'bistro_cuisine' => array('label' => 'bistro', 'display' => 'Bistroküche', 'topic' => 'Küche:\\ Bistroküche',), // id 52
        'balkan_cuisine' => array('label' => 'balkan', 'display' => 'Balkan', 'topic' => 'Küche:\\ Balkan',), // id 53
        //'seasonal_cuisine' => array('label' => 'seasonal', 'display' => 'Saisonal', 'topic' => 'Küche:\\ Saisonal',), // id 54
        //'steakhouse_cuisine' => array('label' => 'steakhouse', 'display' => 'Steakhouse', 'topic' => 'Küche:\\ Steakhouse',), // id 55
        //'caribbean_cuisine' => array('label' => 'caribbean', 'display' => 'Karibisch', 'topic' => 'Küche:\\ Karibisch',), // id 57
        //'steak_cuisine' => array('label' => 'steak', 'display' => 'Steak', 'topic' => 'Küche:\\ Steak',), // id 58
        //'classic_cuisine' => array('label' => 'classic', 'display' => 'Klassiker', 'topic' => 'Küche:\\ Klassiker',), // id 59
        //'ottoman_cuisine' => array('label' => 'ottoman', 'display' => 'Osmanisch', 'topic' => 'Küche:\\ Osmanisch',), // id 60
        //'modern_cuisine' => array('label' => 'modern', 'display' => 'Modern', 'topic' => 'Küche:\\ Modern',), // id 61
        'fusion_cuisine' => array('label' => 'fusion', 'display' => 'Fusion', 'topic' => 'Küche:\\ Fusion',), // id 62
        //'american_restaurant_cuisine' => array('label' => 'american_restaurant', 'display' => 'American Restaurant', 'topic' => 'Küche:\\ American\\ Restaurant',), // id 63
        //'caribbean_bar_cuisine' => array('label' => 'caribbean_bar', 'display' => 'Caribbean Bar', 'topic' => 'Küche:\\ Caribbean\\ Bar',), // id 64
        //'tex_mex_cuisine' => array('label' => 'tex_mex', 'display' => 'Tex-Mex', 'topic' => 'Küche:\\ Tex-Mex',), // id 65
        //'rustic_cuisine' => array('label' => 'rustic', 'display' => 'Rustikal', 'topic' => 'Küche:\\ Rustikal',), // id 66
        'hungarian_cuisine' => array('label' => 'hungarian', 'display' => 'Ungarisch', 'topic' => 'Küche:\\ Ungarisch',), // id 67
        //'fondue_cuisine' => array('label' => 'fondue', 'display' => 'Fondue', 'topic' => 'Küche:\\ Fondue',), // id 68
        //'bavarian_cuisine' => array('label' => 'bavarian', 'display' => 'Bayerisch', 'topic' => 'Küche:\\ Bayerisch',), // id 69
        'regional_cuisine' => array('label' => 'regional', 'display' => 'Regional', 'topic' => 'Küche:\\ Regional',), // id 70
        'snacks_cuisine' => array('label' => 'snacks', 'display' => 'Snacks', 'topic' => 'Küche:\\ Snacks',), // id 71
        'lebanese_cuisine' => array('label' => 'lebanese', 'display' => 'Libanesisch', 'topic' => 'Küche:\\ Libanesisch',), // id 72
        'other' => array('label' => 'other', 'display' => 'Andere', 'topic' => 'Küche:\\ Andere',),
    );
}

function get_kueche_list_reverted() {
    return array(
        'Italienisch' => array('label' => 'italian', 'display' => 'Italienisch', 'topic' => 'Küche:\\ Italienisch',), // id 4
        'Spanisch' => array('label' => 'spanish', 'display' => 'Spanisch', 'topic' => 'Küche:\\ Spanisch',), // id 5
        'Türkisch' => array('label' => 'turkish', 'display' => 'Türkisch', 'topic' => 'Küche:\\ Türkisch',), // id 6
        'Asiatisch' => array('label' => 'asiatic', 'display' => 'Asiatisch', 'topic' => 'Küche:\\ Asiatisch',), // id 7
        'Chinesisch' => array('label' => 'chinese', 'display' => 'Chinesisch', 'topic' => 'Küche:\\ Chinesisch',), // id 8
        'Fisch' => array('label' => 'fish', 'display' => 'Fisch', 'topic' => 'Küche:\\ Fisch',), // id 10
        'Französisch' => array('label' => 'french', 'display' => 'Französisch', 'topic' => 'Küche:\\ Französisch',), // id 11
        'Gourmet' => array('label' => 'gourmet', 'display' => 'Gourmet', 'topic' => 'Küche:\\ Gourmet',), // id 12
        'Griechisch' => array('label' => 'greek', 'display' => 'Griechisch', 'topic' => 'Küche:\\ Griechisch',), // id 13
        'Gut bürgerlich' => array('label' => 'good_style', 'display' => 'Gut bürgerlich', 'topic' => 'Küche:\\ Gut\\ bürgerlich',), // id 15
        'Hamburger' => array('label' => 'hamburger', 'display' => 'Hamburger', 'topic' => 'Küche:\\ Hamburger',), // id 16
        'Indisch' => array('label' => 'indian', 'display' => 'Indisch', 'topic' => 'Küche:\\ Indisch',), // id 17
        'Indonesisch' => array('label' => 'indonesian', 'display' => 'Indonesisch', 'topic' => 'Küche:\\ Indonesisch',), // id 18
        'Japanisch' => array('label' => 'japanese', 'display' => 'Japanisch', 'topic' => 'Küche:\\ Japanisch',), // id 21
        'Kreolisch (Karibik)' => array('label' => 'creole_caribbean', 'display' => 'Kreolisch (Karibik)', 'topic' => 'Küche:\\ Kreolisch\\ (Karibik)',), // id 23
        'Koreanisch' => array('label' => 'korean', 'display' => 'Koreanisch', 'topic' => 'Küche:\\ Koreanisch',), // id 24
        'Mexikanisch' => array('label' => 'mexican', 'display' => 'Mexikanisch', 'topic' => 'Küche:\\ Mexikanisch',), // id 27
        'Mongolisch' => array('label' => 'mongolian', 'display' => 'Mongolisch', 'topic' => 'Küche:\\ Mongolisch',), // id 28
        'Pizzeria' => array('label' => 'pizzeria', 'display' => 'Pizzeria', 'topic' => 'Küche:\\ Pizzeria',), // id 31
        'Sushi' => array('label' => 'sushi', 'display' => 'Sushi', 'topic' => 'Küche:\\ Sushi',), // id 32
        'Thailändisch' => array('label' => 'thai', 'display' => 'Thailändisch', 'topic' => 'Küche:\\ Thailändisch',), // id 35
        'Vietnamesisch' => array('label' => 'vietnamese', 'display' => 'Vietnamesisch', 'topic' => 'Küche:\\ Vietnamesisch',), // id 37
        'Marokkanisch' => array('label' => 'moroccan', 'display' => 'Marokkanisch', 'topic' => 'Küche:\\ Marokkanisch',), // id 42
        'Brasserie' => array('label' => 'brasserie', 'display' => 'Brasserie', 'topic' => 'Küche:\\ Brasserie',), // id 43
        'Portugiesisch' => array('label' => 'portuguese', 'display' => 'Portugiesisch', 'topic' => 'Küche:\\ Portugiesisch',), // id 44
        'Vegetarisch' => array('label' => 'vegetarian', 'display' => 'Vegetarisch', 'topic' => 'Küche:\\ Vegetarisch',), // id 46
        'Argentinisch' => array('label' => 'argentine', 'display' => 'Argentinisch', 'topic' => 'Küche:\\ Argentinisch',), // id 47
        'Kuchen und Gebäck' => array('label' => 'pies_and_biscuits', 'display' => 'Kuchen und Gebäck', 'topic' => 'Küche:\\ Kuchen\\ und\\ Gebäck',), // id 51
        'Balkan' => array('label' => 'balkan', 'display' => 'Balkan', 'topic' => 'Küche:\\ Balkan',), // id 53
        'Fusion' => array('label' => 'fusion', 'display' => 'Fusion', 'topic' => 'Küche:\\ Fusion',), // id 62
        'Ungarisch' => array('label' => 'hungarian', 'display' => 'Ungarisch', 'topic' => 'Küche:\\ Ungarisch',), // id 67
        'Regional' => array('label' => 'regional', 'display' => 'Regional', 'topic' => 'Küche:\\ Regional',), // id 70
        'Snacks' => array('label' => 'snacks', 'display' => 'Snacks', 'topic' => 'Küche:\\ Snacks',), // id 71
        'Libanesisch' => array('label' => 'lebanese', 'display' => 'Libanesisch', 'topic' => 'Küche:\\ Libanesisch',), // id 72
        'Andere' => array('label' => 'other', 'display' => 'Andere', 'topic' => 'Küche:\\ Andere',),
    );
}

$kueche_list = get_kueche_list();
$template->assign('kueche_list',$kueche_list);

function get_current_cuisine_classes($topic_list) {

    $used_cuisine_classes = '';

    $cuisine_topics = get_kueche_list_reverted();

    if (empty($topic_list)) {
        $topic_list = array();
    }

    foreach($topic_list as $one_topic) {
        $cur_name = (string) $one_topic;
        if ("Küche: " == substr($cur_name, 0, strlen("Küche: "))) {
            $cur_cuisine = substr($cur_name, strlen("Küche: "));
            if (array_key_exists($cur_cuisine, $cuisine_topics)) {
                $cur_class_name = 'cuisine_' . $cuisine_topics[$cur_cuisine][label];
                $used_cuisine_classes .= ' ' . $cur_class_name;
            }
        }
    }

    return $used_cuisine_classes;
}


{{ /php }}

<script type="text/javascript">

function show_cuisines_single(sel_cuisine) {
    $(".kueche_check").each(function(ind_elm, elm) {
        $(elm).prop("checked", false);

        var cur_name = $(elm).attr("name");
        if (cur_name == sel_cuisine) {
            $(elm).prop("checked", true);
        };
    });

    $(".kueche_check").button( "refresh" );

    show_cuisines();
};

function update_menu_drop(rank) {
    var max_upd = 20;

    if (!rank) {
        rank = 0;
    }
    rank += 1;
    if (rank > max_upd) {
        return;
    }

    try {
        $("#cuisine_dropdown").dropdownized({fixed:true,reload:true});
    } catch (e) {
        setTimeout('update_menu_drop(' + rank + ');', 1000);
    }
};

function update_cuisines_single(one_cuisine) {
    $("#cuisine_dropdown").val(one_cuisine);
    setTimeout('update_menu_drop(0);', 200);
};

window.with_cuisine_list = true;

function show_cuisines() {

	var art_sign = 2;
	var win_width = $(window).width();
	if ((win_width < 1100) && (win_width >= 768)) {
		art_sign = 3;
	}

    $("#loading_empty").hide();

    var checked_cuisines = [];

    $(".kueche_check:checked").each(function(ind_elm, elm) {
        var cur_name = $(elm).attr("name");
        checked_cuisines.push(cur_name);
    });

    var checked_count = checked_cuisines.length;

    $(".rest_all").hide();
    $(".rest_all").removeClass("article_active");
    $(".rest_all").removeClass("article_odd");

    if (1 <= checked_count) {
        update_cuisines_single(checked_cuisines[0]);
    }
    else {
        update_cuisines_single('all');
    }

    if (0 == checked_count) {
        $(".rest_all").addClass("article_active");
    }
    else {
        for (var cind = 0; cind < checked_count; cind++) {
            var cur_class = "cuisine_" + checked_cuisines[cind];
            $("." + cur_class).addClass("article_active");
        }
    }

    var some_rest_shown = false;
    $(".article_active").each(function(ind_elm, elm) {
        some_rest_shown = true;
        if (0 == (ind_elm % art_sign)) {
            $(elm).addClass("article_odd");
        }
    });

    $(".article_active").show();

    if (!some_rest_shown) {
        $("#loading_empty").show();
    }
};

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

            {{ include file="_ausgehen/subnav-lists-side.tpl" list_type="restaurants" cuisin_list=$kueche_list }}


{{ assign var="usedate" $smarty.now|camp_date_format:"%Y-%m-%d" }}
{{ assign var="usedate_link" $usedate }}
{{ if !empty($smarty.get.date) }}
    {{ assign var="usedate" $smarty.get.date|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
{{ /if }}

{{ assign var="usedate_test" $usedate|regex_replace:"/(\d){4}-(\d){2}-(\d){2}/":"ok" }}
{{ if "ok" != $usedate }}
    {{ if "ok" == $usedate_test }}
        {{ assign var="usedate_link" $usedate }}
    {{ /if }}
{{ /if }}

{{ assign var="useperiod" "1" }}
{{ assign var="useperiod_link" "1" }}

{{ php }}
function create_end_date($start_date, $period) {
    $period = (0 + $period) - 1;
    if (0 > $period) {
        $period = 0;
    }

    if (0 == $period) {
        return $start_date;
    }

    $time_val = strtotime($start_date) + ($period * 86400);
    $end_date = date('Y-m-d', $time_val);

    return $end_date;
}
{{ /php }}

{{ assign var="condate" ""}}
{{ assign var="muldate" ""}}
{{ if !empty($usedate) }}
    {{ assign var="enddate" $usedate }}
    {{ php }}
        $usedate = $template->get_template_vars('usedate');
        $useperiod = $template->get_template_vars('useperiod');
        $enddate = create_end_date($usedate, $useperiod);
        $template->assign('enddate',$enddate);
    {{ /php }}

    {{ assign var="condate" "date is $usedate"}}
    {{ assign var="muldate" "start_date: $usedate, end_date: $enddate"}}
{{ /if }}

{{ assign var="usetype" "" }}
{{ assign var="usetype_link" "all" }}
{{ if !empty($smarty.get.type) }}
    {{ assign var="usetype_spec" $smarty.get.type|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}

    {{ if $usetype_spec ne 'all' }}
    {{ foreach from=$kueche_list key=kueche_key item=kueche_info }}
        {{ if $kueche_info.label eq $usetype_spec }}
            {{ assign var="usetype" $kueche_info.topic }}
            {{ assign var="usetype_link" $usetype_spec }}
        {{ /if }}
    {{ /foreach }}
    {{ /if }}

{{ /if }}
{{ assign var="usetype" "" }}
{{ assign var="usetype_link" "all" }}


{{ assign var="useregion" "Region\\ Zentralschweiz" }}
{{ assign var="linkregion" "region-zentralschweiz" }}
{{ if !empty($smarty.get.region) }}
    {{ assign var="useregion_spec" $smarty.get.region|replace:" ":""|replace:'"':""|replace:"'":""|replace:"<":""|replace:">":""|replace:"\\":"" }}
    {{ if "kanton-luzern" eq $useregion_spec }}
        {{ assign var="useregion" "Kanton\\ Luzern" }}
        {{ assign var="linkregion" "kanton-luzern" }}
    {{ elseif "kanton-nidwalden" eq $useregion_spec }}
        {{ assign var="useregion" "Kanton\\ Nidwalden" }}
        {{ assign var="linkregion" "kanton-nidwalden" }}
    {{ elseif "kanton-obwalden" eq $useregion_spec }}
        {{ assign var="useregion" "Kanton\\ Obwalden" }}
        {{ assign var="linkregion" "kanton-obwalden" }}
    {{ elseif "kanton-schwyz" eq $useregion_spec }}
        {{ assign var="useregion" "Kanton\\ Schwyz" }}
        {{ assign var="linkregion" "kanton-schwyz" }}
    {{ elseif "kanton-uri" eq $useregion_spec }}
        {{ assign var="useregion" "Kanton\\ Uri" }}
        {{ assign var="linkregion" "kanton-uri" }}
    {{ elseif "kanton-zug" eq $useregion_spec }}
        {{ assign var="useregion" "Kanton\\ Zug" }}
        {{ assign var="linkregion" "kanton-zug" }}
    {{ /if }}
{{ /if }}

{{ assign var="contopic_type" ""}}
{{ assign var="contopic_region" ""}}
{{ assign var="topic_suffix" ":de"}}

{{ if !empty($usetype) }}
    {{ assign var="contopic_type" "topic is $usetype$topic_suffix"}}
{{ /if }}

{{ if !empty($useregion) }}
    {{ assign var="contopic_region" "topic is $useregion$topic_suffix"}}
{{ /if }}

{{ assign var="colcount" 10 }}

{{ php }}

function take_body_list($p_list, $p_separator)
{
    $res_list = array();

    $list_text = strip_tags(str_replace(array('<'), array("\n<"), $p_list));
    foreach (explode("\n", $list_text) as $one_list_line_str) {
        $one_list_line_str = trim($one_list_line_str);
        if (empty($one_list_line_str)) {
            continue;
        }
        $res_list[] = $one_list_line_str;
    }

    return implode($p_separator, $res_list);
}

function get_rest_days_notice($date_time_text, $usedate, $useperiod)
{
    $useperiod = 0 + intval('' . $useperiod);
    if (empty($useperiod) || (0 >= $useperiod)) {
        $useperiod = 1;
    }
    if (7 < $useperiod) {
        $useperiod = 7;
    }

    // notices:
    // 1 day: holiday/closed/_
    // 2-6 days: holiday_all_days/closed_all_days/_
    // 7 days: holiday_whole_week/_

    $usedate_timestamp = strtotime($usedate . ' ' . '12:00:00' . ' ' . 'GMT'); // we need just to take week day
    if (!$usedate_timestamp) {
        return '';
    }
    $enddate_timestamp = $usedate_timestamp + (86400 * ($useperiod - 1));
    $enddate = gmdate('Y-m-d', $enddate_timestamp);

    $use_week_day_names = array('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun');
    $use_week_day_rank = gmdate('N', $usedate_timestamp) - 1;

    $use_week_days_arr = array();
    $cur_week_day_rank = $use_week_day_rank;
    $end_week_day_rank = (gmdate('N', $enddate_timestamp) - 1) % 7;
    $cur_step = 0;
    while ($cur_step < $useperiod) {
        $cur_timestamp = $usedate_timestamp + (86400 * $cur_step);
        $cur_week_day_name = strtolower($use_week_day_names[$cur_week_day_rank]);
        if (!isset($use_week_days_arr[$cur_week_day_name])) {
            $use_week_days_arr[$cur_week_day_name] = array();
        }
        $use_week_days_arr[$cur_week_day_name][] = gmdate('Y-m-d', $cur_timestamp);
        $cur_week_day_rank = ($cur_week_day_rank + 1) % 7;
        $cur_step += 1;
    }

    $next_line_time = false;
    $next_line_holiday_start = false;
    $next_line_holiday_end = false;
    $found_open = false;
    $after_holiday_start = false;
    $before_holiday_end = false;
    $holiday_start_date = '';
    $holiday_start_str = '';
    $holiday_end_date = '';
    $holiday_end_str = '';
    $some_info = false;

    $found_open_days = array();
    $current_day_dates = null;

    $date_time_text = strip_tags(str_replace(array('<'), array("\n<"), $date_time_text));
    foreach (explode("\n", $date_time_text) as $one_date_time_str) {
        $one_date_time_str = trim($one_date_time_str);
        if (empty($one_date_time_str)) {
            continue;
        }

        if (isset($use_week_days_arr[strtolower($one_date_time_str)])) {
            $current_day_dates = $use_week_days_arr[strtolower($one_date_time_str)];
            $next_line_time = true;
            $next_line_holiday_start = false;
            $next_line_holiday_end = false;
            continue;
        }

        if (strtolower($one_date_time_str) == 'holiday') {
            $next_line_time = false;
            $next_line_holiday_start = true;
            $next_line_holiday_end = false;
            continue;
        }

        if ($next_line_time) {
            $next_line_time = false;

            $matches = array();
            if (preg_match('/(\d{2}):(\d{2})[\s]*-[\s]*(\d{2}):(\d{2})/', $one_date_time_str, $matches) || ('open' == $one_date_time_str)) {
                $some_info = true;
                $found_open = true;
                $found_open_days = array_merge($found_open_days, $current_day_dates);
                continue;
            }
        }

        if ($next_line_holiday_start) {
            $next_line_holiday_start = false;

            $matches = array();
            if (preg_match('/(\d{4})-(\d{2})-(\d{2})/', $one_date_time_str, $matches)) {
                $next_line_holiday_end = true;

                $holiday_start_date = '' . $matches[1] . '-' . $matches[2] . '-' . $matches[3];
                $holiday_start_str = '' . ltrim($matches[3], '0') . '.' . ltrim($matches[2], '0') . '.';

                if ($matches[0] <= $usedate) {
                    $after_holiday_start = true;
                }

                continue;
            }
        }

        if ($next_line_holiday_end) {
            $next_line_holiday_end = false;

            $matches = array();
            if (preg_match('/(\d{4})-(\d{2})-(\d{2})/', $one_date_time_str, $matches)) {

                $holiday_end_date = '' . $matches[1] . '-' . $matches[2] . '-' . $matches[3];
                $holiday_end_str = '' . ltrim($matches[3], '0') . '.' . ltrim($matches[2], '0') . '.';

                if ($matches[0] >= $enddate) {
                    $before_holiday_end = true;
                }

                continue;
            }
        }

        if (!in_array(ucfirst($one_date_time_str), $use_week_day_names)) {
            $some_info = true;
        }

    }

    if ($after_holiday_start && $before_holiday_end) {
        return 'Betriebsferien bis ' . $holiday_end_str;
    }

    if (!$some_info) {
        return 'Unbekannte Öffnungszeiten';
    }

    if ($after_holiday_start && ($holiday_end_date >= $usedate)) {
        $open_inside = false;
        foreach ($found_open_days as $one_open_day) {
            if ($one_open_day > $holiday_end_date) {
                $open_inside = true;
                break;
            }
        }
        if (!$open_inside) {
            return 'Betriebsferien bis ' . $holiday_end_str;
        }
    }

    if ($before_holiday_end && ($holiday_start_date <= $enddate)) {
        $open_inside = false;
        foreach ($found_open_days as $one_open_day) {
            if ($one_open_day < $holiday_start_date) {
                $open_inside = true;
                break;
            }
        }
        if (!$open_inside) {
            return 'Betriebsferien bis ' . $holiday_end_str;
        }
    }

    if ($some_info && (!$found_open) && (7 != $useperiod)) {
        if (1 == $useperiod) {
            return 'An ausgewähltem Tag geschlossen';
        }
        else {
            return 'An ausgewählten Tagen geschlossen';
        }
    }

    return '';
}

{{ /php }}


            <div id="restaurant_holder" class="main">

                <div id="restaurant_list" class="restaurant-list clearfix">

{{ assign var="rest_rank" 0 }}
{{ assign var="is_odd" 0 }}
{{ assign var="max_text_len" 250 }}

{{ assign var="rests_order_alphabetical" "" }}
{{ assign var="rests_order_rating" "" }}
{{ php }}
    $template->assign('rests_order_keyword',array());
    $template->assign('rests_order_ranking',array());
{{ /php }}

{{ assign var=today_date $smarty.now|date_format:"%Y-%m-%d" }}
{{ assign var=condate "" }}
{{ assign var=condate_real "publish_date is $today_date" }}
{{ list_articles columns="$colcount" ignore_issue="true" ignore_section="true" constraints="$condate $contopic_region $contopic_type section is 73 type is restaurant matchalltopics " order="byname asc" }}

    {{ if $rest_rank eq 0 }}
        <h3 class="desktop-hide mobile-hide">Restaurants</h3>
    {{ /if }}

    {{ assign var="rest_rank" $rest_rank+1 }}
    {{ assign var="is_odd" 1-$is_odd }}

            {{  assign var="rest_days_notice" "" }}
            {{  assign var="rest_days" $gimme->article->date_time_text }}
            {{ php }}
                $rest_days = $template->get_template_vars('rest_days');
                $usedate = $template->get_template_vars('usedate_link');
                $useperiod = $template->get_template_vars('useperiod_link');
                $rest_days_notice = get_rest_days_notice($rest_days, $usedate, $useperiod);
                $template->assign('rest_days_notice',$rest_days_notice);
            {{ /php }}

            {{ assign var="cuisine_text" '' }}
            {{ assign var="ambiance_text" '' }}
            {{ assign var="cur_cuisine" $gimme->article->rest_cuisine }}
            {{ assign var="cur_ambiance" $gimme->article->rest_ambiance }}
            {{ php }}
                $cur_cuisine = $template->get_template_vars('cur_cuisine');
                $cur_ambiance = $template->get_template_vars('cur_ambiance');

                $cuisine_text = take_body_list($cur_cuisine, ', ');
                $ambiance_text = take_body_list($cur_ambiance, ', ');

                $template->assign('cuisine_text',$cuisine_text);
                $template->assign('ambiance_text',$ambiance_text);
            {{ /php }}

            {{ assign var="rest_cuisines_classes" " " }}
            {{ assign var="cur_topics" $gimme->article->topics }}

            {{ php }}
                $cur_topics = $template->get_template_vars('cur_topics');
                $rest_cuisines_classes = get_current_cuisine_classes($cur_topics);
                $template->assign('rest_cuisines_classes',$rest_cuisines_classes);
            {{ /php }}

            {{ assign var="odd_class" " " }}
            {{ if $is_odd }}
                {{ assign var="odd_class" " article_odd " }}
            {{ /if }}

                <article class="article_active rest_all {{ $odd_class }} {{ $rest_cuisines_classes }}">
        {{ assign var="art_link_params" "?date=$usedate_link&region=$linkregion" }}
                    <figure>
                    {{ if $rest_days_notice }}
                        <div class="rest-closed-info">{{ $rest_days_notice }}</div>
                    {{ /if }}
                    {{ if $gimme->article->has_image(1) }}
                    <a href="{{ uri options="article" }}{{ $art_link_params }}"><img src="{{ url options="image 1 width 250 height 166 crop center" }}" alt="{{ $gimme->article->image1->description|replace:'"':'\'' }}" class="thumbnail" width="250" height="166" /></a>
                    {{ else }}
                    <a href="{{ uri options="article" }}{{ $art_link_params }}"><img src="{{ uri static_file="assets/img/restaurant-icon.png" }}" alt="restaurant" class="thumbnail"  width="250" height="166" /></a>
                    {{ /if }}
                    </figure>
                    <h3><a href="{{ uri options="article" }}{{ $art_link_params }}">{{ $gimme->article->headline|replace:'\\\'':'\'' }}</a></h3>
                    {{ if $cuisine_text || $ambiance_text }}
                        <p>{{ $cuisine_text }}{{ if $cuisine_text && $ambiance_text }}, {{ /if }}{{ $ambiance_text }}</p>
                    {{ /if }}
                    {{ if $gimme->article->description }}
                        <p>{{ $gimme->article->description }}</p>
                    {{ /if }}
                    <footer><p class="more"><a href="{{ uri options="article" }}{{ $art_link_params }}">Details & Reservieren</a></p></footer>
                </article>

{{ /list_articles }}
    <div class="no_rest_found" id="loading_empty" {{ if $rest_rank != 0 }}style="display:none;"{{ /if }}><p>Leider haben wir zu diesen Suchkriterien kein Restaurant gefunden.</p></div>

                </div><!-- /restaurant_list -->

            </div><!-- /restaurant_holder -->

<script type="text/javascript">

function load_events(ev_type) {
    return true;
};


</script>

            <div class="aside">

                <div class="ad top-space">
                    {{ include file="_ads/ausgehen-list-restaurants.tpl" }}
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
