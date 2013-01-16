{{ if $isMobDevice }}
<!-- single zone invocation -->
{{ else }}
<!-- single zone invocation -->
{{ /if }}
                    <ul class="weather phone-weather-box">
                        <li>
                            <a href="#">
                                <img src="{{ uri static_file="pictures/icon-weather-1.png" }}" alt=""><span>25&deg; Luzern</span>
                                <img src="{{ uri static_file="pictures/icon-weather-2.png" }}" alt=""><span>25&deg; Zug</span>
                            </a>
                        </li>
                    </ul>