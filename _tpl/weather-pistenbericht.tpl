
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
                
                    <div id='mn-pistenbericht-details-prognosen'>
                        <div class="spec-tabs ui-tabs ui-widget ui-widget-content ui-corner-all">
                
                            <ul class="button-nav bottom-line ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist" style="display: block;">
                                <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="table-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="#table-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1"><span class="mobile-hide">Details</span> 15.10</a></li>
                                <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-2" aria-labelledby="ui-id-2" aria-selected="false"><a href="#table-2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2"><span class="mobile-hide">Details</span> 16.10</a></li>
                                <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-3" aria-labelledby="ui-id-3" aria-selected="false"><a href="#table-3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3"><span class="mobile-hide">Details</span> 17.10</a></li>
                                <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-4" aria-labelledby="ui-id-4" aria-selected="false"><a href="#table-4" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-4"><span class="mobile-hide">Details</span> 18.10</a></li>
                                <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="table-5" aria-labelledby="ui-id-5" aria-selected="false"><a href="#table-5" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-5"><span class="mobile-hide">Details</span> 19.10</a></li>
                            </ul>
                        
                            <div id="table-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="" aria-expanded="true" aria-hidden="false"><a href="#" class="button white prev next-tab mover" rel="2" style="display: none;">&gt;</a>
                            
                                <h4><a href="#">Prognose 15.10</a></h4>
                                
                                <div class="table-wrapper top-line">
                            
                                    <table cellpadding="0" cellspacing="0">
                                        <colgroup>
                                            <col width="">
                                            <col width="80">
                                        </colgroup>
                                        <tbody><tr>
                                            <td colspan="2"><p><strong>In der Nähe</strong></p></td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                    </tbody></table>
                                
                                </div>
                            
                            </div>
                            
                            <div id="table-2" aria-labelledby="ui-id-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true"><a href="#" class="button white next prev-tab mover" rel="1" style="display: none;">&lt;</a><a href="#" class="button white prev next-tab mover" rel="3" style="display: none;">&gt;</a>
                            
                                <h4><a href="#">Prognose 16.10</a></h4>
                                
                                <div class="table-wrapper top-line">
                            
                                    <table cellpadding="0" cellspacing="0">
                                        <colgroup>
                                            <col width="">
                                            <col width="80">
                                        </colgroup>
                                        <tbody><tr>
                                            <td colspan="2"><p><strong>In der Nähe</strong></p></td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                    </tbody></table>
                                
                                </div>
                            
                            </div>
                            
                            <div id="table-3" aria-labelledby="ui-id-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true"><a href="#" class="button white next prev-tab mover" rel="2" style="display: none;">&lt;</a><a href="#" class="button white prev next-tab mover" rel="4" style="display: none;">&gt;</a>
                            
                                <h4><a href="#">Prognose 17.10</a></h4>
                                
                                <div class="table-wrapper top-line">
                            
                                    <table cellpadding="0" cellspacing="0">
                                        <colgroup>
                                            <col width="">
                                            <col width="80">
                                        </colgroup>
                                        <tbody><tr>
                                            <td colspan="2"><p><strong>In der Nähe</strong></p></td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                    </tbody></table>
                                
                                </div>
                            
                            </div>
                            
                            <div id="table-4" aria-labelledby="ui-id-4" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true"><a href="#" class="button white next prev-tab mover" rel="3" style="display: none;">&lt;</a><a href="#" class="button white prev next-tab mover" rel="5" style="display: none;">&gt;</a>
                            
                                <h4><a href="#">Prognose 18.10</a></h4>
                                
                                <div class="table-wrapper top-line">
                            
                                    <table cellpadding="0" cellspacing="0">
                                        <colgroup>
                                            <col width="">
                                            <col width="80">
                                        </colgroup>
                                        <tbody><tr>
                                            <td colspan="2"><p><strong>In der Nähe</strong></p></td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                    </tbody></table>
                                
                                </div>
                            
                            </div>
                            
                            <div id="table-5" aria-labelledby="ui-id-5" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true"><a href="#" class="button white next prev-tab mover" rel="4" style="display: none;">&lt;</a>
                            
                                <h4><a href="#">Prognose 19.10</a></h4>
                                
                                <div class="table-wrapper top-line">
                            
                                    <table cellpadding="0" cellspacing="0">
                                        <colgroup>
                                            <col width="">
                                            <col width="80">
                                        </colgroup>
                                        <tbody><tr>
                                            <td colspan="2"><p><strong>In der Nähe</strong></p></td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                        <tr>
                                            <td><p><strong>Name des Skigebiets</strong><br>Sonnig, Pulver/gut</p></td>
                                            <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> -3°</td>
                                        </tr>
                                    </tbody></table>
                                
                                </div>
                            
                            </div>
                        
                        </div>
                    </div><!-- mn-pistenbericht-details-prognosen -->
                </div><!-- / mn-pistenbericht-details -->
