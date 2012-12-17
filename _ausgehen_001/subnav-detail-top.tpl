
            <div id="event_type_select_row" class="events-top highlighted clearfix">

            <h4>Was</h4>
            <ul class="clearfix phone-hide" id="events_nav">
{{ local }}
{{* agenda *}}
{{ set_current_issue }}
{{ set_section number="71" }}
                <li id="nav_all" class="nav_one active"><a id="nav_all_link" href="{{ uri options="section" }}?type=event&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Alles</a></li>
{{* movies *}}
{{ set_current_issue }}
{{ set_section number="72" }}
                <li id="nav_kino" class="nav_one"><a id="nav_kino_link" href="{{ uri options="section" }}?type=kino&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Kino</a></li>
{{* events *}}
{{ set_current_issue }}
{{ set_section number="71" }}
                <li id="nav_theater" class="nav_one"><a id="nav_theater_link" href="{{ uri options="section" }}?type=theater&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz" onClick="return load_events('theater');">Theater</a></li>
                <li id="nav_musik" class="nav_one"><a id="nav_musik_link" href="{{ uri options="section" }}?type=concert&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz" onClick="return load_events('musik');">Konzerte</a></li>
                <li id="nav_party" class="nav_one"><a id="nav_party_link" href="{{ uri options="section" }}?type=party&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz" onClick="return load_events('party');">Partys</a></li>
                <li id="nav_ausstellung" class="nav_one"><a id="nav_ausstellung_link" href="{{ uri options="section" }}?type=exhibit&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz" onClick="return load_events('ausstellung');">Ausstellungen</a></li>
                <li id="nav_andere" class="nav_one"><a id="nav_andere_link" href="{{ uri options="section" }}?type=misc&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz" onClick="return load_events('andere');">Diverse</a></li>
{{* restaurants *}}
{{ set_current_issue }}
{{ set_section number="73" }}
{{ if 1 }}
                <li id="nav_restaurants" class="nav_one"><a id="nav_restaurants_link" href="{{ uri options="section" }}?type=all&date={{ $smarty.now|camp_date_format:"%Y-%m-%d" }}&region=region-zentralschweiz">Restaurants</a></li>
{{ /if }}
            </ul><!-- /phone-hide -->
{{ /local }}

            <div class="desktop-hide">
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

            </div><!-- /desktop-hide -->

            </div><!-- /event_type_select_row -->

