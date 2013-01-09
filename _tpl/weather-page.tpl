        
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

                {{ include file="_tpl/weather-prognosen.tpl" }}
                
                {{ include file="_tpl/weather-lokkalwetter.tpl" }}

                {{ include file="_tpl/weather-pistenbericht.tpl" }}

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
