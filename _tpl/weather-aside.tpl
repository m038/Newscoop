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

                <div id='mn-teaser-slopes'>
                    <div class="box">
                        <h4 class="box-title"><img alt="" src='{{ url static_file="assets/img/beachball.png"}}'> Pistenbericht</h4>
                        <table id='mn-teaser-slopes-table' cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col width="">
                                <col width="100">
                            </colgroup>
                            <tbody>
                                {{ list_weather_stats location_list="teaser_slopes" }}
                                   <tr>
                                        <th><p><strong><a href='#'  class='mn-lokalwetter-region-item' data-role='link' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong><br>{{ $gimme->weather_location->region_name }}</p></th>
                                        <td><img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }} / {{ $gimme->weather_location->temperature_min }}</td>
                                    </tr>  
                                {{ /list_weather_stats }}
                            </tbody>
                        </table>
                        <a id='mn-pistenbericht' href="#" class="button white center mn-menu-item">Zum Pistenbericht</a>
                    </div>
                </div>
                
                <!-- slope web cam -->
                <div id="mn-slope-webcam" class="box">
                    <h4 class="box-title no-bottom-margin">Webcam</h4>
                    <div class="single-img-box">
                        <a class="zoom fancybox" href="pictures/gallery-img-2.jpg">Zoom</a>
                        <img src='{{ url static_file="assets/img/meteonews/weather-side-img.jpg" }}' alt="">
                    </div>
                </div>

                <!-- region web cams -->
                <div id="mn-region-webcam" class="box webcams-slideshow mobile-hide">
                    <h4 class="box-title no-bottom-margin">Webcams aus der Region</h4>
                    <div class="slideshow">
                        <ul class="slides" style="position: relative; width: 350px; height: 301px; overflow: hidden;">
                            <li style="position: absolute; top: 0px; left: 0px; display: list-item; z-index: 3; opacity: 1;">
                                <a class="zoom fancybox" href="pictures/gallery-img-2.jpg">Zoom</a>
                                <img src='{{ url static_file="assets/img/meteonews/weather-side-img.jpg" }}' alt="">
                                <p>Name Gebiet (1/2)</p>
                            </li>
                            <li style="position: absolute; top: 0px; left: 0px; display: none; z-index: 1;">
                                <a class="zoom fancybox" href="pictures/gallery-img-2.jpg">Zoom</a>
                                <img src='{{ url static_file="assets/img/meteonews/weather-side-img.jpg" }}' alt="">
                                <p>Name Gebiet (2/2)</p>
                            </li>
                        </ul>
                        <ul class="paging">
                            <li><a href="#" class="button white prev">‹</a></li>
                            <li><a href="#" class="button white next">›</a></li>
                        </ul>
                    </div>
                </div>

                <!-- slope map -->
                <div id="mn-slope-map" class="box">
                    <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Zug,+Switzerland&amp;aq=0&amp;oq=zug&amp;sll=37.0625,-95.677068&amp;sspn=53.080379,39.726562&amp;ie=UTF8&amp;hq=&amp;hnear=Zug,+Canton+of+Zug,+Switzerland&amp;t=m&amp;z=12&amp;ll=47.174589,8.513854&amp;output=embed"></iframe>
                </div>

                <!-- advertisement -->
                <div id='mn-teaser-3'>
                    <div class="box ad top-line">
                        <small>Werbung</small>
                        <img src='{{ url static_file="assets/img/ad-2.jpg"}}' alt="">
                    </div>
                </div>

            </div><!-- / Aside -->
