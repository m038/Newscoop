          <ul class="weather">
                <li class="expandable">
                    <a href="#">
                            <img id="luzern-img-now" src='' class='mn-symbol-small' alt>
                            <span id="luzern-temp-now"></span>

                            <img id="zug-img-now" src='' class='mn-symbol-small' alt>
                            <span id="zug-temp-now"></span>
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
                                            <img id="luzern-img-1200" src='' class='mn-symbol-small' alt>
                                            <p id="luzern-temp-1200"></p>
                                    </li>
                                    <li>
                                        <small>15:00</small>
                                            <img id="luzern-img-1500" src='' class='mn-symbol-small' alt>
                                            <p id="luzern-temp-1500"></p>
                                    </li>
                                    <li>
                                        <small>18:00</small>
                                            <img id="luzern-img-1800" src='' class='mn-symbol-small' alt>
                                            <p id="luzern-temp-1800"></p>
                                    </li>
                                    <li>
                                        <small>21:00</small>
                                            <img id="luzern-img-2100" src='' class='mn-symbol-small' alt>
                                            <p id="luzern-temp-2100"></p>
                                    </li>
                                    <li>
                                        <small>00:00</small>
                                            <img id="luzern-img-0000" src='' class='mn-symbol-small' alt>
                                            <p id="luzern-temp-0000"></p>
                                    </li>
                                </ul>
                                {{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" length="1" constraints="type is weather_page" }}
                                <p><strong>Das Wetter heute in Zug</strong> <a href="{{ url options="article" }}?pg=local&location_id=2657907&location_name=Zug" class="button white">Details</a></p>
                                {{ /list_articles }}
                                <ul>
                                    <li>
                                        <small>12:00</small>
                                            <img id="zug-img-1200" src='' class='mn-symbol-small' alt>
                                            <p id="zug-temp-1200"></p>
                                    </li>
                                    <li>
                                        <small>15:00</small>
                                            <img id="zug-img-1500" src='' class='mn-symbol-small' alt>
                                            <p id="zug-temp-1500"></p>
                                    </li>
                                    <li>
                                        <small>18:00</small>
                                            <img id="zug-img-1800" src='' class='mn-symbol-small' alt>
                                            <p id="zug-temp-1800"></p>
                                    </li>
                                    <li>
                                        <small>21:00</small>
                                            <img id="zug-img-2100" src='' class='mn-symbol-small' alt>
                                            <p id="zug-temp-2100"></p>
                                    </li>
                                    <li>
                                        <small>00:00</small>
                                            <img id="zug-img-0000" src='' class='mn-symbol-small' alt>
                                            <p id="zug-temp-0000"></p>
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
                                    <li><a href="{{ url options="article"}}?pg=badewetter">Badewetter</a></li>
                                    {{ /list_articles }}
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
