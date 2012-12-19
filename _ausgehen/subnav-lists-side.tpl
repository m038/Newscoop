
<style type="text/css">
.top-calendar-narrow {
    width: 280px !important;
}

.agenda-datepicker-narrow {
    width: 300px !important;
    margin-left: -12px !important;
}
</style>

            <div id="events_aside_part" class="events-aside clearfix">

                <div class="box desktop-hide">
                    <h4>Was</h4>
                    <select id="sel_was" class="dropdownized" onChange="window.load_sel_events(this.options[this.selectedIndex].value); return true;">
                        <option value="event">Alles</option>
                        <option value="kino">Kino</option>
                        <option value="theater">Theater</option>
                        <option value="concert">Konzerte</option>
                        <option value="party">Partys</option>
                        <option value="exhibit">Ausstellungen</option>
                        <option value="misc">Diverse</option>
{{ if 1 }}
                        <option value="restaurants">Restaurants</option>
{{ /if }}
                    </select>
                </div>

{{ if 1 || $list_type ne "restaurants" }}

        <div id="calendar_placeholder_box" class="box calendar-placeholder">
            <h4>Wann</h4>

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
            <a style="display:none;cursor:pointer;" id="datapicker-button" href="#" class="button white datepicker-trigger">Heute, {{ $smarty.now|date_format:"%e" }}.{{ $month_str }}.</a>
            <div id="top-calendar" class="clearfix calendar-popup">

                <ul class="calendar-options">
                    <li><a href="#" onClick="agenda_set_today(); return false;">Heute</a></li>
                    <li><a href="#" onClick="agenda_set_tomorrow(); return false;">Morgen</a></li>

                    <li style="display:none;">
                        <fieldset>
                            <input id="wann-picker" type="text" disabled="disabled" style="background:#ffffff;" />
                        </fieldset>
                    </li>
                    <li style="display:none;">
                        <input type="submit" value="Fertig" class="button" />
                    </li>
                </ul>
            
                <div id="agenda-datepicker"></div>

            </div><!-- / top-calendar -->

            <div class="popup-overlay"></div>

        </div><!-- / calendar_placeholder_box -->

{{ /if }}

                <div class="box">
                    <h4>Wo</h4>
                    <select id="wo" class="dropdownized" onChange="window.load_area(this); return true;">
                        <option value="region-zentralschweiz" selected>Zentralschweiz</option>
                        <option value="kanton-luzern">Luzern</option>
                        <option value="kanton-nidwalden">Nidwalden</option>
                        <option value="kanton-obwalden">Obwalden</option>
                        <option value="kanton-schwyz">Schwyz</option>
                        <option value="kanton-uri">Uri</option>
                        <option value="kanton-zug">Zug</option>
                    </select>
                </div>

{{ if $list_type ne "restaurants" }}
                <p><a href="mailto:agenda@zentralplus.ch">Ihre Veranstaltung fehlt?</a></p>
{{ else }}
                    <div class="box filter-side">
                        <h4>Küche</h4>
                        <ul class="categories">
                            {{ foreach from=$cuisin_list key=kueche_key item=kueche_info }}
                                {{ if $kueche_key ne "restaurant_cuisine" }}
                                <li class="{{* active *}} li_kueche" id="li_{{ $kueche_info.label }}"><input class="kueche_check" name="{{ $kueche_info.label }}" value="off" type="checkbox" id="filter_{{ $kueche_info.label }}" onChange="show_cuisines();return true;" /><label for="filter_{{ $kueche_info.label }}">{{*<a href="#" onClick="load_kueche('{{ $kueche_info.label }}'); return false;">*}}{{ $kueche_info.display }}{{*</a>*}}</label></li>
                                {{ /if }}
                            {{ /foreach }}
                        </ul>
                    <p>In Zusammenarbeit  <br />mit Lunchgate</p>
                    </div>
{{ /if }}

            </div><!-- / events_aside_part -->

