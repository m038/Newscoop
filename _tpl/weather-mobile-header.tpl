{{ if $isMobDevice }}
<!-- single zone invocation -->
{{ else }}
<!-- single zone invocation -->
{{ /if }}
                    <ul class="weather phone-weather-box">
                        <li>
                            {{ list_articles ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                            <a href="{{ url options="article"}}?pg=prognosen">
                            {{ /list_articles }}
                                {{ list_weather_stats location_name="Luzern" location_list="main_regions" }}
                                    <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                    <span>{{ $gimme->weather_location->temperature }}° {{ $gimme->weather_location->location_name }} </span>
                                {{ /list_weather_stats }}

                                {{ list_weather_stats location_name="Zug" location_list="main_regions" }}
                                    <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                    <span>{{ $gimme->weather_location->temperature }}° {{ $gimme->weather_location->location_name }} </span>
                                {{ /list_weather_stats }}
                            </a>
                        </li>
                    </ul>
