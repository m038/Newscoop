{{* $contopic_region *}}
{{ assign var="art_link_params" "?date=$usedate_link&period=$useperiod_link" }}
{{ assign var="rest_arts" "null" }}
{{ php }}
    $template->assign('rest_arts', array());
{{ /php }}
{{ assign var="rest_art_rank" 0 }}
{{ assign var="rest_art_rank" $rest_art_rank-1 }}
{{* list_articles columns="$colcount" ignore_issue="true" ignore_section="true" constraints="$contopic_region section is 73 type is restaurant matchalltopics " order="byname asc" length=3 *}}
{{ list_articles ignore_issue="true" ignore_section="true" constraints="$contopic_region section is 73 type is restaurant matchalltopics" order="byname asc" }}

{{ assign var="cur_article" $gimme->article }}
{{ php }}
    $rest_arts = $template->get_template_vars('rest_arts');
    $cur_article = $template->get_template_vars('cur_article');
    $rest_arts[] = $cur_article;
    $template->assign('rest_arts', $rest_arts);
{{ /php }}
    {{ assign var="rest_art_rank" $rest_art_rank+1 }}
    {{ if $gimme->article->has_image(1) }}
        <img id="img_url_src_{{ $rest_art_rank }}" style="display:none" src="{{ url options="image 1 width 150 height 100 crop center" }}" />
    {{ else }}
        <img id="img_url_src_{{ $rest_art_rank }}" style="display:none" src="{{ uri static_file="_ausgehen/pictures/restaurant-icon.png" }}" />
    {{ /if }}

{{ /list_articles }}

{{ assign var="rest_part" "" }}
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
            if (preg_match('/(\d{2}):(\d{2})[\s]*-[\s]*(\d{2}):(\d{2})/', $one_date_time_str, $matches)) {
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

function take_rests($rests, $towns, $datum, $useperiod)
{
//var_dump($rests);
//var_dump($towns);
//var_dump($datum);
//return '';

    if (empty($rests)) {
        return '';
    }
    $rest_parts = array();
    $rests_ranks = array();
    $rests_taken = array();

    $towns_lc = array();
    foreach ($towns as $one_town) {
        $towns_lc[] = strtolower($one_town);
    }
    $image_ranks = array();

    // open+image+town, open+image, open+town, open, image+town, image, town, none
    $rests_near = array(array(), array(), array(), array(), array(), array(), array(), array());
    $cur_rest_rank = -1;
    foreach ($rests as $one_rest) {
        $cur_rest_rank += 1;

        if ($one_rest->image && $one_rest->image->defined) {
            $image_ranks['' . $one_rest->image->number] = $cur_rest_rank;
        }

        $near_rank = 7;

        $some_closed_notice = get_rest_days_notice('' . $one_rest->date_time_text, $datum, $useperiod);
        if (empty($some_closed_notice)) {
            $near_rank -= 4;
        }
        if ($one_rest->image && $one_rest->image->defined) {
            $near_rank -= 2;
        }
        if (in_array(strtolower($one_rest), $towns_lc)) {
            //$near_rank -= 1;
        }

        $rests_near[$near_rank][$cur_rest_rank] = $one_rest;
    }
    //$rests = $rests_near;
    //var_dump($towns);
//foreach ($rests_near as $one_set) {
//var_dump(count($one_set));
//}

    $rest_display_count = 3;
    if ($rest_display_count >= count($rests)) {
        $rests_taken = $rests;
    }
    else {
//echo "to take: ";
        foreach($rests_near as $one_rest_set) {
//continue;
            $count_to_take = $rest_display_count - count($rests_taken);
//var_dump($count_to_take);
            if (0 >= $count_to_take) {
                break;
            }
            if (count($one_rest_set) <= $count_to_take) {
                $rests_taken = array_merge($rests_taken, $one_rest_set);
                continue;
            }

            $one_taken_set = array_rand($one_rest_set, $count_to_take);
            if (!is_array($one_taken_set)) {
                $one_taken_set = array($one_taken_set);
            }
            foreach($one_taken_set as $one_rank) {
                $rests_taken[] = $rests[$one_rank];
            }
        }
    }
    unset($rests);
    shuffle($rests_taken);
//echo "chosen: ";
//var_dump(count($rests_taken));

    foreach ($rests_taken as $one_rest) {
        //$rest_count += 1;
        $one_rest_info = array();
        //$one_rest_info['name'] = str_replace('&', '&amp;', $one_rest->headline);
        $one_rest_info['name'] = $one_rest->headline;
        $one_rest_info['url'] = $one_rest->url;
        $one_rest_info['seo_url_end'] = $one_rest->seo_url_end;
        $one_rest_info['cuisine'] = take_body_list($one_rest->rest_cuisine, ', ');
        $one_rest_info['ambiance'] = take_body_list($one_rest->rest_ambiance, ', ');
        $one_rest_info['desc'] = $one_rest->description;
        //$one_rest_info['rank'] = $one_rest->orig_rank;

        $one_rest_image_url = '';
        $one_rest_image_desc = '';
        $one_rest_image_number = 0;
        $one_rest_image_path = '';
        $one_rest_image = $one_rest->image;
        $one_rest_info['rank'] = -1;

        if ($one_rest_image && $one_rest_image->defined) {
            $one_rest_image_url = $one_rest_image->imageurl;
            $one_rest_image_desc = $one_rest_image->description;
            $one_rest_image_number = $one_rest_image->number;
            $one_rest_image_path = $one_rest_image->filerpath;

            $one_rest_info['rank'] = $image_ranks['' . $one_rest_image->number];
        }
        $one_rest_info['image_url'] = $one_rest_image_url;
        $one_rest_info['image_desc'] = $one_rest_image_desc;
        $one_rest_info['image_number'] = $one_rest_image_number;
        $one_rest_info['image_path'] = $one_rest_image_path;

        $rest_parts[] = $one_rest_info;
    }

    return $rest_parts;
}

    $usedate = $template->get_template_vars('usedate_link');
    $useperiod = $template->get_template_vars('useperiod_link');
    $cinema_towns = $template->get_template_vars('cinema_towns');
    $rest_arts = $template->get_template_vars('rest_arts');
    //$rest_parts = array();
    $rest_parts = take_rests($rest_arts, $cinema_towns, $usedate, $useperiod);
    $template->assign('rest_parts', $rest_parts);
{{ /php }}

    <article class="restaurant-teaser">
{{ if $rest_parts }}
        <header>
            <p>Vor dem Kino gut essen</p>
        </header>
    {{ assign var="rest_art_rank" 0 }}
    {{ foreach from=$rest_parts key=rest_parts_key item=rest_info }}
        <p>
        {{ assign var="rest_art_rank" $rest_art_rank+1 }}

            {{ if $rest_info.image_url }}
                <a href="{{ $rest_info.url }}{{ $rest_info.seo_url_end }}{{ $art_link_params }}"><img id="img_url_dst_{{ $rest_art_rank }}" rank="{{ $rest_info.rank }}" style="display:none" src="{{* $rest_info.rank *}}" alt="{{ $rest_info.image_desc|replace:'"':'\'' }}" class="left" width="150" height="100" /></a>
            {{ else }}
                <a href="{{ $rest_info.url }}{{ $rest_info.seo_url_end }}{{ $art_link_params }}"><img id="img_url_dst_{{ $rest_art_rank }}" rank="{{ $rest_info.rank }}" style="" src="{{ uri static_file="_ausgehen/pictures/restaurant-icon.png" }}" alt="restaurant" class="left" width="150" height="100" /></a>
            {{ /if }}

            <strong>{{ $rest_info.name }}</strong>

            <em>
            {{ $rest_info.cuisine }}
            </em>

            {{ $rest_info.desc }}
            <a href="{{ $rest_info.url }}{{ $rest_info.seo_url_end }}{{ $art_link_params }}" class="more">Details & Reservieren</a>

        </p>
    {{ /foreach }}
{{ /if }}
    </article>

<script type="text/javascript">
//$(document).ready(function() {
    for (var rest_rank = 1; rest_rank <= {{ $rest_art_rank }}; rest_rank++) {
        //continue;
        var cur_orig_rank = $("#img_url_dst_"+rest_rank).attr("rank");
        if (0 > cur_orig_rank) {
            continue;
        }

        var cur_img_src = $("#img_url_src_"+cur_orig_rank).attr("src");
        $("#img_url_dst_"+rest_rank).attr("src", cur_img_src);
        $("#img_url_dst_"+rest_rank).show();
    }
//});
</script>

