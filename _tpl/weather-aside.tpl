            <div class="aside">

                <div id='mn-sun-and-moon'>
                    <div class="box mobile-border-top">
                        <h4 class="box-title mobile-hide">Sonne und Mond</h4>
                        <ul class="two-column-weather-list clearfix">
                            <li class="left">
                                <img src='{{ url static_file="assets/img/meteonews/symb/icon-sun-64.jpg"}}' alt=''>
                                <p id='mn-sun-up' class="up"></p>
                                <p id='mn-sun-down' class="down"></p>
                            </li>
                            <li class="right">
                                <img src='{{ url static_file="assets/img/meteonews/symb/icon-moon-64.jpg"}}' alt=''>
                                <p id='mn-moon-up' class="up"></p>
                                <p id='mn-moon-down' class="down"></p>
                            </li>
                        </ul>
                    </div>
                </div>

                <div id='mn-teaser-wander'>
                    <div class="box">
                        <h4 class="box-title"><img alt="" src='{{ url static_file="assets/img/icon_wanderwetter.png"}}'> <span id="teaser-header">Wanderwetter</span></h4>
                        <table id='mn-teaser-wander-table' cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col width="">
                                <col width="105">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="wander_teaser_regions" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-type='geonames' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>{{ $gimme->weather_location->region_name }} ({{ $gimme->weather_location->elevation}}m ü.M.)</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr>  
                                {{ /list_weather_stats }}
                            </tbody>
                        </table>
                        <a id='mn-wanderwetter' href="#" class="button white center mn-menu-item">Zum Wanderwetter</a>
                    </div>
                </div>

                <div id='mn-teaser-slopes'>
                    <div class="box">
                        <h4 class="box-title"><img alt="" src='{{ url static_file="assets/img/beachball.png"}}'> <span id="teaser-header">Badewetter</span></h4>
                        <table id='mn-teaser-slopes-table' cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col width="">
                                <col width="105">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="teaser_regions" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-type='mexs' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>{{ $gimme->weather_location->region_name }}</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr>  
                                {{ /list_weather_stats }}
                            </tbody>
                        </table>
                        <a id='mn-wanderwetter' href="#" class="button white center mn-menu-item">Zum Wanderwetter</a>
                    </div>
                </div>
                
                <!-- slope web cam -->
                <div id="mn-slope-webcam" class="box">
                    <h4 class="box-title no-bottom-margin">Webcam</h4>
                    <div id="mn-slope-webcam-content" class="single-img-box">
                    </div>
                </div>

                <!-- region web cams -->
                <div id="mn-region-webcam" class="box webcams-slideshow mobile-hide">
                    <h4 class="box-title no-bottom-margin">Webcams aus der Region</h4>
                    <div id='mn-webcam-slideshow' class="slideshow">
                        <ul id="mn-region-webcam-content" class="slides" style='height: 345px;'>
                        </ul>
                        <ul class="paging" style='z-index: 1000'>
                            <li><a id='mn-webcam-prev' href="#" class="button white prev">‹</a></li>
                            <li><a id='mn-webcam-next' href="#" class="button white next">›</a></li>
                        </ul>
                    </div>
                </div>

                <!-- slope map -->
                <div id="mn-slope-map" class="box" style="height: 350px; width: 350px;">
                </div>

                <!-- advertisement -->
                <div id='mn-teaser-3'>
                    <!--
                    <div class="box ad top-line">
                        <small>Werbung</small>
                        <img src='' alt="">
                    </div>
                    -->
                </div>

            </div><!-- / Aside -->
