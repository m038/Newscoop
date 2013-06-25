          <ul class="weather">
                <li class="expandable">
                    <a href="#">
                        {{ list_weather_stats location_name="Luzern" location_list="main_regions" length="1" length = 1  }}
                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                            <span>{{ $gimme->weather_location->temperature }}° {{ $gimme->weather_location->location_name }} </span>
                        {{ /list_weather_stats }}

                        {{ list_weather_stats location_name="Zug" location_list="main_regions" length="1" length = 1  }}
                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                            <span>{{ $gimme->weather_location->temperature }}° {{ $gimme->weather_location->location_name }} </span>
                        {{ /list_weather_stats }}
                    </a>
                    <div class="popup">
                        <div class="weather-popup clearfix">
                            <div class="info">
                                {{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                                <p><strong>Das Wetter heute in Luzern</strong> <a href="{{ url options="article" }}?pg=local&location_id=2659811&location_name=Luzern" class="button white">Details</a></p>
                                {{ /list_articles }}
                                <ul>
                                    <li>
                                        <small>12:00</small>
                                        {{ list_weather_stats location_name="Luzern" location_list="main_regions" hour="12" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>15:00</small>
                                        {{ list_weather_stats location_name="Luzern" location_list="main_regions" hour="15" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>18:00</small>
                                        {{ list_weather_stats location_name="Luzern" location_list="main_regions" hour="18" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>21:00</small>
                                        {{ list_weather_stats location_name="Luzern" location_list="main_regions" hour="21" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>00:00</small>
                                        {{ list_weather_stats location_name="Luzern" location_list="main_regions" hour="0" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                </ul>
                                {{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                                <p><strong>Das Wetter heute in Zug</strong> <a href="{{ url options="article" }}?pg=local&location_id=7287644&location_name=Zug" class="button white">Details</a></p>
                                {{ /list_articles }}
                                <ul>
                                    <li>
                                        <small>12:00</small>
                                        {{ list_weather_stats location_name="Zug" location_list="main_regions" hour="12" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>15:00</small>
                                        {{ list_weather_stats location_name="Zug" location_list="main_regions" hour="15" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>18:00</small>
                                        {{ list_weather_stats location_name="Zug" location_list="main_regions" hour="18" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>21:00</small>
                                        {{ list_weather_stats location_name="Zug" location_list="main_regions" hour="21" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                    <li>
                                        <small>00:00</small>
                                        {{ list_weather_stats location_name="Zug" location_list="main_regions" hour="0" }}
                                            <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small' alt>
                                            <p>{{ $gimme->weather_location->temperature }}°</p>
                                        {{ /list_weather_stats }}
                                    </li>
                                </ul>
                            </div>
                            <div class="sidebar">
                                <fieldset class="search">
                                    <input id='mn-header-search-text' type="text" placeholder="Ort, PLZ, Ausflugsziel">
                                    <input id='mn-header-search-btn' type="submit" value="Go">
{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
<script type="text/javascript">
    $('#mn-header-search-btn').click(function() {
        window.location = '{{ url options="article"}}?pg=search&q='+$('#mn-header-search-text').val();
    });

    $('#mn-header-search-text').keypress(function(e) {
        if (e.which == 13) {
            window.location = '{{ url options="article"}}?pg=search&q='+$('#mn-header-search-text').val();
        }
    });
</script>
{{ /list_articles }} 
                                </fieldset>
                                <p>Geben Sie hier einen Ort oder Region nach Wunsch in der Zentralschweiz ein</p>
                                <ul>
                                    {{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                                    <li><a href='{{ url options="article"}}?pg=prognosen'>Prognosen Zentralschweiz</a></li>
                                    <li><a href="{{ url options="article"}}?pg=local">Lokalwetter</a></li>
                                    <li><a href="{{ url options="article"}}?pg=wanderwetter">Wanderwetter</a></li>
                                    {{ /list_articles }}
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
