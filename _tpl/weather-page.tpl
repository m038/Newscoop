        
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
                    <!-- <li id='mn-badewetter' class='mn-menu-item'><a href="#">Badewetter</a></li> -->
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
                
                {{ render file="_tpl/weather-lokkalwetter.tpl" }}

                {{ include file="_tpl/weather-wintersport.tpl" }}

                {{ include file="_tpl/weather-badewetter.tpl" }}

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
                //meteonews.showLocalWeatherPage();
                meteonews.hideAllElements();
                setTimeout(function() {
                    meteonews.showLocalWeatherPage();
                }, 2500);
                
            }
        } else if (pg == 'prognosen') {
            meteonews.showPrognosenPage();
        } else if (pg == 'wintersport') {
            meteonews.showWintersportPage();
        } else if (pg == 'badewetter') {
            meteonews.showBadewetterPage();
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
        $('#mn-all-baths-caption').html(cPage + ' von '+cPages);

        var cPrev = $('#mn-all-baths-prev');
        var cNext = $('#mn-all-baths-next');
        var cFirst = $('#mn-all-baths-first');
        var cLast = $('#mn-all-baths-last');

        /* start with previous disabled */
        cPrev.addClass('disabled');

        cFirst.click(function() {
            cPage = 1;
            cRows.hide();
            cRows.filter(':lt(' + maxRows + ')' ).show();
            $('#mn-all-baths-caption').html(cPage + ' von '+cPages);
            cPrev.addClass('disabled');
            cNext.removeClass('disabled');
            return false;
        });

        cLast.click(function() {
            cPage = cPages;
            cRows.hide();
            cRows.filter(':gt(' + (cRowCount - maxRows) + ')' ).show();
            $('#mn-all-baths-caption').html(cPage + ' von '+cPages);
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
            $('#mn-all-baths-caption').html(cPage + ' von '+cPages);
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
            $('#mn-all-baths-caption').html(cPage + ' von '+cPages);
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

    // meteonews event handlers
    $('#mn-search-btn').live('click', function() {
        meteonews.hideAllElements();
        meteonews.getSearchResults($('#mn-search-text').val());
    });

    $('#mn-lokalwetter-search-btn').live('click', function() {
        meteonews.hideAllElements();
        meteonews.getSearchResults($('#mn-lokalwetter-search-text').val());
    });

    $('.mn-search-result').live('click', function() {
        meteonews.showFiveDayForecastPage($(this).attr('data-id'), $(this).attr('data-zip'), $(this).attr('data-name'));
    });

    $('.mn-forecast-details-btn').live('click', function() {
        var date = meteonews.getDateObj($(this).attr('data-date'));
        meteonews.getDailyForecastDetails(date);
        return false;
    });

    /* main menu items */
    $('#mn-lokalwetter').live('click', function() {
        meteonews.showLocalWeatherPage();
        return false;
    });

    $('#mn-prognosen').live('click', function() {
        meteonews.showPrognosenPage()
        return false;
    });

    $('#mn-wintersport').live('click', function() {
        meteonews.showWintersportPage();
        return false;
    });

    $('#mn-badewetter').live('click', function() {
        meteonews.showBadewetterPage();
        return false;
    });

    $('#mn-wanderwetter').live('click', function() {
        meteonews.showWanderwetterPage();
        return false;
    });

    $(document).on("click", ".mn-lokalwetter-region-item", function() {
        var role = $(this).attr('data-role');
        var type = $(this).attr('data-type');
        if (type) {
            meteonews.setLocationType(type);
        }
        if (role == 'link') {
            meteonews.showFiveDayForecastPage($(this).attr('data-id'), $(this).attr('data-zip'), $(this).attr('data-name'));
        } else {
            meteonews.showSubregions($(this).attr('data-code'), $(this).attr('data-role'));
            $(this).addClass('active');
        }
        return false;
    });

    $('.mn-wintersport-link').live('click', function() {
        meteonews.showWintersportDetailPage($(this).attr('data-type'), $(this).attr('data-id'), $(this).attr('data-name'));
    });


    $('.weather-loctions p.close-search a').live('click', function(){
            $('.weather-loctions').removeClass('no-map');
            $('.weather-loctions ul.level-2, .weather-loctions ul.level-3').hide();
            $('.weather-loctions ul li').removeClass('active');
            $('.weather-loctions p.info').show();
            $(this).parent().hide();
            return false;
    });

    /* Table triggers */
    $('table a.trigger').live('click', function(){
        $(this).toggleClass('active');
        $(this).parent().parent().next('tr.inner').find('.inner-table').slideToggle('fast');
        return false;
    });

    $('.table-collapse-trigger a').live('click', function(){
        $(this).parent().toggleClass('active');
        $(this).parent().next('div').slideToggle('fast');
        return false;
    });
});
</script>
