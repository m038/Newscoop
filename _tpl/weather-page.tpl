        
        <div class="content clearfix weather-content">
            <!-- meteonews weather header and menus -->
            <div class="weather-filter clearfix">
            
                <fieldset id='mn-searchform' class="search phone-hide">
                    <input id='mn-search-text' type="text" placeholder="Ort, PLZ, Ausflugsziel">
                    <input id='mn-search-btn' type="submit" value="Go">
                </fieldset>
                <ul>
                    <li id='mn-prognosen' class='mn-menu-item'><a href="#">Prognosen Zentralschweiz</a></li>
                    <li id='mn-lokalwetter' class='mn-menu-item'><a href="#">Lokalwetter</a></li>
                    <li id='mn-pistenbericht' class='mn-menu-item'><a href="#">Pistenbericht</a></li>
                </ul>
            
            </div>

            <div class="main">
                <h2 id='mn-header-location-title' class="phone-hide"></h2>

                <div id='mn-status'></div>

                <!-- weather api search results -->
                <div id='mn-search-results' class='div-table'></div>

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

                <div id='mn-forecast-details' class='spec-tabs ui-tabs ui-widget ui-widget-content ui-corner-all'>
                    <!-- forecast overview button bar -->
                    <ul id='mn-forecast-button-bar' class='button-nav top-fix bottom-line ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all' roll='tablist' style='display: black;'></ul>

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
                    <div id='mn-primary-regions' class='box left' style='height: 550px;'>
                        <h3>Wichtigste Orte</h3>
                        <table id='mn-primary-regions-table' cellpadding='0' cellspacing='0' class='top-line'>
                            <colgroup>
                                <col width="">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="important_regions" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>550M</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr> 
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div><!-- / mn-primary-regions -->
                    <div id='mn-secondary-regions' class='box right' style='height: 550px;'>
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

                <!-- pistenbericht elements -->
                <div id='mn-pistenbericht-important-slopes'>
                    <h3 class='top-line'>Beliebte Ziele</h3>
                    <table id='mn-pistenbericht-important-slopes-table' cellpadding='0' cellspacing='0' class='top-line second-row-phone-hide'>
                        <colgroup>
                            <col width>
                            <col width='350'>
                            <col width='100'>
                        </colgroup>
                        <tbody>
                                {{ list_weather_stats location_list="important_winter_slopes" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                        </tbody>
                    </table>
                </div><!-- / mn-pistenbericht-important-slopes -->

                <div id='mn-pistenbericht-all-regions' class='tabs ui-tabs ui-widget ui-widget-content ui-corner-all'>
                    <h3>Alle Pistenberichte</h3>
                    <fieldset class="alt-nav desktop-hide mobile-hide">
                        <label>Zeige</label>
                        <div id="dropdownized-1" class="ui-dropdownized dropdownized" style="cursor: pointer; position: relative; z-index: 1; width: 100px;"><div style="position: absolute; cursor: pointer; display: block; left: 0px; top: 0px; z-index: -1; overflow: hidden; line-height: 28px;">Alle Kantone</div><select class="" style="opacity: 0; display: block; cursor: pointer; float: left; left: 0px; top: 0px; bottom: 0px; right: 0px; height: 100%; width: 100%; margin: 0px; padding: 0px; background-color: transparent; z-index: 5;">
                            <option>Alle Kantone</option>
                            <option>Luzern</option>
                            <option>Uri</option>
                            <option>Schwyz</option>
                            <option>Obwalden</option>
                            <option>Nidwalden</option>
                            <option>Zug</option>
                        </select></div>
                    </fieldset>
                    <ul class="highlighted-tab-nav clearfix phone-hide ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
                        <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="table-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="#table-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">Alle Kantone</a></li>
                        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-2" aria-labelledby="ui-id-2" aria-selected="false"><a href="#table-2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">Luzern</a></li>
                        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-3" aria-labelledby="ui-id-3" aria-selected="false"><a href="#table-3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">Uri</a></li>
                        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-4" aria-labelledby="ui-id-4" aria-selected="false"><a href="#table-4" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-4">Schwyz</a></li>
                        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-5" aria-labelledby="ui-id-5" aria-selected="false"><a href="#table-5" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-5">Obwalden</a></li>
                        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-6" aria-labelledby="ui-id-6" aria-selected="false"><a href="#table-6" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-6">Nidwalden</a></li>
                        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-7" aria-labelledby="ui-id-7" aria-selected="false"><a href="#table-7" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-7">Zug</a></li>
                    </ul>
                    <div id="table-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: block;" aria-expanded="true" aria-hidden="false">
                                    
                        <table cellpadding="0" cellspacing="0" class="top-line second-row-phone-hide">
                            <colgroup>
                                <col width="">
                                <col width="350">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="all_slopes" length="7" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                        
                        <ul class="paging center">
                            <li><a class="button white prev" href="#">‹‹</a></li>
                            <li><a class="button white prev" href="#">‹</a></li>
                            <li class="caption">1 von 2</li>
                            <li><a class="button white next" href="#">›</a></li>
                            <li><a class="button white next" href="#">››</a></li>
                        </ul>
                        
                    </div>

                    <div id="table-2" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true">
                        <table cellpadding="0" cellspacing="0" class="top-line second-row-phone-hide">
                            <colgroup>
                                <col width="">
                                <col width="350">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="all_slopes" region_name="Luzern" length="7" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div>

                    <div id="table-3" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true">
                        <table cellpadding="0" cellspacing="0" class="top-line second-row-phone-hide">
                            <colgroup>
                                <col width="">
                                <col width="350">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="all_slopes" region_name="Uri" length="7" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div>

                    <div id="table-4" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true">
                        <table cellpadding="0" cellspacing="0" class="top-line second-row-phone-hide">
                            <colgroup>
                                <col width="">
                                <col width="350">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="all_slopes" region_name="Schwyz" length="7" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div>

                    <div id="table-5" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true">
                        <table cellpadding="0" cellspacing="0" class="top-line second-row-phone-hide">
                            <colgroup>
                                <col width="">
                                <col width="350">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="all_slopes" region_name="Obwalden" length="7" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div>

                    <div id="table-6" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true">
                        <table cellpadding="0" cellspacing="0" class="top-line second-row-phone-hide">
                            <colgroup>
                                <col width="">
                                <col width="350">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="all_slopes" region_name="Nidwalden" length="7" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div>

                    <div id="table-7" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true">
                        <table cellpadding="0" cellspacing="0" class="top-line second-row-phone-hide">
                            <colgroup>
                                <col width="">
                                <col width="350">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="all_slopes" region_name="Zug" length="7" }}
                                    {{ include file="_tpl/weather-all-slopes.tpl" }}
                                {{ /list_weather_stats }} 
                            </tbody>
                        </table>
                    </div>
 
                </div><!-- / mn-pistenbericht-all-regions -->

                <div id='mn-pistenbericht-details'>
                    <div id='mn-pistenbericht-details-info' class="top-weather-info-detail top-line bottom-line">
                        <time id='mn-pistenbericht-details-time'></time>
                        <ul id='mn-pistenbericht-details-list'>
                        </ul>
                    </div><!-- / mn-pistenbericht-details-info -->

                    <div id='mn-pistenbericht-details-container' class="simple-table">
                    </div><!-- / mn-pistenbericht-details-container --> 

                </div><!-- / mn-pistenbericht-details -->

            </div><!-- / Main -->
            
            {{ include file="_tpl/weather-aside.tpl" }}

        </div><!-- / Content -->

<script type="text/javascript">
$(document).ready(function(){
    // initialize weather widget
    // and set localized paths
    meteonews.init(function() {
        meteonews.setSymbolsPath('{{ url static_file="assets/img/meteonews/symb/" }}');
        
        // process url parameters to set init page
        var pg = '{{ $smarty.get.pg }}';
        var locationId = '{{ $smarty.get.location_id }}';
        var locationName = '{{ $smarty.get.location_name }}';

        if (pg == 'local') {
            if ((locationId.length > 0) && (locationName.length > 0)) {
                meteonews.showFiveDayForecastPage(locationId, '', locationName);
            } else {
                meteonews.showLocalWeatherPage();
            }
        }
        if (pg == 'prognosen') {
            meteonews.showPrognosenPage();
        }
        if (pg == 'pistenbericht') {
            meteonews.showPistenberichtPage();
        }
    });

    /* Autocompletes */
    $('#mn-search-text').autocomplete({
        source: function (request, response) {
            meteonews.autoCompleteLookup(request, response);
        },
        select: function(event, ui) {
            meteonews.showFiveDayForecastPage(ui.item.id, '', ui.item.label);
        }
    });

    $('#mn-lokkalwetter-search-text').autocomplete({
        source: function (request, response) {
            meteonews.autoCompleteLookup(request, response);
        },
        select: function(event, ui) {
            meteonews.showFiveDayForecastPage(ui.item.id, '', ui.item.label);
        }
    });
});
</script>
