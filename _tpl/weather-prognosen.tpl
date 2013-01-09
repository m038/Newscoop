                <!-- prognosen page elements -->
                <div id='mn-prognosen-regions'>
                    <h3 class='top-line phone-hide'>Wichtigste Orte</h3>
                    <div class='two-column-tables clearfix equal-heights phone-hide'>
                        <div class="box left" style="height: 272px;">
                            <table id='mn-prognosen-regions-left-table' cellpadding='0' cellspacing='0'class='top-line'>
                                <colgroup>
                                    <col width>
                                    <col width='100'>
                                </colgroup>
                                <tbody>
                                {{ list_weather_stats location_list="important_regions" length="5" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>{{ $gimme->weather_location->region_name }}</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr> 
                                {{ /list_weather_stats }} 
                                </tbody>
                            </table>
                        </div>
                        <div class="box right" style="height: 272px;">
                            <table id='mn-prognosen-regions-right-table' cellpadding='0' cellspacing='0'class='top-line'>
                                <colgroup>
                                    <col width>
                                    <col width='100'>
                                </colgroup>
                                <tbody>
                                {{ list_weather_stats location_list="important_regions" length="5" start="5" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>{{ $gimme->weather_location->region_name }}</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr> 
                                {{ /list_weather_stats }} 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- / mn-prognosen-regions -->
                <article>
                    <div id='mn-prognosen-text' class='mobile-hide details-placeholder'></div>
                </article>
