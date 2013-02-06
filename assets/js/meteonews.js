/*
 * Meteonews api interface
 *
 * author: Mark Lewis
 */
var meteonews = {

    domain: 'http://feeds-devel.meteonews.net',
    //domain: 'http://mmv.feeds.meteonews.net',
    format: 'xml',
    lang: 'de',
    proxyUrl: '/meteonews/proxy/',
    configUrl: '/meteonews/config/',
    symbolsPath: '',
    initialized: false,
    
    defaultLocationId: '',
    defaultLocationName: '',
    defaultLocationZip: '',

    // region and slope list from config
    mainRegions: [],
    importantRegions: [],
    localRegions: [],
    importantWinterRegions: [],
    importantWinterSlopes: [],
    teaserSlopes: [],

    searchResults: [],

    locationType: 'geonames',
    locationId: null,
    locationName: null,
    locationZip: null,

    startDate: null,
    endDate: null,
    cumulation: '3h',

    // state vars
    cache: {},

    elementList: [ 'mn-search-results', 'mn-forecast-details', 'mn-lokalwetter-regions-container',
        'mn-forecast-overview', 'mn-primary-regions', 'mn-secondary-regions', 'mn-prognosen-regions',
        'mn-prognosen-text', 'mn-lokalwetter-searchform', 'mn-wintersport-important-slopes',
        'mn-wintersport-all-regions', 'mn-wintersport-details', 'mn-sun-and-moon', 'mn-teaser-slopes',
        'mn-slope-webcam', 'mn-region-webcam', 'mn-slope-map', 'mn-wintersport-details-prognosen' ],

    // map vars
    geocoder: null,
    map: null,
    mapMarkers: [],

    // translations
    translations:  {
        'ski' : 'Wintersport',
        'condition' : 'Zustand',
        'snow_condition' : 'Schnee-/Pistenzustand',
        'facilities' : 'Offene Anlagen',
        'crosscountry' : 'Langlauf',
        'toboggan'  : 'Schlitteln',
        'avalanches' : 'Lawinen',
        'alarm' : 'Lawinengefahr',
        'general' : 'Allgemein',
        'phone' : 'Telefon',
        'snowdepth_top' : 'Schneehöhe Berg',
        'status' : 'Zustand',
        'snowdepth_valley' : 'Schneehöhe im Tal',
        'last_snowfall' : 'Letzter Schneefall Pistengebiet',
        'source' : 'Quelle',
        'temp' : 'Temperatur',
        'temp_min' : 'Temp min.',
        'temp_max' : 'Temp max.',
        'gustforce' : 'Böen',
        'glob_rad' : 'Globalstrahlung',
        'hum' : 'Luftfeuchtigkeit',
        'precip' : 'Niederschlagsmenge',
        'precip_prob' : 'Niederschlagswahrscheinlichkeit',
        'freez_level' : 'Nullgradgrenze',
        'temp_dew' : 'Taupunkt',
        'windforce' : 'Windgeschwindigkeit',
        'winddir' : 'Windrichtung',
        'temp_wind' : 'Windchill',
        'pres': 'Luftdruck',
        'open': 'Offen',
        'closed': 'Geschlossen'
    },

    init: function(cb) {
        this.hideAllElements();
        this.getConfig(cb);
        var date = new Date();
        this.setStartDate(date);
        date.setDate(date.getDate() + 5);
        this.setEndDate(date);
        this.setLocation(this.defaultLocationId, this.defaultLocationZip, this.defaultLocationName);
        this.hideAllElements();
        this.initMap();
        this.initialized = true;
    },

    initMap: function() {
        this.geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(47.378, 8.539);
        var mapOptions = {
          zoom: 9,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        this.map = new google.maps.Map(document.getElementById('mn-slope-map'), mapOptions);
        $('#mn-slope-map').show();
        console.log('map initalized');
    },

    setConfig: function(config, cb) {
        for (var i in config) {
            var env = i;
        }
        var config = config[env];
        var locationId = config.default_region.id; 
        var locationName = config.default_region.name; 
        var locationZip = config.default_region.zip; 

        this.domain = config.api_domain;

        this.defaultLocationId = locationId;
        this.defaultLocationName = locationName;
        this.defaultLocationZip = locationZip;
        this.setLocation(locationId, locationName, locationZip);

        this.mainRegions = config.main_regions;
        this.importantRegions = config.important_regions;
        this.importantWinterRegions = config.important_winter_regions;
        this.importantWinterSlopes = config.important_winter_slopes;
        this.teaserSlopes = config.teaser_slopes;

        cb();
    },

    setStartDate: function(startDate) {
        var date = new Date(startDate);
        this.startDate = this.formatDate(date);
    },

    setEndDate: function(endDate) {
        var date = new Date(endDate);
        this.endDate = this.formatDate(date);
    },

    setLocation: function(locationId, zip, name) {
        this.locationId = locationId;
        this.locationZip = zip;
        this.locationName = name;

        this.setLocationTitle(name);
    },

    setLocationTitle: function(title) {
        $('#mn-header-location-title').html(title);
    },

    setLocationType: function(locationType) {
        this.locationType = locationType;
    },

    setSymbolsPath: function(path) {
        this.symbolsPath = path;
    },

    setConfigUrl: function(url) {
        this.configUrl = url;
    },

    /**
     * Get functions - call api via ajax
     */
    getSearchResults: function(queryString) {
        // clear location title
        this.setLocationTitle('');

        queryString = queryString.replace(' ', '_');
        var feed = 'search/' + queryString + '.' + this.format;
        var params = [];
        params['autofill'] = '1';
        params['limit'] = '100';
        params['country'] = 'CH';

        this._send(feed, params, function(response) {
            meteonews.searchResults = response;
            meteonews.showSearchResults(response);
        });
    },

    getConfig: function(cb) {
        // get config from server
        $.ajax({
            url: this.configUrl,
            type: 'get',
            success: function(response) {
                meteonews.setConfig(response, cb);
            },
            error: function(errorObj, textStatus, errorMsg) {
                console.log(JSON.stringify(errorMsg));
            }
        });

        // get local region list from meteonews feed
        var feed = 'geonames/mmv.xml'
        this._send(feed, [], function(response) {
            meteonews.localRegions = response.geonames.content.geoname;
        });
    },

    getForecastOverview: function(locationType, locationId, cb) {
        var feed = 'forecasts/' +
            locationType + '/' + 
            locationId + '.' +
            this.format;

        var params = [];
        params.cumulation = '24h';

        // set start and end dates
        var date = new Date();
        params.begin = this.formatDate(date);

        date.setDate(date.getDate() +4);
        params.end = this.formatDate(date);

        this._send(feed, params, function(response) {
            meteonews.hideElement('mn-search-results');
            cb(response);
        });
    },

    getForecastDetails: function() {
        var feed = 'forecasts/' + 
            this.locationType + '/' + 
            this.locationId + '.' +
            this.format;

        var params = [];
        params.cumulation = this.cumulation;
        params.begin = this.startDate;
        params.end = this.endDate;

        this._send(feed, params, function(response) {
            meteonews.hideElement('mn-search-results');
            meteonews.showForecastDetails(response);
        });
    },

    getDailyForecastDetails: function(date) {
        this.setStartDate(date);
        this.setEndDate(date);
        this.getForecastDetails();
    },

    getOneHourForecast: function(id, locationType, cb) {
        var date = new Date();
        date.setHours(date.getHours()-1);
        var begin = this.formatDateTime(date);
        date.setHours(date.getHours()+1);
        var end = this.formatDateTime(date);

        var feed = 'forecasts/' +
            locationType + '/' + id + '.' + this.format;
        var params = [];
        params.begin = begin;
        params.end = end;
        params.cumulation = '1h';
        
        this._send(feed, params, function(response) {
            cb(response);
        });
    },

    getPrognosenText: function() {
        var feed = 'bulletins/' +
            this.locationType + '/' +
            this.defaultLocationId + '.' +
            this.format;

        var params = [];
        params.type = 'synop,forecast,outlook';

        this._send(feed, params, function(response) {
            meteonews.showPrognosenText(response);
        });
    },

    getAstronomy: function() {
        var feed = 'astronomy/' +
            this.locationType + '/' +
            this.locationId + '.' +
            this.format;

        var params = [];

        this._send(feed, params, function(response) {
            $('#mn-sun-up').html(response.astronomy.content.day.sunrise + ' Uhr');        
            $('#mn-sun-down').html(response.astronomy.content.day.sunset + ' Uhr');
            if (response.astronomy.content.day.moonset) { 
                $('#mn-moon-up').html(response.astronomy.content.day.moonset + ' Uhr');
            } else {
                $('#mn-moon-up').html('');
            }
            $('#mn-moon-down').html(response.astronomy.content.day.moonrise + ' Uhr');
        });
    },

    getRegionName: function(id) {
        var lists = ['importantWinterRegions', 'mainRegions', 'localRegions', 'importantRegions' ]
        for (var l in lists) {
            var list = lists[l];

            for (var r in meteonews[list]) {
                var region = meteonews[list][r];
                if (id == region.id) {
                    return region.name;
                } 
            }
        }
    },

    getWinterSportsReport: function(type, id, cb) {
        var feed = 'wintersports/' +
            type + '/' +
            id + '.' +
            this.format;

        this._send(feed, [], function(response) {
            var wintersports = response.wintersports.content.region;

            var regionName = meteonews.getRegionName(id); 
            var regionId = id;
            
            for (var s in wintersports) {
                var slope = wintersports[s];
                var slopeId = slope['@attributes']['mexs_id'];
                var slopeName = slope['@attributes']['name'];
                var allSlopes = wintersports;

                if (slopeId == id) { 
                    (function(slope, slopeName, regionId, allSlopes){ 
                        meteonews.getOneHourForecast(slopeId, 'mexs', function(response) {
                            var results = response.forecasts.content.timeperiod;
                           
                            slope.all_slope_results = allSlopes; 
                            slope.slope_results = slope;
                            slope.region = regionName;
                            slope.regionId = regionId;
                            slope.name = slopeName; 
                            slope.id = response.forecasts.parameters.mexs_id;
                            slope.symb = (results.symb) ? results.symb : 0;
                            slope.txt = results['txt'];
                            slope.temp = (results.temp['@text']) ? results.temp['@text'] : 0;
                            slope.temp_min = (results.temp_min['@text']) ? results.temp_min['@text'] : 0;
                            slope.temp_max = (results.temp_max['@text']) ? results.temp_max['@text'] : 0;
                            slope.precip = (results.precip['@text']) ? results.precip['@text'] : 0;
                            slope.winddir = (results.winddir['@text']) ? results.winddir['@text'] : 0;
                            slope.windforce = (results.windforce['@text']) ? results.windforce['@text'] : 0;
                            cb(slope);                 
                        });
                    })(slope, slopeName, regionId, allSlopes);
                }
            }
        });
    },

    getSlopeMap: function(name) {
        var address = name + ', Schweiz';

        // load from google api
        meteonews.geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            meteonews.map.setCenter(results[0].geometry.location);

            // marker
            var marker = new google.maps.Marker({
                map: meteonews.map,
                position: results[0].geometry.location,
            });
            
            meteonews.mapMarkers.push(marker);
 
            // info box 
            var infowindow = new google.maps.InfoWindow({
                content: address
            });
    
            // add click event
            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(marker.get('map'), marker);
            });

            google.maps.event.trigger(meteonews.map, 'resize');

          } else {
            console.log('Geocode was not successful for the following reason: ' + status);
          }
        });
    },

    getAllSlopesMap: function() {
        for (var s in meteonews.importantWinterSlopes) {
            var slope = meteonews.importantWinterSlopes[s];
            meteonews.getSlopeMap(slope.name);
        }
    },

    clearMapMarkers: function() {
       for (var m in meteonews.mapMarkers) {
            meteonews.mapMarkers[m].setMap(null);
        } 
    },

    getSlopeWebcams: function(type, id, name) {
        var feed = 'webcams/' +
            type + '/' +
            id + '.' +
            this.format;

        var params = [];

        this._send(feed, params, function(response) {
            $('#mn-region-webcam-content').empty();

            var count = 0;
            for (var wc in response.webcams.content.webcam) {
                var webcam = response.webcams.content.webcam[wc];
                var desc = webcam.description;
                var source = webcam.source;
                var image = webcam.resources.resource[1]['@text'];
                var content = '';

                if (count == 0) {
                    content = "<a class='zoom fancybox' href='" + image + "'>Zoom</a>";
                    content += "<img src='" + image + "' style='width: 350px; height: 300px' alt=''>";
                    $('#mn-slope-webcam-content').html(content);
                } else {
                    content = "<li>";
                    content += "<a class='zoom fancybox' href='" + image + "'>Zoom</a>";
                    content += "<img src='" + image + "' style='width: 350px; height: 261px' alt=''>";
                    content += "<p style='width: 200px; line-heght: 14px;'>" + desc + "<br>Quelle: " + source + "</p>";
                    content += "</li>";
                    $('#mn-region-webcam-content').append(content);
                }
                count++
            } 

            // re-cycle slideshow
            $('.slides').each(function() {
                var slideshow = $('#mn-webcam-slideshow');
                var prev = $('#mn-webcam-prev');
                var next = $('#mn-webcam-next');
                $(this).cycle({
                    prev:       '#mn-webcam-prev',
                    next:       '#mn-webcam-next',
                    fx:         'scrollHorz',
                    fit:        true,
                    speed:      500,
                    timeout:    0
                });
            });
        });
    },

    showWinterSportsReport: function(slope) {
        var now = this.formatDisplayDateTime(new Date()); 
        $('#mn-wintersport-details-time').html('Aktuell '+now);
        var item = "<li style='width: 300px'>";
        
        // update location header
        meteonews.setLocationTitle(slope.name);
        $('#mn-header-location-title').show();

        // header row
        $('#mn-wintersport-details-list').empty();

        item += "<img src='" + this.symbolsPath + slope.symb + ".png' class='mn-symbol-medium' alt>";
        item += "<span>" + slope.temp + ", ";
        item += "<small>" + slope.txt + "</small></span></li>";

        item += "<li><img src='" + this.symbolsPath + "icon-rain-30.png' class='mn-symbol-small' alt>";
        item += "<span class='water'>" + slope.precip + " mm</span></li>"

        item += "<li><img src='" + this.symbolsPath + "icon-direction-north-30.png' class='mn-symbol-small' " +
                "style='-webkit-transform:rotate(" + slope.winddir + "deg); " +
                "-moz-transform:rotate(" + slope.winddir + "deg); " +
                "-ms-transform:rotate(" + slope.winddir + "deg); " +
                "-o-transform:rotate(" + slope.winddir + "deg); " + 
                "transform:rotate(" + slope.winddir + "deg);' alt>";
        item += "<span>" + slope.windforce + " km/h</span></li>";

        $('#mn-wintersport-details-list').append(item);

        // details
        $('#mn-wintersport-details-container').html();

        var output = '';
        var sections = ['ski', 'crosscountry', 'toboggan', 'avalanches', 'general'];
        for (var s in sections) {
            var section = sections[s];
            var items = slope.slope_results[section];
            if (section != '@attributes') {
                output += "<h4 class='table-collapse-trigger'>";
                output += "<a href='#'>" + meteonews.translate(section) + "</a></h4>";
                output += "<div class='table-wrapper'><table cellpadding='0' cellspacing='0'>";

                // add values
                output += "<colgroup> <col width> <col width='135'> <col width='232'> <col width='130'> </colgroup>";
                output += "<tbody>";
                var fcount = 0;
                for (var item in items) {
                    if (fcount == 0) {
                        output += "<tr>";
                    }

                    var displayItem = item;
                    var displayValue = '';

                    if (typeof items[item] == 'object') {
                        // generic
                        if (items[item]['@text']) {
                            var value = items[item]['@text'];
                            if (items[item]['@attributes']['total']) {
                                displayValue = value + " von " + 
                                    items[item]['@attributes']['total'] + " " +
                                    items[item]['@attributes']['string'];
                            } else {
                                if (items[item]['@attributes']) {
                                    var unit = items[item]['@attributes']['unit'];
                                }
                                displayValue = value + " " + unit;
                            }
                        }

                        // specific formatting
                        if (item == 'alarm') {
                            displayValue = '<ul>';
                            for (var a in items[item]) {
                                var alarm = items[item][a];
                                var dt = meteonews.formatDisplayDate(meteonews.getDateObj(alarm['@attributes']['date']));
                                displayValue += '<li><span>' + dt + ' - ' + alarm.string + '</li>';
                            }
                            displayValue += '</ul>';
                        }
                        if (item == 'last_snowfall') {
                            displayValue = items[item]['@attributes']['date']; 
                        }
                        if (item == 'source') {
                            displayValue = "<a href='"+items[item]['@attributes']['url']+"'>"+items[item]['@text']+"</a>";
                        }
                        // end specific formatting

                    } else {
                        displayValue = items[item];
                    }
                    
                    output += "<th>" + meteonews.translate(displayItem) + "</th>" + "<td>" + meteonews.translate(displayValue) + "</td>";
                    fcount++;

                    if (fcount == 2) {
                        output += "</tr>";
                        fcount = 0;
                    }
                }

                if (fcount == 1) {
                    output += "<th></th><td></td></tr>";
                }

                output += "<tbody>";
                output += "</table></div>";
            }
        }
        
        // get forecasts for slopes in the near
        var headerRow = "<tr><td colspan='2'><p><strong>In der Nähe</strong></p></td></tr>"
        for (var i=1;i<6;i++) {
            $('#mn-wintersport-prognosen-table-' + i + ' tbody').empty();
            $('#mn-wintersport-prognosen-table-' + i + ' tbody').append(headerRow);
        }
        var rowTemplate = "<tr><td><p><strong>$name</strong><br>$text</p></td><td>$image $temp</td></tr>";

        for (s in slope.all_slope_results) {
            var areaSlope = slope.all_slope_results[s];
            var slopeId = areaSlope['@attributes']['mexs_id'];
            var slopeName = areaSlope['@attributes']['name'];
            
            for (var i=1;i<6;i++) {
                var rowId = "mn-slope-tbl" + i + "-" + slopeId;
                var rowTemplate = "<tr id='" + rowId + "'></tr>";
                $('#mn-wintersport-prognosen-table-' + i + ' tbody').append(rowTemplate);
            }

            (function(slopeId, slopeName){
                meteonews.getForecastOverview('mexs', slopeId, function(response) {
                    var results = response.forecasts.content.timeperiod;
                    var day = 0;

                    for (var r in results) {
                        var result = results[r];
                        var temp = (result.temp['@text']) ? result.temp['@text'] : 0;
                        var txt = result['txt'];
                        var date = meteonews.getDateObj(result['@attributes']['end_datetime']);
                        var displayDate = meteonews.formatDisplayDate(date);
                        var image = "<img src='" + meteonews.symbolsPath + result.symb +".png' class='mn-symbol-small' alt>";
                        var link = "<a href='#'  class='mn-wintersport-link' data-type='mexs' data-id='" + slopeId + "' data-name='" + slopeName + "'>"
                        var row = "<td><p><strong>" + link + slopeName + "</a></strong><br>" + txt + "</p></td><td>" + image + " " +  temp + "</td>";
                        day++;
                        var matchRowId = "#mn-slope-tbl" + day + "-" + slopeId;
                        var buttonText = "<span class='mobile-hide'>Details</span> "+displayDate;
 
                        $('#mn-header-day'+day).html('Pronose '+displayDate);
                        $('#mn-ui-id-'+day).html(buttonText);
                        $(matchRowId).html(row);
                    }
                });
            })(slopeId, slopeName);
        }

        $('#mn-wintersport-details-container').html(output);
        $('#mn-wintersport-details').show();
    },

    showPrognosenText: function(response) {
        var output = '';
        var results = response.bulletins.content.bulletin;
        
        for (var r in results) {
            var result = results[r];
            output += "<h4>" + result.title + "</h4>";
            output += "<p>" + result.text + "</p>";
        }

        $('#mn-prognosen-text').html(output);
        $('#mn-prognosen-text').show();
    },

    showForecastOverview: function(response) {
        var results = response.forecasts.content.timeperiod;
        var day = 0;
 
        $('#mn-forecast-overview').empty();

        for (var r in results) {
            var result = results[r];
            var temp_min = (result.temp_min['@text']) ? result.temp_min['@text'] : 0;
            var temp_min_unit = result.temp_min['@attributes']['unit'];
            var temp_max = (result.temp_max['@text']) ? result.temp_max['@text'] : 0;
            var temp_max_unit = result.temp_max['@attributes']['unit'];
            var txt = result['txt'];
            var date = meteonews.getDateObj(result['@attributes']['end_datetime']);
            date.setDate(date.getDate() -1);
            var displayDate = meteonews.formatDisplayDate(date);
            var linkDate = meteonews.formatDate(date);
            var item = "<li>";

            // add the overview
            item += "<small>" + displayDate + "</small>";
            item += "<img src='" + meteonews.symbolsPath + result.symb +".png' alt>";
            item += "<h4>" + temp_max + '°/' + temp_min + "°</h4>";
            item += "<p>" + txt + "</p>";
            item += "</li>";
            $('#mn-forecast-overview').append(item);
            
            // update the tab button
            $('#mn-tab-' + (day+1) + '-link').addClass('mn-forecast-details-btn');
            $('#mn-tab-' + (day+1) + '-link').attr('data-date', linkDate);
            $('#mn-tab-' + (day+1) + '-link').attr('data-tab', (day+1));
            $('#mn-tab-' + (day+1) + '-label').html(displayDate);

            day++;
        }
 
        $('#mn-forecast-overview').show();
        $('#mn-forecast-details').show();
    },

    showForecastDetails: function(response) {
        var results = response.forecasts.content.timeperiod;
        var fields = ['temp_min', 'temp_max', 'gustforce', 'glob_rad', 'hum', 'precip',
            'precip_prob', 'freez_level', 'temp_dew', 'windforce', 'winddir', 'temp_wind', 'pres' ];

        var headerFields = ['temp', 'sun', 'precip', 'precip_prob', 'winddir', 'windforce'];

        // create date row
        var date = meteonews.formatDisplayDate(meteonews.getDateObj(meteonews.startDate));

        $('.mn-prognose-date').each(function() {
            $(this).html("<a href='#'>Prognose " + date + '</a>');
        });

        $('.tabs-header').each(function() {
            $(this).html("<span class='mobile-hide'>Details</span> " + date);
        });

        // clear details table
        $('.mn-forecast-details-table').each(function() { 
            $(this).children('tbody').empty();
        });

        for (var r in results) {
            var result = results[r];
            var time = this.formatTime(meteonews.getDateObj(result['@attributes']['end_datetime']));
            var timeId = time.replace(':', ''); 
            var headerRow = '';

            // create header row
            headerRow += "<tr class='mn-forecast-details-header-row' id='" + timeId + "'>";
            headerRow += "<td><p><strong>"+time+"</strong></p></td>";
            for (var f in headerFields) {
                var field = headerFields[f];
                var value = (result[field]['@text']) ? result[field]['@text'] : 0;
                var unit = result[field]['@attributes']['unit'];
               
                // show general 
                if (field == 'temp') {
                    headerRow += "<td><img src='" + this.symbolsPath + result.symb +".png' class='mn-symbol-small' alt>";
                    headerRow += value + " " + unit + '</td>';
                }
                // show sun 
                if (field == 'sun') {
                    headerRow += "<td><img src='" + this.symbolsPath + "1.png' class='mn-symbol-small'>";
                    headerRow += value + " " +unit + '</td>';
                }
                // show rain 
                if (field == 'precip') {
                    headerRow += "<td><img src='" + this.symbolsPath + "icon-rain-30.png' class='mn-symbol-small'>";
                    headerRow += value + " " + unit + ' ';
                }
                // show rain prob
                if (field == 'precip_prob') {
                    headerRow += value + " " + unit + '</td>';
                }
                if (field == 'winddir') {
                    headerRow += "<td><img src='" + this.symbolsPath + "icon-direction-north-30.png' class='mn-symbol-small'" +
                        "style='-webkit-transform:rotate(" + value + "deg); " +
                        "-moz-transform:rotate(" + value + "deg); " +
                        "-ms-transform:rotate(" + value + "deg); " +
                        "-o-transform:rotate(" + value + "deg); " + 
                        "transform:rotate(" + value + "deg);' alt>";
                }
                if (field == 'windforce') {
                    headerRow += value + " " + unit + '</td>';
                }
            }
            headerRow += "<td><a href='#' class='trigger active'>Close</a></td></tr>";

            $('.mn-forecast-details-table').each(function() {
                $(this).children('tbody:last').append(headerRow);
            });
           
            // create details row
            detailRow = "<tr class='inner'><td colspan='6'><div class='inner-table'>";
            detailRow += "<table id='mn-forecast-details-inner-table' cellpadding='0' cellspacing='0'>";
            detailRow += "<colgroup><col width='270'><col width></colgroup>";
            detailRow += "<tbody>";

            for (var f in fields) {
                var field = fields[f];
                var value = (result[field]['@text']) ? result[field]['@text'] : 0;
                detailRow += "<tr><td>" + meteonews.translate(field) + '</td><td>' + value;
                detailRow += " " + result[field]['@attributes']['unit'];
                detailRow += "</td></tr>";
            }
            detailRow += "</tbody></table></tr>";

            $('.mn-forecast-details-table').each(function() {
                $(this).children('tbody:last').append(detailRow);
            });
        }

        var dateObj = meteonews.getDateObj(meteonews.startDate);

        dateObj.setDate(dateObj.getDate() -1);
        var prevDay = meteonews.formatDate(dateObj);

        dateObj.setDate(dateObj.getDate() +2);
        var nextDay = meteonews.formatDate(dateObj);

        $('.next-tab').each(function() {
            $(this).addClass('mn-forecast-details-btn');
            $(this).attr('data-date', nextDay);
        });

        $('.prev-tab').each(function() {
            $(this).addClass('mn-forecast-details-btn');
            $(this).attr('data-date', prevDay);
        });

        $('#mn-forecast-details').show();

    },

    showSearchResults: function(response) {
        var output = '';
        var results = response.search.content.suggest;
        if (results instanceof Array) {
            for (var r in results) {
                var result = results[r];
                if (result.country == 'CH') {
                    output += "<div class='mn-search-result' ";
                    output += "data-id='" + result.geoname_id + "' ";
                    output += "data-zip='" + result.zip + "' ";
                    output += "data-name='" + result.name + "'>";
                    output += "<ul>";

                    var label = result.name;
                    if (result.state) {
                        label += ", " + result.state;
                    }
                    label += ", " + result.country;

                    output += "<li class='mn-search-result-col'><a href='#'>" + label + "</a></li>";
                    output += "</ul></div>";
                }
            }
        } else {
            if (results) {
                output += "<div class='mn-search-result' ";
                output += "data-id='" + results.geoname_id + "' ";
                output += "data-zip='" + results.zip + "' ";
                output += "data-name='" + results.name + "'>";
                output += "<ul>";

                var label = results.name;
                if (results.state) {
                    label += ", " + results.state;
                }
                label += ", " + results.country;

                output += "<li class='mn-search-result-col'><a href='#'>" + label + "</a></li>";
                output += "</ul></div>";
            } else {
                // no results
                output = 'Keine Ergebnisse';
            }
        }
        meteonews.hideAllLoading(); 
        $('#mn-search-results').html(output);
        $('#mn-search-results').show();
    },

    showLocalSearch: function() {
        // hide header search first
        $('#mn-searchform').hide();

        // region list
        $('#mn-region-list-level-1').empty();

        for (var r in this.mainRegions) {
            var region = this.mainRegions[r];
            var item = "<li class='mn-lokalwetter-region-item' data-role='parent' data-code='" + region.code + "'>" + 
                "<a href='#'>" + region.name + "</a></li>";
            $('#mn-region-list-level-1').append(item);
        }

        $('#mn-lokalwetter-searchform').show();
        meteonews.setLocationTitle('Lokalwetter Zentralschweiz');
        $('#mn-header-location-title').show();
    },

    showSubregions: function(code, role) {
        var subRegions = [];

        if (role == 'parent') {
            $('#mn-region-list-level-2').empty();
            $('#mn-region-list-level-3').empty();
        } else {
            $('#mn-region-list-level-3').empty();
        }

        for (r in this.localRegions) {
            var region = this.localRegions[r];
            var id = region['@attributes']['geoname_id'];
            var subRegionName = region.subdivision['@attributes']['name'];
            var subDivisionParts = region.subdivision['@text'].split('-');

            if ((role == 'parent') && (subDivisionParts[0] == code)) {
                // print sub region list
                if (subRegions.indexOf(subRegionName) == -1) {
                    var item = "<li class='mn-lokalwetter-region-item' " +
                        " data-role='child' " +
                        " data-code='" + subDivisionParts[1] + "'><a href='#'>" + subRegionName + "</a></li>";
                    $('#mn-region-list-level-2').append(item);
                    subRegions.push(subRegionName);
                }
            }
            if ((role == 'child') && (subDivisionParts[1] == code)) {
                // print link list
                var item = "<li class='mn-lokalwetter-region-item' " +
                    "data-role='link' " +
                    "data-id='" + id + "' " +
                    "data-name='" + region.name + "' " +
                    "data-zip=''><a href='#'>" + region.name + "</a></li>";
                    $('#mn-region-list-level-3').append(item);
            }
        }
        
        if (role == 'parent') {
            $('.weather-loctions').addClass('no-map');
            $('.weather-loctions ul.level-1 li').removeClass('active');
            $('.weather-loctions ul.level-2').show();
            $('.weather-loctions p.info').hide();
            $('.weather-loctions p.close-search').show();
        } else {
            $('.weather-loctions ul.level-2 li').removeClass('active');
            $('.weather-loctions ul.level-3').show();
        }
    },

    showLocalWeatherPage: function() {
        meteonews.hideAllElements();
        meteonews.makeActive('mn-lokalwetter');
        meteonews.showLocalSearch();
        $('#mn-lokalwetter-regions-container').show();
        $('#mn-primary-regions').show();
        $('#mn-secondary-regions').show();
        $('#mn-teaser-slopes').show();
    },

    showPrognosenPage: function() {
        meteonews.hideAllElements();
        $('#mn-searchform').show();
        meteonews.makeActive('mn-prognosen');
        meteonews.setLocation(meteonews.defaultLocationId, meteonews.defaultLocationZip, meteonews.defaultLocationName);
        meteonews.setLocationTitle('Prognosen Zentralschweiz');
        meteonews.getAstronomy();
        meteonews.getPrognosenText();
        $('#mn-prognosen-regions').show();
        $('#mn-sun-and-moon').show();
        $('#mn-teaser-slopes').show();
    },

    showFiveDayForecastPage: function(id, zip, name) {
        meteonews.hideAllElements();
        meteonews.makeActive('mn-lokalwetter');
        $('#mn-searchform').show();
        meteonews.setLocation(id, zip, name);
        meteonews.getForecastOverview(meteonews.locationType, meteonews.locationId, meteonews.showForecastOverview);
        meteonews.getDailyForecastDetails(new Date());
        meteonews.getAstronomy();
        $('#mn-primary-regions').show();
        $('#mn-secondary-regions').show();
        $('#mn-lokalwetter-regions-container').show();
        $('#mn-sun-and-moon').show();
        $('#mn-teaser-slopes').show();
        $('#mn-search-text').val('');
    },

    showWintersportPage: function() {
        $('#mn-slope-map').show();
        meteonews.hideAllElements();
        $('#mn-searchform').show();
        meteonews.setLocationTitle('Wintersport');
        meteonews.makeActive('mn-wintersport');
        $('#mn-wintersport-important-slopes').show();
        $('#mn-wintersport-all-regions').show();
        meteonews.getAstronomy();
        $('#mn-sun-and-moon').show();
        meteonews.getAllSlopesMap(name);
        $('#mn-slope-map').show();
    },

    showWintersportDetailPage: function(type, id, name) {
        $('#mn-slope-map').show();
        meteonews.hideAllElements();
        meteonews.setLocation(id,name);
        meteonews.getWinterSportsReport(type, id, function(slope) {
            meteonews.showWinterSportsReport(slope);
        });
        $('#mn-slope-webcam').show();
        $('#mn-region-webcam').show();
        meteonews.clearMapMarkers();
        meteonews.getSlopeMap(name);
        $('#mn-slope-map').show();

        meteonews.getSlopeWebcams(type, id, name);
        $('#mn-wintersport-details-prognosen').show();
    },

    showLoading: function() {
        $('.main').prepend("<div id='mn-overlay-black'></div>");
        $('.main').prepend("<div id='mn-overlay-white'></div>");
    },

    hideLoading: function() {
        $('#mn-overlay-white').remove(); 
        $('#mn-overlay-black').remove(); 
    },

    hideAllLoading: function() {
        $('#mn-overlay-white').each(function() {
            $(this).remove();
        });
        $('#mn-overlay-black').each(function() {
            $(this).remove();
        });
    },

    hideElement: function(element) {
        $('#'+element).hide();
    },

    hideAllElements: function() {
        for (var i in this.elementList) {
            $('#'+this.elementList[i]).hide();
        }
        this.setLocationTitle('');
    },

    makeActive: function(element) {
        $('.mn-menu-item').removeClass('active');
        $('#'+element).addClass('active');
    },

    _send: function(feed, params, cb) {
        var proxy = this.proxyUrl;
        var url = this.domain + '/' + feed

        meteonews.showLoading();

        params['lang'] = this.lang;

        var first = true;
        for (param in params) {
            url += (first) ? '?' : '&';
            first=false; 
            url += param + "=" + params[param]
        }

        if (this.cache[url]) {
            meteonews.hideLoading();
            cb(this.cache[url]);
        } else {
            $.ajax({
                url: proxy + "?url=" + encodeURIComponent(url),
                type: 'get',
                success: function(response) {
                    meteonews.cache[url] = response
                    meteonews.hideLoading();
                    cb(response);
                },
                error: function(errorObj, textStatus, errorMsg) {
                    meteonews.hideLoading();
                    console.log(JSON.stringify(errorMsg));
                }
            });
        }
    },

    getDateObj: function(dateString) {
        var dateParts = dateString.split(' ');
        var dateSubParts = dateParts[0].split('-');
        var dateObj = new Date(dateSubParts[0], (dateSubParts[1]-1), dateSubParts[2]);
        if (dateParts[1]) {
            var timeParts = dateParts[1].split(':');
            dateObj.setHours(timeParts[0]);
            dateObj.setMinutes(timeParts[1]);
        }
        return dateObj;
    },

    formatDate: function(date) {
        dateString = date.getFullYear() + '-' + 
            ('0' + (date.getMonth()+1)).slice(-2) + '-' + 
            ('0' + date.getDate()).slice(-2);
        return dateString;
    },

    formatDisplayDate: function(date) {
        dateString = ('0' + date.getDate()).slice(-2) + '.' +
            ('0' + (date.getMonth()+1)).slice(-2);
        return dateString;
    },

    formatDateTime: function(date) {
        dateString = date.getFullYear() + '-' + 
            ('0' + (date.getMonth()+1)).slice(-2) + '-' + 
            ('0' + date.getDate()).slice(-2) + 'T' + 
            ('0' + date.getHours()).slice(-2) + ':00';
        return dateString;
    },

    formatDisplayDateTime: function(date) {
        dateString = ('0' + date.getDate()).slice(-2) + '.' + 
            ('0' + (date.getMonth()+1)).slice(-2) + '.'  + 
            date.getFullYear() + ', ' + 
            ('0' + date.getHours()).slice(-2) + ':00';
        return dateString;
    },

    formatTime: function(date) {
        dateString = ('0' + date.getHours()).slice(-2) + ':00';
        return dateString;
    },

    autoCompleteLookup: function (request, response) {
        queryString = request.term.replace(' ', '_');
        var feed = 'search/' + queryString + '.' + meteonews.format;
        var url = meteonews.domain + '/' + feed + '?autofill=1&limit=100&country=CH';

        $.ajax({
            url: meteonews.proxyUrl + "?url=" + encodeURIComponent(url),
            type: 'get',
            success: function(data) {
                var results = data.search.content.suggest;
                var output = [];

                if (results instanceof Array) {
                    for (var r in results) {
                        var result = results[r];
                        var label = result.name;
                        var country = result.country;

                        if (country == 'CH') {
                            if (result.state) {
                                label += ', ' + result.state;
                            }
                            label += ', ' + result.country;

                            var option = {
                                    'label': label,
                                    'id': result.geoname_id
                                    }
                            output.push(option);
                        }
                    }
                } else {
                    if (results) {
                        var label = results.name;
                        if (results.state) {
                            label += ', ' + results.state;
                        }
                        label += ', ' + results.country;

                        var option = {
                            'label': label,
                            'id': results.geoname_id
                        };
                        output.push(option);
                    } else {
                        meteonews.hideAllLoading();
                    }
                }
                response(output);
            }
        });
    },

    translate: function(text) {
        return (meteonews.translations[text]) ? meteonews.translations[text] : text;
    },
};

$(function(){
    // event handlers
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
    });

    $('#mn-prognosen').live('click', function() {
        meteonews.showPrognosenPage()
    });

    $('#mn-wintersport').live('click', function() {
        meteonews.showWintersportPage();
    });

    $('.mn-lokalwetter-region-item').live('click', function() {
        var role = $(this).attr('data-role');
        if (role == 'link') {
            meteonews.showFiveDayForecastPage($(this).attr('data-id'), $(this).attr('data-zip'), $(this).attr('data-name'));
        } else {
            meteonews.showSubregions($(this).attr('data-code'), $(this).attr('data-role'));
            $(this).addClass('active');
            return false;
        }
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

