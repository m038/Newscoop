                    <ul class="weather phone-weather-box">
                        <li>
                            {{ list_articles ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                            <a href="{{ url options="article"}}?pg=prognosen">
                            {{ /list_articles }}
                                    <img id="luzern-img-now" src='' class='mn-symbol-small' alt>
                                    <span id="luzern-temp-now"></span>

                                    <img id="zug-img-now" src='' class='mn-symbol-small' alt>
                                    <span id="zug-temp-now"></span>
                            </a>
                        </li>
                    </ul>
