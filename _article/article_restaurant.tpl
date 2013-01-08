{{ assign var="omit_canonical" true }}
{{ include file="_tpl/_html-head.tpl" }}

<script type="text/javascript">
window.useCanonicalForSocialBar = true;
window.ausgehen_url = "{{ url options="root_level" }}ausgehen/search?type=restaurant&key={{ $gimme->article->event_id|escape:'url' }}";
</script>
<link rel="canonical" href="{{ url options="root_level" }}{{ $gimme->language->code }}/{{ $gimme->issue->url_name }}/{{ $gimme->section->url_name }}/{{ $gimme->article->number }}/" />

<script type="text/javascript">
window.agenda_has_select_tags = false;
window.agenda_has_date_picker = false;
</script>

<style type="text/css">
.rest_text_hidden {
    display: none;
}

.rest_image_hidden {
    display: none;
}

</style>

<script type="text/javascript">
function hide_all_rest_menus() {
    $("#rest_speciality").hide();
    $("#rest_speciality_link").removeClass('rest_link_active');
    $("#rest_menu").hide();
    $("#rest_menu_link").removeClass('rest_link_active');
};
function toggle_rest_menu() {
    $("#rest_speciality").hide();
    $("#rest_speciality_link").removeClass('rest_link_active');
    $("#rest_menu").toggle();
    $("#rest_menu_link").toggleClass('rest_link_active');
};

function toggle_rest_speciality() {
    $("#rest_menu").hide();
    $("#rest_menu_link").removeClass('rest_link_active');
    $("#rest_speciality").toggle();
    $("#rest_speciality_link").toggleClass('rest_link_active');
};
</script>

{{ php }}

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
    //$use_week_day = strtolower($use_week_day_names[$use_week_day_rank]);

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
    //$at_holiday = false;
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
        //return 'Betriebsferien bis ' . $holiday_end_str;
        if (1 == $useperiod) {
            return get_display_date($usedate) . ' geschlossen';
        }
        else {
            return get_display_date($usedate) . ' - ' . get_display_date($enddate) . ' geschlossen';
        }
    }

    if (!$some_info) {
        //return 'Unbekannte Öffnungszeiten';
        return '';
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
            //return 'Betriebsferien bis ' . $holiday_end_str;
            if (1 == $useperiod) {
                return get_display_date($usedate) . ' geschlossen';
            }
            else {
                return get_display_date($usedate) . ' - ' . get_display_date($enddate) . ' geschlossen';
            }
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
            //return 'Betriebsferien bis ' . $holiday_end_str;
            if (1 == $useperiod) {
                return get_display_date($usedate) . ' geschlossen';
            }
            else {
                return get_display_date($usedate) . ' - ' . get_display_date($enddate) . ' geschlossen';
            }
        }
    }

    if ($some_info && (!$found_open) && (7 != $useperiod)) {
        if (1 == $useperiod) {
            //return 'An ausgewähltem Tag geschlossen';
            return get_display_date($usedate) . ' geschlossen';
        }
        else {
            //return 'An ausgewählten Tagen geschlossen';
            return get_display_date($usedate) . ' - ' . get_display_date($enddate) . ' geschlossen';
        }
    }

    return '';
}

function load_reservation_link($p_restId, $p_hashKey = '') {
    $res = array();
    $link = '';

    try {
        $command = 'http://foratable.com/api/getURL';
        $curlHandle = curl_init($command);

        curl_setopt($curlHandle, CURLOPT_POST, true);

        $post_params = array(
            'lunchgate_id' => $p_restId,
        );
        if (!empty($p_hashKey)) {
            $post_params['mediapartner_hash'] = $p_hashKey;
        }
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, $post_params);

        curl_setopt($curlHandle, CURLOPT_HTTPHEADER, array ('Accept: application/json'));
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curlHandle, CURLOPT_BINARYTRANSFER, true);
        curl_setopt($curlHandle, CURLOPT_NOSIGNAL, true);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT_MS, 5000);

        $response = curl_exec($curlHandle);
        curl_close($curlHandle);

        $res = json_decode($response, true);
        if (!is_array($res)) {
            $res = array();
        }

    }
    catch (\Exception $exc) {
        $res = array();
    }

    $disallowed_statuses = array('error');
    if ((!isset($res['status'])) || (in_array(strtolower($res['status']), $disallowed_statuses))) {
        return $link;
    }

    if ((!isset($res['url'])) || (empty($res['url']))) {
        return $link;
    }

    $link = $res['url'];

    return $link;
}

function load_rest_menu($p_restKey) {
    $res = array();

    try {
        $command = 'http://www.lunchgate.ch/api/1_0/?api_key=demo&action=getFullProfile&url_name=' . $p_restKey . '&response=all';
        $curlHandle = curl_init($command);
    
        curl_setopt($curlHandle, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);
        curl_setopt($curlHandle, CURLOPT_USERPWD, 'demo' . ':' . 'demo');

        curl_setopt($curlHandle, CURLOPT_HTTPHEADER, array ('Accept: application/json'));
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curlHandle, CURLOPT_BINARYTRANSFER, true);
        curl_setopt($curlHandle, CURLOPT_NOSIGNAL, true);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT_MS, 5000);

        $response = curl_exec($curlHandle);
        curl_close($curlHandle);

        $res = json_decode($response, true);
        if (!is_array($res)) {
            $res = array();
        }

    }
    catch (\Exception $exc) {
        $res = array();
    }
    return $res;
}

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

{{ /php }}

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

{{ php }}

function get_display_date($usedate)
{
    $usedate_show = '';

    $usedate_arr = explode('-', $usedate);
    if (3 == count($usedate_arr)) {
        $usedate_show .= ltrim($usedate_arr[2], '0');
        $usedate_show .= '.';
        $usedate_show .= ltrim($usedate_arr[1], '0');
        $usedate_show .= '.';
        $usedate_show .= ltrim($usedate_arr[0], '0');
    }

    return $usedate_show;
}

function get_display_rating($p_rating)
{
    $p_rating = trim(strip_tags($p_rating));

    $rating_parts = explode('.', $p_rating);
    if (2 != count($rating_parts)) {
        return $p_rating;
    }

    $end_part = trim($rating_parts[1], '0');
    if (empty($end_part)) {
        return $rating_parts[0];
    }

    return $p_rating;
}

function get_time_text($date_time_text)
{
    $res = array('open' => '', 'holiday' => '');

    $day_names = array('Mon' => 'Montag', 'Tue' => 'Dienstag', 'Wed' => 'Mittwoch', 'Thu' => 'Donnerstag', 'Fri' => 'Freitag', 'Sat' => 'Samstag', 'Sun' => 'Sonntag');
    $day_values = array();

    $time = array();

    $cur_date = null;
    $cur_date_values = array();
    $next_holiday = false;
    $holiday_values = array();

    $date_time_text = strip_tags(str_replace(array('<'), array("\n<"), $date_time_text));
    foreach (explode("\n", $date_time_text) as $one_date_time_str) {
        $one_date_time_str = trim($one_date_time_str);
        if (empty($one_date_time_str)) {
            continue;
        }

        if (isset($day_names[$one_date_time_str])) {
            $cur_date = $one_date_time_str;
            $next_holiday = false;
            continue;
        }

        if ('holiday' == $one_date_time_str) {
            $cur_date = null;
            $next_holiday = true;
            continue;
        }

        if ((!$cur_date) && (!$next_holiday)) {
            continue;
        }

        if ($cur_date) {
            if ('closed' == $one_date_time_str) {
                continue;
            }

            if (!isset($cur_date_values[$cur_date])) {
                $cur_date_values[$cur_date] = array();
            }
            if ('open' == $one_date_time_str) {
                $one_date_time_str = 'offen';
            }
            $cur_date_values[$cur_date][] = $one_date_time_str;
        }

        if ($next_holiday) {
            $holiday_values[] = $one_date_time_str;
        }

    }

    $open_parts = array();

    $last_one_open_hours = '';
    $last_one_open_days_red = array();
    $last_one_open_days = array();
    foreach ($day_names as $day_key => $day_name) {
        if (!isset($cur_date_values[$day_key])) {
            if (!empty($last_one_open_days)) {
                if (1 == count($last_one_open_days)) {
                    $last_one_open_days_red[] = $last_one_open_days[0];
                }
                if (2 == count($last_one_open_days)) {
                    $last_one_open_days_red[] = $last_one_open_days[0];
                    $last_one_open_days_red[] = $last_one_open_days[1];
                }
                if (2 < count($last_one_open_days)) {
                    $last_one_open_days_red[] = $last_one_open_days[0] . ' - ' . $last_one_open_days[count($last_one_open_days) - 1];
                }
                $last_one_open_days = array();
            }
        }

        if (isset($cur_date_values[$day_key])) {
            $cur_open_str = implode(', ', $cur_date_values[$day_key]);

            if ($last_one_open_hours != $cur_open_str) {
                if (!empty($last_one_open_days)) {
                    if (1 == count($last_one_open_days)) {
                        $last_one_open_days_red[] = $last_one_open_days[0];
                    }
                    if (2 == count($last_one_open_days)) {
                        $last_one_open_days_red[] = $last_one_open_days[0];
                        $last_one_open_days_red[] = $last_one_open_days[1];
                    }
                    if (2 < count($last_one_open_days)) {
                        $last_one_open_days_red[] = $last_one_open_days[0] . ' - ' . $last_one_open_days[count($last_one_open_days) - 1];
                    }
                }
                if (!empty($last_one_open_days_red)) {
                    $open_parts[] = '' . implode(', ', $last_one_open_days_red) . ', ' . $last_one_open_hours;
                }
                $last_one_open_days_red = array();
                $last_one_open_days = array($day_name);
                $last_one_open_hours = $cur_open_str;
                continue;
            }

            $last_one_open_days[] = $day_name;

            //$open_parts[] = '' . $day_name . ' ' . $cur_open_str;
        }
    }
    if (!empty($last_one_open_days)) {
        if (1 == count($last_one_open_days)) {
            $last_one_open_days_red[] = $last_one_open_days[0];
        }
        if (2 == count($last_one_open_days)) {
            $last_one_open_days_red[] = $last_one_open_days[0];
            $last_one_open_days_red[] = $last_one_open_days[1];
        }
        if (2 < count($last_one_open_days)) {
            $last_one_open_days_red[] = $last_one_open_days[0] . ' - ' . $last_one_open_days[count($last_one_open_days) - 1];
        }
    }
    if (!empty($last_one_open_days_red)) {
        $open_parts[] = '' . implode(', ', $last_one_open_days_red) . ', ' . $last_one_open_hours;
    }

    $res['open'] = implode('<br>', $open_parts);

    $cur_date = date('Y-m-d');
    if (!empty($holiday_values)) {
        if (1 == count($holiday_values)) {
            if ($cur_date <= $holiday_values[0]) {
                $res['holiday'] = 'geschlossen ' . get_display_date($holiday_values[0]);
            }
        }
        else {
            if ($cur_date <= $holiday_values[1]) {
                $res['holiday'] = 'geschlossen ' . get_display_date($holiday_values[0]);
                $res['holiday'] .= ' bis ' . get_display_date($holiday_values[1]);
            }
        }
    }

    return $res;
}

function get_menu_text($menu_data)
{
    $one_menu = array('price' => null, 'type' => null, 'name' => '', 'desc' => array());
    $all_menus = array();

    $menu_types = array('meat', 'fish', 'vegetarian');

    $menu_data = strip_tags(str_replace(array('<'), array("\n<"), $menu_data));
    foreach (explode("\n", $menu_data) as $one_menu_str) {
        $one_menu_str = trim($one_menu_str);
        if (empty($one_menu_str)) {
            continue;
        }

        $matches = array();
        if (preg_match('/^[\d]+[\.,][\d]*$/', $one_menu_str, $matches)) {
            if (isset($one_menu['name']) && (!empty($one_menu['name']))) {
                $one_menu['desc'] = implode(' ', $one_menu['desc']);
                $one_price = str_replace(array('0', '.', ',', ' '), '', $one_menu['price']);
                if (empty($one_price)) {
                    $one_menu['price'] = null;
                }
                $all_menus[] = $one_menu;
            }
            $one_menu = array('price' => $one_menu_str, 'type' => null, 'name' => '', 'desc' => array());
            continue;
        }

        if (in_array(strtolower($one_menu_str), $menu_types)) {
            $one_menu['type'] = $one_menu_str;
            continue;
        }

        if (empty($one_menu['name'])) {
            $one_menu['name'] = $one_menu_str;
            continue;
        }

        $one_menu['desc'][] = $one_menu_str;

    }

    if (isset($one_menu['name']) && (!empty($one_menu['name']))) {
        $one_menu['desc'] = implode(' ', $one_menu['desc']);
        $one_price = str_replace(array('0', '.', ',', ' '), '', $one_menu['price']);
        if (empty($one_price)) {
            $one_menu['price'] = null;
        }
        $all_menus[] = $one_menu;
    }

    return $all_menus;
}


{{ /php }}

{{ assign var="curdate" $smarty.now|camp_date_format:"%Y-%m-%d" }}
{{ assign var="usedate" $curdate }}
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

{{ assign var="date_time_text" $gimme->article->date_time_text }}
{{ assign var="speciality_text" $gimme->article->rest_speciality }}
{{ assign var="speciality_info" 0 }}
{{ assign var="speciality_count" 0 }}

{{ assign var="rest_key" $gimme->article->event_id }}
{{ assign var="rest_menu_info" 0 }}
{{ assign var="rest_menu_count" 0 }}

{{ assign var="rest_menucard_pdf" "" }}
{{ assign var="rest_menucard_issuu" "" }}
{{ assign var="rest_winecard_pdf" "" }}
{{ assign var="rest_winecard_issuu" "" }}
{{ assign var="rest_kidscard_pdf" "" }}
{{ assign var="rest_kidscard_issuu" "" }}

{{ assign var="rest_rating" $gimme->article->rest_gaultmillau }}

{{  assign var="rest_days_notice" "" }}
{{  assign var="rest_days" $gimme->article->date_time_text }}

{{ assign var="rest_id" $gimme->article->location_id }}
{{ assign var="reservation_link" $gimme->article->rest_reservation_url }}

{{ php }}
    $date_time_text = '' . $template->get_template_vars('date_time_text');
    $date_time_text_parts = get_time_text($date_time_text);
    $date_time_text = '';
    if (!empty($date_time_text_parts['open'])) {
        $date_time_text .= $date_time_text_parts['open'];
        if (!empty($date_time_text_parts['holiday'])) {
            $date_time_text .= '<br>';
        }
    }
    if (!empty($date_time_text_parts['holiday'])) {
        $date_time_text .= $date_time_text_parts['holiday'];
    }

    $template->assign('date_time_text', $date_time_text);


    $speciality_text = '' . $template->get_template_vars('speciality_text');
    $speciality_info = get_menu_text($speciality_text);
    $template->assign('speciality_info', $speciality_info);
    $template->assign('speciality_count', count($speciality_info));

    $rest_key = '' . $template->get_template_vars('rest_key');
    $rest_menu_info_all = load_rest_menu($rest_key);

    $rest_menu_info = array();
    if (isset($rest_menu_info_all['menu']) && is_array($rest_menu_info_all['menu'])) {
        $rest_menu_info = array();
        foreach ($rest_menu_info_all['menu'] as $one_menu_part) {
           $one_menu_part['type'] = '';
           if (isset($one_menu_part['category']) && (!empty($one_menu_part['category']))) {
                $one_menu_part_type = trim(strtolower(''.$one_menu_part['category']));
                if (in_array($one_menu_part_type, array('vegetarian', 'fish', 'meat'))) {
                    $one_menu_part['type'] = $one_menu_part_type;
                }
           }
           $rest_menu_info[] = $one_menu_part;
        }
    }

    $template->assign('rest_menu_info', $rest_menu_info);
    $template->assign('rest_menu_count', count($rest_menu_info));


    $rest_rating = '' . $template->get_template_vars('rest_rating');
    $rest_rating = get_display_rating($rest_rating);
    $template->assign('rest_rating', $rest_rating);


    foreach (array('menucard_pdf', 'menucard_issuu', 'winecard_pdf', 'winecard_issuu', 'kidscard_pdf', 'kidscard_issuu') as $one_menu_card) {
        if (isset($rest_menu_info_all[$one_menu_card]) && (!empty($rest_menu_info_all[$one_menu_card]))) {
            if ('http' == substr(''.$rest_menu_info_all[$one_menu_card], 0, 4)) {
                $template->assign('rest_' . $one_menu_card, $rest_menu_info_all[$one_menu_card]);
            }
        }
    }

    $rest_days = $template->get_template_vars('rest_days');
    $usedate = $template->get_template_vars('usedate_link');
    $useperiod = $template->get_template_vars('useperiod_link');
    $rest_days_notice = get_rest_days_notice($rest_days, $usedate, $useperiod);
    $template->assign('rest_days_notice',$rest_days_notice);

    $partner_hash_key = '9ae6dbb54e90fc01fdec2263457fd40e';
    $rest_id = '' . $template->get_template_vars('rest_id');
    $reservation_link = load_reservation_link($rest_id, $partner_hash_key);
    if (!empty($reservation_link)) {
        $template->assign('reservation_link', $reservation_link);
    }
{{ /php }}

<script type="text/javascript">
$(document).ready(function() {
    update_subnav_links("{{ $usedate_link }}", "1", "{{ $linkregion }}");

    highlight_agenda_type("restaurants");

    hide_all_rest_menus();
});

function load_events(ev_type) {
    return true;
};

</script>

            {{ assign var="cuisine_text" '' }}
            {{ assign var="ambiance_text" '' }}
            {{ assign var="services_text" '' }}
            {{ assign var="src_cuisine" $gimme->article->rest_cuisine }}
            {{ assign var="src_ambiance" $gimme->article->rest_ambiance }}
            {{ assign var="src_services" $gimme->article->rest_services }}
            {{ php }}
                $src_cuisine = $template->get_template_vars('src_cuisine');
                $src_ambiance = $template->get_template_vars('src_ambiance');
                $src_services = $template->get_template_vars('src_services');

                $cuisine_text = take_body_list($src_cuisine, ', ');
                $ambiance_text = take_body_list($src_ambiance, ', ');
                $services_text = take_body_list($src_services, ', ');

                $template->assign('cuisine_text',$cuisine_text);
                $template->assign('ambiance_text',$ambiance_text);
                $template->assign('services_text',$services_text);
            {{ /php }}

<body>

<div class="content-wrapper">

    <div id="content_wrapper" class="content-wrapper events-content restaurant-single">

{{ include file="_tpl/header-nav.tpl" }}

{{ include file="_tpl/header.tpl" }}

{{ include file="_ausgehen/other-common.tpl" }}

{{ include file="_ausgehen/subnav-common-func.tpl" }}

{{ include file="_ausgehen/subnav-detail-top.tpl" }}

<div class="content no-bottom-line clearfix">

    <div class="main">

        <article id="rest_detail">

            <h3>{{ $gimme->article->headline|replace:'\\\'':'\'' }}</h3>

                {{ assign var="image_count" 0 }}
                {{ if $gimme->article->has_image(1) }}
                    <figure class="clearfix">

                        {{ assign var="list_img_rank" 1 }}
                        {{ assign var="list_img_rank_out" 0 }}
                        {{ while $gimme->article->has_image($list_img_rank) }}
                            {{ assign var="image_tpl" "image$list_img_rank" }}
                            {{ assign var="image_path" $gimme->article->$image_tpl->filerpath }}
                            {{ assign var="image_width" 0 }}

                            {{ php }}
                                $image_width = 0;
                                $image_sizes = getimagesize($template->get_template_vars('image_path'));
                                if ((!empty($image_sizes)) && (isset($image_sizes[0]))) {
                                    $image_width = $image_sizes[0];
                                }
                                $template->assign('image_width', $image_width);
                            {{ /php }}

                            {{ if 400 < $image_width }}
                                {{ assign var="list_img_rank_out" $list_img_rank_out+1 }}
                                {{ assign var="image_desc" $gimme->article->$image_tpl->description|replace:'"':'\'' }}
                                {{ if $image_desc|substr:0:10 eq "plain rest" }}{{ assign var="image_desc" "" }}{{ /if }}
                                <img class="rest_photo_any {{ if $list_img_rank_out > 1 }}rest_image_hidden{{ /if }}" id="rest_photo_{{ $list_img_rank_out }}" src="{{ url options="image $list_img_rank width 723 height 271 crop center" }}" width="723" height="271" onClick="show_next_image({{ $list_img_rank_out }}); return false;" {{ if $image_desc != "" }}title="{{ $image_desc }}" alt="{{ $image_desc }}"{{ /if }} />
                            {{ /if }}

                            {{ assign var="list_img_rank" $list_img_rank+1 }}

                        {{ /while }}
                        {{ assign var="image_count" $list_img_rank_out }}

                        {{ if $image_count <= 0 }}
                            {{ assign var="image_desc" $gimme->article->image1->description|replace:'"':'\'' }}
                            {{ if $image_desc|substr:0:10 eq "plain rest" }}{{ assign var="image_desc" "" }}{{ /if }}
                            <img class="rest_photo_any" id="rest_photo_1" src="{{ url options="image 1 width 723 height 271 crop center" }}" width="723" height="271" {{ if $image_desc != "" }}title="{{ $image_desc }}" alt="{{ $image_desc }}"{{ /if }} />
                            {{ assign var="image_count" 1 }}
                        {{ /if }}

                        {{ if $image_count > 1 }}
<script type="text/javascript">
$(document).ready(function() {
    $('.rest_photo_any').css('cursor', 'pointer');
});
</script>
                        {{ /if }}

                        {{ if $gimme->article->rest_panorama_count }}
                        <iframe style="display:none;" id="rest_panorama" name="lunchgate" src="http://www.lunchgate.ch/embed.php?name={{ $gimme->article->event_id }}&w=723&h=271&hash=a2cb391aa5cb95f0e0f054c151ed1d08&wmode=transparent" scrolling="no" frameborder="no" height="271" width="723" rel="resizable" /></iframe>
                        {{ /if }}
                            <div class="img-options clearfix">
                                {{ if $gimme->article->rest_panorama_count }}
                                    <a href="#" id="link_fotos" onClick='show_photos();return false;' class="button white active right">Fotos</a>
                                    <a href="#" id="link_panos" onClick='show_panorama();return false;' class="button white right">Panorama</a>
                                {{ /if }}
                                {{ if $reservation_link || $rest_days_notice }}
                                    {{ if $rest_days_notice }}
                                        <span class="event-info alert">{{ $rest_days_notice }}</span>
                                    {{ else }}
                                        <a id="rest_reservation_link_desktop" href="{{ $reservation_link }}" target="_blank" class="button red left">Reservieren</a>
                                    {{ /if }}
                                {{ /if }}
                            </div>
                    </figure>
                {{ /if }}

{{ if $gimme->article->description }}
                    <p>
                        {{ $gimme->article->description }}
                    </p>
{{ /if }}
{{ if $gimme->article->other }}
                    <p>
                    {{ $gimme->article->other|strip_tags }}
                    </p>
{{ /if }}


                    <table cellpadding="0" cellspacing="0">
{{ if $cuisine_text }}
                        <tr><th>Küche:</th><td>{{ $cuisine_text }}</td></tr>
{{ /if }}
{{ if $ambiance_text }}
                        <tr><th>Ambiente:</th><td>{{ $ambiance_text }}</td></tr>
{{ /if }}
{{ if $rest_rating }}
                        <tr><th>Gault-Millau:</th><td>{{ $rest_rating }}/20</td></tr>
{{ /if }}
{{ if $date_time_text }}
                        <tr><th>Geöffnet</th><td>{{ $date_time_text }}</td></tr>
{{ /if }}
{{ if $services_text }}
                        <tr><th>Services:</th><td>{{ $services_text }}</td></tr>
{{ /if }}
{{ if $gimme->article->rest_seats_in || $gimme->article->rest_seats_out }}
                        <tr><th>Sitzplätze:</th><td>innen: {{ 0 + $gimme->article->rest_seats_in }}, aussen: {{ 0 + $gimme->article->rest_seats_out }}</li>
{{ /if }}
                    </table>

                    <div id="menu_tabs" class="tabs_aus article-tabs">
                        <ul class="tab-nav clearfix phone-hide">
                            <li><a href="#inner-tab-1">Tagesmenü</a></li>
                            {{ if $speciality_count }}<li><a href="#inner-tab-2">Hausspezialiäten</a></li>{{ /if }}
                            {{ if $rest_menucard_pdf }}<li><a href="#inner-tab-3">Komplette Menükarte</a></li>{{ /if }}
                            {{ if $rest_winecard_pdf }}<li><a href="#inner-tab-4">Weinkarte</a></li>{{ /if }}
                            {{ if $rest_kidscard_pdf }}<li><a href="#inner-tab-5">Kindermenüs</a></li>{{ /if }}
                        </ul>
                        <div class="tab-nav-dropdown">
                            <select id="rest_menu_sel" class="rest_menu_sel">
                                <option value="inner-tab-1">Tagesmenü</option>
                                {{ if $speciality_count }}<option value="inner-tab-2">Hausspezialiäten</option>{{ /if }}
                                {{ if $rest_menucard_pdf }}<option value="inner-tab-3">Komplette Menükarte</option>{{ /if }}
                                {{ if $rest_winecard_pdf }}<option value="inner-tab-4">Weinkarte</option>{{ /if }}
                                {{ if $rest_kidscard_pdf }}<option value="inner-tab-5">Kindermenüs</option>{{ /if }}
                            </select>
                        </div><!-- tab-nav-dropdown -->
                        <div class="article-tabs-holder">
                            <div class="rest_text_hidden" id="inner-tab-1">
                            {{ if $rest_menu_count }}
                                {{ foreach from=$rest_menu_info key=menu_key item=menu_part }}
                                    <p><strong>{{ $menu_part.title }}</strong><br />
                                    {{ if $menu_part.line2 }}
                                        {{ $menu_part.line2 }} {{ $menu_part.line3 }}{{ if $menu_part.price || $menu_part.type }}<br />{{ /if }}
                                    {{ /if }}
                                    {{ if $menu_part.type }}{{ $menu_part.type }}{{ if $menu_part.price }}<br />{{ /if }}{{ /if }}
                                    {{ if $menu_part.price }}{{ $menu_part.price }}{{ /if }}</p>
                                {{ /foreach }}
                            {{ else }}
                                <p>Das Tagesmenü ist noch nicht bekannt.</p>
                            {{ /if }}
                            </div>
                            {{ if $speciality_count }}
                                <div class="rest_text_hidden" id="inner-tab-2">
                                    {{ foreach from=$speciality_info key=spec_key item=spec_part }}
                                        <p><strong>{{ $spec_part.name }}</strong><br />
                                        {{ if $spec_part.desc }}
                                            {{ $spec_part.desc }}{{ if $spec_part.price }}<br />{{ /if }}
                                        {{ /if }}
                                        {{ if $spec_part.type }}{{ $spec_part.type }}<br />{{ /if }}
                                        {{ if $spec_part.price }}{{ $spec_part.price }}{{ /if }}</p>
                                    {{ /foreach }}
                                </div>
                            {{ /if }}
                            {{ if $rest_menucard_pdf }}
                                <div class="rest_text_hidden" id="inner-tab-3">
                                    <a class="rest_link_menu_any" href="{{ $rest_menucard_pdf }}" target="_blank">Komplette Menükarte (PDF)</a>
                                </div>
                            {{ /if }}
                            {{ if $rest_winecard_pdf }}
                                <div class="rest_text_hidden" id="inner-tab-4">
                                    <a class="rest_link_menu_any" href="{{ $rest_winecard_pdf }}" target="_blank">Weinkarte (PDF)</a>
                                </div>
                            {{ /if }}
                            {{ if $rest_kidscard_pdf }}
                                <div class="rest_text_hidden" id="inner-tab-5">
                                    <a class="rest_link_menu_any" href="{{ $rest_kidscard_pdf }}" target="_blank">Kindermenüs (PDF)</a>
                                </div>
                            {{ /if }}

                        </div><!-- /article-tabs-holder -->
                    </div><!-- /article-tabs -->

        </article>

{{ include file="_tpl/article-tools.tpl" }}

    </div><!-- /main -->

    <div class="aside">

        <article id="event_location" class="bottom-line">

                    <p>
{{ if $gimme->article->organizer }}
                    <strong>{{ $gimme->article->organizer|replace:'\\\'':'\'' }}</strong><br />
{{ /if }}
{{ if $gimme->article->town }}
                    {{ if $gimme->article->street }}{{ $gimme->article->street|regex_replace:"/\"(.*?)\"/":"&#171;$1&#187;" }},{{ /if }} {{ $gimme->article->zipcode }} {{ $gimme->article->town }}
{{ /if }}
                    </p>

                    <p>
{{ if $gimme->article->phone }}
                    {{ $gimme->article->phone }}<br />
{{ /if }}
{{ if $gimme->article->email }}
                    <a href="mailto:{{ $gimme->article->email }}">{{ $gimme->article->email }}</a><br />
{{ /if }}
{{ if $gimme->article->web }}
                    <a href="{{ $gimme->article->web }}" target="_blank">{{ $gimme->article->web|replace:"http://":"" }}</a>
{{ /if }}
                    </p>

                    {{ list_article_locations length="1" }}
                    <div class="phone-map-fix">
                        <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=de&q={{ $gimme->location->latitude }},{{ $gimme->location->longitude }}+({{ $gimme->article->organizer|escape:'url' }})&ll={{ $gimme->location->latitude }},{{ $gimme->location->longitude }}&hnear={{ $gimme->article->town|escape:'url' }},+Switzerland&t=m&ie=UTF8&z=16&output=embed"></iframe>
                    </div>
                    {{ /list_article_locations }}

                    <div class="box top-line back-link bottom-line margin-top desktop-hide phone-show">
{{ local }}
{{ set_current_issue }}
{{ set_section number="73" }}
                <a href="{{ uri options="section" }}?type=all&date={{ $usedate_link }}&region={{ $linkregion }}" class="button white prev">‹</a> <a href="{{ uri options="section" }}?type=all&date={{ $usedate_link }}&region={{ $linkregion }}">Zurück zur Restaurantübersicht</a>
{{ /local }}
                    </div>

        </article>

        <div class="ad top-space">
            {{ include file="_ads/ausgehen-detail-restaurant.tpl" }}
        </div>

    </div><!-- /aside -->

</div><!-- /content -->

</div><!-- /content_wrapper -->

</div><!-- /content-wrapper -->

<div class="wide-wrapper internal-wrapper">
    <div class="content-wrapper">
        <div class="content no-bottom-line clearfix">

        {{ include file="_tpl/article-comments.tpl" }}

                        <div class="main box top-line back-link bottom-line margin-top mobile-hide">
{{ local }}
{{ set_current_issue }}
{{ set_section number="73" }}
                <a href="{{ uri options="section" }}?type=all&date={{ $usedate_link }}&region={{ $linkregion }}" class="button white prev">‹</a> <a href="{{ uri options="section" }}?type=all&date={{ $usedate_link }}&region={{ $linkregion }}">Zurück zur Restaurantübersicht</a>
{{ /local }}
                        </div>

        </div>
    </div>
</div>


<script type="text/javascript">

window.last_shown_image = 1;

function show_photos() {
    $("#rest_panorama").css('display', 'none');
    $(".rest_photo_any").css('display', 'none');
    $("#rest_photo_" + window.last_shown_image).css('display', 'block');
    $("#link_panos").removeClass("active");
    $("#link_fotos").addClass("active");
    return false;
};

function show_panorama() {
    $(".rest_photo_any").css('display', 'none');
    $("#rest_panorama").css('display', 'block');
    $("#link_fotos").removeClass("active");
    $("#link_panos").addClass("active");
    return false;
};

function show_next_image(cur_image_rank) {
    var image_count = {{ $image_count }};

    var next_image_rank = cur_image_rank + 1;
    if (cur_image_rank == image_count) {
        next_image_rank = 1;
    }

    window.last_shown_image = next_image_rank;

    $(".rest_photo_any").css('display', 'none');
    $("#rest_photo_" + next_image_rank).css('display', 'block');

};

$(document).ready(function() {
    show_photos();

    $("#rest_reservation_link_desktop").each(function() {
        $(this).fancybox({
            //modal: true,
            hideOnContentClick: false,
            hideOnOverlayClick: false,
            enableEscapeButton: false,
            showCloseButton: true,
            closeClick: false,
            helpers: {
                overlay: {closeClick: false}
            },
            width: 540,
            height: 560,
            type: 'iframe'
        });
    });

    $("#rest_menu_sel").dropdownized();

});


$(document).ready(function() {
    $('.tabs_aus').tabs();
});
</script>


    <div id="footer">

{{ include file="_tpl/footer.tpl" }}

    </div><!-- /footer -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
