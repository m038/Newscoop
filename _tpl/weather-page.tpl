        
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
                    <li id='mn-wanderwetter' class='mn-menu-item'><a href="#">Wanderwetter</a></li>
                    <!-- <li id='mn-wintersport' class='mn-menu-item'><a href="#">Wintersport</a></li> -->
                </ul>
            
            </div>

            <div class="main">
                <h2 id='mn-header-location-title' class="phone-hide"></h2>

                <div id='mn-status'></div>

                <!-- weather api search results -->
                <div id='mn-search-results' class='div-table'></div>

                {{ include file="_tpl/weather-prognosen.tpl" }}

                {{ include file="_tpl/weather-wanderwetter.tpl" }}
                
                {{ include file="_tpl/weather-lokkalwetter.tpl" }}

                {{ include file="_tpl/weather-wintersport.tpl" }}

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
        } else if (pg == 'prognosen') {
            meteonews.showPrognosenPage();
        } else if (pg == 'wintersport') {
            meteonews.showWintersportPage();
        } else if (pg == 'wanderwetter') {
            meteonews.showWanderwetterPage();
        } else if (pg == 'search') {
            meteonews.hideAllElements();
            meteonews.getSearchResults('{{ $smarty.get.q }}');
        } else {
            meteonews.showLocalWeatherPage();
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

    $('#mn-lokkalwetter-search-text').keypress(function(e) {
        if (e.which == 13) {
            $(this).autocomplete("close");     
            meteonews.hideAllElements();
            meteonews.getSearchResults($(this).val()); 
        }
    });

    $('#mn-search-text').keypress(function(e) {
        if (e.which == 13) {
            $(this).autocomplete("close");     
            meteonews.hideAllElements();
            meteonews.getSearchResults($(this).val()); 
        }
    });

    /* pagination */
    $('.paginated-table').each(function() {
        var maxRows = 7;
        var cPage = 1;
        var cTable = $(this);
        var cRows = cTable.find('tr');
        var cRowCount = cRows.size();
        var cPages = Math.round(cRowCount / maxRows);

        if (cRowCount < maxRows) {
            return;
        }

        /* hide all rows above the max initially */
        cRows.filter(':gt(' + (maxRows - 1) + ')').hide();

        /* update caption */
        $('#mn-all-slopes-caption').html(cPage + ' von '+cPages);

        var cPrev = $('#mn-all-slopes-prev');
        var cNext = $('#mn-all-slopes-next');
        var cFirst = $('#mn-all-slopes-first');
        var cLast = $('#mn-all-slopes-last');

        /* start with previous disabled */
        cPrev.addClass('disabled');

        cFirst.click(function() {
            cPage = 1;
            cRows.hide();
            cRows.filter(':lt(' + maxRows + ')' ).show();
            $('#mn-all-slopes-caption').html(cPage + ' von '+cPages);
            cPrev.addClass('disabled');
            cNext.removeClass('disabled');
            return false;
        });

        cLast.click(function() {
            cPage = cPages;
            cRows.hide();
            cRows.filter(':gt(' + (cRowCount - maxRows) + ')' ).show();
            $('#mn-all-slopes-caption').html(cPage + ' von '+cPages);
            cPrev.removeClass('disabled');
            cNext.addClass('disabled');
            return false;
        });

        cPrev.click(function() {
            var cFirstVisible = cRows.index(cRows.filter(':visible'));

            if (cPrev.hasClass('disabled')) {
                return false;
            }

            cPage--;
            $('#mn-all-slopes-caption').html(cPage + ' von '+cPages);
            cRows.hide();
            if (cFirstVisible - maxRows - 1 > 0) {
                cRows.filter(':lt(' + cFirstVisible + '):gt(' + (cFirstVisible - maxRows - 1) + ')').show();
            } else {
                cRows.filter(':lt(' + cFirstVisible + ')').show();
            }

            if (cFirstVisible - maxRows <= 0) {
                cPrev.addClass('disabled');
            }

            cNext.removeClass('disabled');

            return false;
        });

        cNext.click(function() {
            var cFirstVisible = cRows.index(cRows.filter(':visible'));

            if (cNext.hasClass('disabled')) {
                return false;
            }

            cPage++;
            $('#mn-all-slopes-caption').html(cPage + ' von '+cPages);
            cRows.hide();
            cRows.filter(':lt(' + (cFirstVisible +2 * maxRows) + '):gt(' + (cFirstVisible + maxRows - 1) + ')').show();

            if (cFirstVisible + 2 * maxRows >= cRows.size()) {
                cNext.addClass('disabled');
            }

            cPrev.removeClass('disabled');

            return false;
        });
    });
    /* end pagination */

});
</script>
