                
                <!-- lokalwetter page elements -->
                <div id='mn-lokalwetter-searchform' class="weather-loctions clearfix">
                
                    <p class="info" style="display: block;">Bitte wählen Sie Ihre Region oder geben Sie das gewünschte Ziel in der Suchmaske ein</p>
                    <p class="close-search hide" style="display: none;"><a href="#">Auswahl zurücksetzen</a></p>
                    <div class="left">
                        <fieldset class="search">
                            <input id='mn-lokkalwetter-search-text' type="text" placeholder="Ort, PLZ, Ausflugsziel">
                        <input type="submit" value="Go">
                        </fieldset>
                        <ul id='mn-region-list-level-1' class="mn-lokalwetter-region-list level-1"></ul>
                        <ul id='mn-region-list-level-2' class="mn-lokalwetter-region-list hide level-2" style="display: none;"></ul>
                        <ul id='mn-region-list-level-3' class="mn-lokalwetter-region-list hide level-3" style="display: none;"></ul>
                    </div>
                    <ul class="map right">
                        <li class="zug mn-lokalwetter-region-item" data-name="Zug" data-role="link" data-id="2657908"><a href="#">Zug</a></li>
                        <li class="luzern mn-lokalwetter-region-item" data-name="Luzern" data-role="link" data-id="2659811"><a href="#">Luzern</a></li>
                        <li class="schwyz mn-lokalwetter-region-item" data-name="Schwyz" data-role="link" data-id="2658665"><a href="#">Schwyz</a></li>
                        <li class="entlebuch mn-lokalwetter-region-item" data-name="Entlebuch" data-role="link" data-id="2660887"><a href="#">Entlebuch</a></li>
                        <li class="sarnen mn-lokalwetter-region-item" data-name="Sarnen" data-role="link" data-id="2658786"><a href="#">Sarnen</a></li>
                        <li class="stans mn-lokalwetter-region-item" data-name="Stans" data-role="link" data-id="2658504"><a href="#">Stans</a></li>
                        <li class="altdorf mn-lokalwetter-region-item" data-name="Altdorf" data-role="link" data-id="2661780"><a href="#">Altdorf</a></li>
                        <li class="engelberg mn-lokalwetter-region-item" data-name="Engelberg" data-role="link" data-id="6291961"><a href="#">Engelberg</a></li>
                        <li class="pfaffnau mn-lokalwetter-region-item" data-name="Pfaffnau" data-role="link" data-id="2659218"><a href="#">Pfaffnau </a></li>
                        <li class="escholzmatt mn-lokalwetter-region-item" data-name="Escholzmatt" data-role="link" data-id="2660856"><a href="#">Escholzmatt </a></li>
                        <li class="andermatt mn-lokalwetter-region-item" data-name="Andermatt" data-role="link" data-id="2661750"><a href="#">Andermatt </a></li>
                    </ul>
                
                </div> <!-- / lokal wetter search form -->

                <ul id='mn-forecast-overview' class='five-column-weather-list equal-heights clearfix'></ul>

                <div id='mn-forecast-details' class='spec-tabs'>
                    <!-- forecast overview button bar -->
                    <ul id='mn-forecast-button-bar' class='button-nav top-fix bottom-line' roll='tablist' style=''></ul>

                    <!-- forecast-details-table -->
                    <div class="collapsable-table ui-tabs-panel ui-widget-content ui-corner-bottom" id="tab-1" aria-labelledby="ui-id-1" role="tabpanel" style="" aria-expanded="true" aria-hidden="false">
                        <a href="#" class="button white prev next-tab mover" rel="2" style="display: none;">&gt;</a>
                        <h4 id='mn-prognose-date'></h4>
                        <div class='table-wrapper'>
                            <table id='mn-forecast-details-table' cellpadding='0' cellspacing='0'>
                                <colgroup>
                                    <col width="68">
                                    <col width="190">
                                    <col width="100">
                                    <col width="170">
                                    <col width="135">
                                    <col width="">
                                </colgroup>
                                <tbody id='mn-forecast-details-table-body'>
                                </tbody>
                            </table>
                        </div>
                    </div><!-- / forecast-details-table -->
 
                </div><!-- / forecast details container -->

                <div id='mn-lokalwetter-regions-container' class='two-column-tables clearfix equal-heights'>
                    <div id='mn-primary-regions' class='box left'>
                        <h3>Wichtigste Orte</h3>
                        <table id='mn-primary-regions-table' cellpadding='0' cellspacing='0' class='top-line'>
                            <colgroup>
                                <col width="">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="important_regions" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>{{ $gimme->weather_location->elevation }}m ü.M.</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr> 
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div><!-- / mn-primary-regions -->
                    <div id='mn-secondary-regions' class='box right'>
                        <h3>Beliebteste Ausflugziele</h3>
                        <table id='mn-secondary-regions-table' cellpadding='0' cellspacing='0' class='top-line'>
                            <colgroup>
                                <col width="">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="important_winter_regions" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>{{ $gimme->weather_location->region_name }}</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr> 
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div><!-- / mn-secondary-regions -->
                </div><!-- / mn-lokalwetter-regions-container -->
