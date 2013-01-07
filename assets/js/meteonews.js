/*
 * Meteonews api interface
 *
 * author: Mark Lewis
 */
var meteonews = {

    user: 'mmv',
    pass: 'NZUG$ObvwGx/%!+,',
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

    mainRegions: [],
    importantRegions: [],
    localRegions: [],
    importantWinterRegions: [],

    importantWinterSlopes: [],
    teaserSlopes: [],
    allSlopes: [],

    searchResults: [],

    locationType: 'geonames',
    locationId: null,
    locationName: null,
    locationZip: null,

    startDate: null,
    endDate: null,
    cumulation: '3h',

    // state vars
    allSlopesCount: -1,
    loadedAllSlopes: 0,
    loadedTeaserSlopes: 0,
    loadedImportantWinterRegions: 0,
    loadedImportantWinterSlopes: 0,
    loadedImportantRegions: 0,
    cache: {},

    elementList: [ 'mn-search-results', 'mn-forecast-details', 'mn-lokalwetter-regions-container',
        'mn-forecast-overview', 'mn-primary-regions', 'mn-secondary-regions', 'mn-prognosen-regions',
        'mn-prognosen-text', 'mn-lokalwetter-searchform', 'mn-pistenbericht-important-slopes',
        'mn-pistenbericht-all-regions', 'mn-pistenbericht-details' ],

    init: function(cb) {
        this.getConfig(cb);
        var date = new Date();
        this.setStartDate(date);
        date.setDate(date.getDate() + 5);
        this.setEndDate(date);
        this.setLocation(this.defaultLocationId, this.defaultLocationZip, this.defaultLocationName);
        this.hideAllElements();
        this.initialized = true;
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

    setProxyUrl: function(url) {
        this.proxyUrl = url;
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

    getForecastOverview: function(cb) {
        var feed = 'forecasts/' +
            this.locationType + '/' + 
            this.locationId + '.' +
            this.format;

        var params = [];
        params.cumulation = '24h';

        // set start and end dates
        var date = new Date();
        date.setDate(date.getDate() -1);
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

    getPrognosenRegions: function() {
        var regions = meteonews.importantRegions;
        var loaded = meteonews.loadedImportantRegions;

        // check if loaded already
        // TODO: add last_updated check
        if (this.isLoaded(loaded, regions.length)) {
            meteonews.showPrognosenRegions();
        } else {
            this.loadRegionList(regions, function(loaded) {
                meteonews.loadedImportantRegions = loaded;
                meteonews.showPrognosenRegions();
            });
        }
    },

    getImportantWinterRegions: function() {
        var regions = meteonews.importantWinterRegions;
        var loaded = meteonews.loadedImportantWinterRegions;

        // check if loaded already
        // TODO: add last_updated check
        if (this.isLoaded(loaded, regions.length)) {
            meteonews.showRegionList('mn-secondary-regions', regions);
        } else {
            this.loadRegionList(regions, function(loaded) {
                meteonews.loadedImportantWinterRegions = loaded;
                meteonews.showRegionList('mn-secondary-regions', regions);
            });
        }
    },

    getImportantRegions: function() {
        var regions = meteonews.importantRegions;
        var loaded = meteonews.loadedImportantRegions;

        // check if loaded already
        // TODO: add last_updated check
        if (this.isLoaded(loaded, regions.length)) {
            meteonews.showRegionList('mn-primary-regions', regions);
        } else {
            this.loadRegionList(regions, function(loaded) {
                meteonews.loadedImportantRegions = loaded;
                meteonews.showRegionList('mn-primary-regions', regions);
            });
        }
    },

    getTeaserSlopes: function() {
        var regions = meteonews.teaserSlopes;
        var loaded = meteonews.loadedTeaserSlopes;

        // check if loaded already
        // TODO: add last_updated check
        if (this.isLoaded(loaded, regions.length)) {
            meteonews.showTeaserSlopes(regions);
        } else {
            this.loadRegionList(regions, function(loaded) {
                meteonews.loadedTeaserSlopes = loaded;
                meteonews.showTeaserSlopes(regions);
            });
        }
    },

    loadRegionList: function(regions, cb) {
        var loaded = 0;
        for (var r in regions) {
            var region = regions[r];
            var id = region.id;

            (function( regions, loaded ){ 
                meteonews.getOneHourForecast(id, 'geonames', function(response) {
                    var results = response.forecasts.content.timeperiod;
                    var id = response.forecasts.parameters.geoname_id;
                    for (var r in regions) {
                        var region = regions[r];
                        if (region.id == id) {
                            region.symb = (results.symb) ? results.symb : 0;
                            region.temp_min = (results.temp_min['@text']) ? results.temp_min['@text'] : 0;
                            region.temp_max = (results.temp_max['@text']) ? results.temp_max['@text'] : 0;
                            loaded++;
                            if (meteonews.isLoaded(loaded, regions.length)) {
                                cb(loaded);
                            }
                        }
                    }
                });
            })( regions, loaded );

            loaded++;
        }
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

    getPistenbericht: function() {
        if (this.isLoaded(meteonews.importantWinterSlopes.length, meteonews.loadedImportantWinterSlopes)) {
            this.showPistenbericht();
        } else {
            this.setLocationType('mexs');
            for (var s in this.importantWinterSlopes) {
                var slope = this.importantWinterSlopes[s];
                var feed = 'wintersports/' +
                    this.locationType + '/' +
                    slope.id + '.' +
                    this.format;
                
                this._send(feed, [], function(response) {
                    var results = response.wintersports.content.region;
                    var requestedId = response.wintersports.parameters.mexs_id;

                    for (var i in results) {
                        var result = results[i];
                        var resultSlopeId = result['@attributes']['mexs_id'];
                        if (resultSlopeId == requestedId) {
                            for (var s in meteonews.importantWinterSlopes) {
                                var localSlope = meteonews.importantWinterSlopes[s];
                                if (localSlope.id == resultSlopeId) {
                                    localSlope.slope_results = result;

                                    meteonews.getPistenForecast(localSlope.id);
                                }
                            }
                        }
                    }
                });
            }
            this.setLocationType('geonames');
        }
    },

    getPistenForecast: function(id) {
        this.getOneHourForecast(id, 'mexs', function(response) {
            var results = response.forecasts.content.timeperiod;
            var resultId = response.forecasts.parameters.mexs_id;
            
            for (var s in meteonews.importantWinterSlopes) {
                var slope = meteonews.importantWinterSlopes[s];

                if ((!slope.symb) && (resultId == slope.id)) {
                    slope.symb = (results.symb) ? results.symb : 0;
                    slope.txt = results['txt'];
                    slope.temp = (results.temp['@text']) ? results.temp['@text'] : 0;
                    slope.temp_min = (results.temp_min['@text']) ? results.temp_min['@text'] : 0;
                    slope.temp_max = (results.temp_max['@text']) ? results.temp_max['@text'] : 0;
                    slope.precip = (results.precip['@text']) ? results.precip['@text'] : 0;
                    slope.winddir = (results.winddir['@text']) ? results.winddir['@text'] : 0;
                    slope.windforce = (results.windforce['@text']) ? results.windforce['@text'] : 0;

                    meteonews.loadedImportantWinterSlopes++;
                    
                    if (meteonews.isLoaded(meteonews.loadedImportantWinterSlopes, meteonews.importantWinterSlopes.length)) {
                        meteonews.showPistenbericht();
                    }
                }

            }
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

    getAllPistenbericht: function(regionId) {
        if (regionId) {
            // TODO: add last updated check, and regionId check
            if (this.isLoaded(this.allSlopesCount, this.loadedAllSlopes)) {
                this.showAllPistenbericht();
            } else {
                this.getWinterSportsReport(regionId);
            }
        } else {
            // TODO: add last updated check, and regionId check
            if (this.isLoaded(this.allSlopesCount, this.loadedAllSlopes)) {
                this.showAllPistenbericht();
            } else {
                for (r in this.mainRegions) {
                    var region = this.mainRegions[r];
                    this.getWinterSportsReport(region.id);
                }
            }
        }
    },

    getWinterSportsReport: function(id, cb) {
        var feed = 'wintersports/' +
            this.locationType + '/' +
            id + '.' +
            this.format;

        this.allSlopesCount = 0;
 
        this._send(feed, [], function(response) {
            var wintersports = response.wintersports.content.region;

            var regionName = meteonews.getRegionName(id); 
            var regionId = id;
            
            meteonews.allSlopesCount+= wintersports.length;

            for (var s in wintersports) {
                var slope = wintersports[s];
                var slopeId = slope['@attributes']['mexs_id'];
                var slopeName = slope['@attributes']['name'];
                
                (function(slope, slopeName, regionId){ 
                    meteonews.getOneHourForecast(slopeId, 'mexs', function(response) {
                        var results = response.forecasts.content.timeperiod;
                        
                        meteonews.loadedAllSlopes++;
                        if (meteonews.isLoaded(meteonews.allSlopesCount, meteonews.loadedAllSlopes)) {
                            meteonews.showAllPistenbericht();
                        }
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
                     
                        for (var sf in meteonews.allSlopes) {
                            loadedSlope = meteonews.allSlopes[sf];
                            if (loadedSlope.name == slope.name) {
                                return;
                            }
                        }
                        
                        meteonews.allSlopes.push(slope);
                    });
                })(slope, slopeName, regionId);
            }
        });
    },

    showPistenbericht: function() {
        $('#mn-pistenbericht-important-slopes-table tr').empty();
 
        for (var s in this.importantWinterSlopes) {
            var slope = this.importantWinterSlopes[s];
            var distance = (slope.slope_results['@attributes']['distance']) ? slope.slope_results['@attributes']['distance'] : 0;
            var snowCondition = slope.slope_results.ski.snow_condition;
            var item = '';

            if (slope.slope_results.ski.facilities) {
                var slopesTotal = (slope.slope_results.ski.facilities['@attributes']['total']) ? slope.slope_results.ski.facilities['@attributes']['total'] : 0;
                var slopesOpen = (slope.slope_results.ski.facilities['@text']) ? slope.slope_results.ski.facilities['@text'] : 0;
            }
            
            item += "<tr><th><p><strong>";
            item += "<a class='mn-pistenbericht-link' " +
                "data-id='" + slope.id + "' " + 
                "data-name='" + slope.name + "' " +
                "data-list='importantWinterSlopes' " +
                "href='#'>";
            item += slope.name + "</a></strong><br>";
            item += slope.region + "</p></th>";
            item += "<td><span class='phone-hide'>";
            item += snowCondition + '<br>' + slopesOpen + ' von ' + slopesTotal + ' Piste';
            item += "</span></td>";
            item += "<td><img src='" + this.symbolsPath + slope.symb + ".png' class='mn-symbol-small' alt> ";
            item += slope.temp_max + "/" + slope.temp_min;
            item += "</td></tr>";
            
            $('#mn-pistenbericht-important-slopes-table tbody:last').append(item);
        }
           
        $('#mn-pistenbericht-important-slopes').show();

    },

    showAllPistenbericht: function() {
        for (s in meteonews.allSlopes) {
            var slope = meteonews.allSlopes[s];
            var distance = (slope['@attributes']['distance']) ? slope['@attributes']['distance'] : 0;
            var snowCondition = slope.ski.snow_condition;
            var item = '';
            var slopesTotal = 0;
            var slopesOpen = 0;

            if (slope.ski.facilities) {
                slopesTotal = (slope.ski.facilities['@attributes']['total']) ? slope.ski.facilities['@attributes']['total'] : 0;
                slopesOpen = (slope.ski.facilities['@text']) ? slope.ski.facilities['@text'] : 0;
            }
            
            item += "<tr><th><p><strong>";
            item += "<a class='mn-pistenbericht-link' " +
                "data-id='" + slope.id + "' " + 
                "data-name='" + slope.name + "' " +
                "data-list='allSlopes' " +
                "href='#'>";
            item += slope.name + "</a></strong><br>";
            item += slope.region + "</p></th>";
            item += "<td><span class='phone-hide'>";
            item += snowCondition + '<br>' + slopesOpen + ' von ' + slopesTotal + ' Piste';
            item += "</span></td>";
            item += "<td><img src='" + this.symbolsPath + slope.symb + ".png' class='mn-symbol-small' alt> ";
            item += slope.temp_max + "/" + slope.temp_min;
            item += "</td></tr>";
            
            $('#mn-pistenbericht-all-slopes-table tbody:last').append(item);
        }
        $('#mn-pistenbericht-all-regions').show();
    },

    showPistenberichtDetails: function(id, list) {
        for (var s in this[list]) {
            var slope = this[list][s];
            if (slope.id == id) {
                var now = this.formatDateTime(new Date()); 
                $('#mn-pistenbericht-details-time').html('Aktuell '+now);
                var item = '<li>';

                // header row
                $('#mn-pistenbericht-details-list').empty();

                item += "<img src='" + this.symbolsPath + slope.symb + ".png' class='mn-symbol-small' alt>";
                item += "<span>" + slope.temp + ", ";
                item += "<small>" + slope.txt + "</small></span></li>";

                item += "<li><img src='" + this.symbolsPath + "icon-rain-30.png' class='mn-symbol-small' alt>";
                item += "<span class='water'>" + slope.precip + " mm</span></li>"

                item += "<li><img src='" + this.symbolsPath + "icon-direction-north-30.png' class='mn-symbol-small' " +
                        "style='-webkit-transform:rotate(" + slope.winddir + "deg)' alt>";
                item += "<span>" + slope.windforce + " km/h</span></li>";

                $('#mn-pistenbericht-details-list').append(item);

                // details
                $('#mn-pistenbericht-details-container').html();
                var output = '';
                var sections = ['ski', 'crosscountry', 'toboggan', 'avalanches', 'general'];
                for (var s in sections) {
                    var section = sections[s];
                    var items = slope.slope_results[section];
                    if (section != '@attributes') {
                        output += "<h4 class='table-collapse-trigger'>";
                        output += "<a href='#'>" + section + "</a></h4>";
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
                                        var dt = alarm['@attributes']['date'];
                                        var level = alarm['@attributes']['level'];
                                        displayValue += '<li><span>' + dt + ' - level ' + level + ' - ' + alarm.string + '</li>';
                                    }
                                    displayValue += '</ul>';
                                }
                                if (item == 'last_snowfall') {
                                    displayValue = items[item]['@attributes']['date']; 
                                }
                                // end specific formatting

                                //console.log(items[item]);

                            } else {
                                displayValue = items[item];
                            }

                            output += "<th>" + displayItem + "</th>" + "<td>" + displayValue + "</td>";
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

                $('#mn-pistenbericht-details-container').html(output);
                break;
            }
        }
        $('#mn-pistenbericht-details').show();
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

    showPrognosenRegions: function() {
        var count = 0;

        $('#mn-prognosen-regions-left-table tr').empty();
        $('#mn-prognosen-regions-right-table tr').empty();

        for (var r in this.importantRegions) {
            var region = this.importantRegions[r];
            var name = region.name;
            var id = region.id;
            var zip = region.zip;
            var symb = region.symb;
            var temp_min = region.temp_min;
            var temp_max = region.temp_max;
            var table = 'mn-prognosen-regions-left-table';

            if ((count % 2) ==  0) {
                table = 'mn-prognosen-regions-left-table';
            } else {
                table = 'mn-prognosen-regions-right-table';
            }
 
            var item = "<tr><th><p><strong>";
            item += "<a href='#' class='mn-lokalwetter-region-item' " +
                "data-role='link' " +
                "data-id='" + id + "' " +  
                "data-name='" + name + "' " +
                "data-zip='" + zip + "'>";
            item += name + "</a></strong>";
            item += "<br>550 NN";
            item += "</p></th>";

            item += "<td><img src='" + this.symbolsPath + symb + ".png' class='mn-symbol-small'>";
            item += temp_max + '/' + temp_min + '</td></tr>';

            $('#'+table+' tbody:last').append(item);
            count++;
        }
        $('#mn-prognosen-regions').show();
    },
    
    showTeaserSlopes: function(regionList) {
    
        // clear the table
        $('#mn-teaser-slopes-table tr').empty();

        for (var r in regionList) {
            var region = regionList[r];
            var name = region.name;
            var id = region.id;
            var zip = region.zip;
            var symb = region.symb;
            var subregion = region.region;
            var temp_min = region.temp_min;
            var temp_max = region.temp_max;
            var item = '<tr><th><p><strong>';

            item += "<a href='#' class='mn-lokalwetter-region-item' " +
                "data-role='link' " +
                "data-id='" + id + "' " +  
                "data-name='" + name + "' " +
                "data-zip='" + zip + "'>";
            item += name + "</a></strong>";
            item += "<br>" + subregion + "</p>";

            item += "</th>";
            item += "<td><img src='" + this.symbolsPath + symb + ".png' class='mn-symbol-small'> ";
            item += temp_max + '/' + temp_min + '</td></tr>';
            $('#mn-teaser-slopes-table tbody:last').append(item);
        }
    },
 
    showRegionList: function(displayId, regionList) {
    
        // clear the table
        $('#'+displayId+'-table tr').empty();

        for (var r in regionList) {
            var region = regionList[r];
            var name = region.name;
            var id = region.id;
            var zip = region.zip;
            var symb = region.symb;
            var subregion = region.region;
            var temp_min = region.temp_min;
            var temp_max = region.temp_max;
            var item = '<tr><th><p><strong>';

            item += "<a href='#' class='mn-lokalwetter-region-item' " +
                "data-role='link' " +
                "data-id='" + id + "' " +  
                "data-name='" + name + "' " +
                "data-zip='" + zip + "'>";
            item += name + "</a></strong>";

            if (displayId == 'mn-secondary-regions') {
                item += "<br>" + subregion + "</p>";
            } else {
                item += "<br>550 NN</p>";
            }

            item += "</th>";
            item += "<td><img src='" + this.symbolsPath + symb + ".png' class='mn-symbol-small'> ";
            item += temp_max + '/' + temp_min + '</td></tr>';
            $('#'+displayId+'-table tbody:last').append(item);
        }

        $('#'+displayId).show();
        $('#mn-lokalwetter-regions-container').show();
    },

    showForecastOverview: function(response) {
        var results = response.forecasts.content.timeperiod;
        var day = 0;
 
        $('#mn-forecast-overview').empty();
        $('#mn-forecast-button-bar').empty();

        for (var r in results) {
            var result = results[r];
            var temp_min = (result.temp_min['@text']) ? result.temp_min['@text'] : 0;
            var temp_min_unit = result.temp_min['@attributes']['unit'];
            var temp_max = (result.temp_max['@text']) ? result.temp_max['@text'] : 0;
            var temp_max_unit = result.temp_max['@attributes']['unit'];
            var txt = result['txt'];
            var date = meteonews.getDate(result['@attributes']['end_datetime']);
            var displayDate = meteonews.formatDate(date);
            var item = "<li style='height: 254px;'>";

            // add the overview
            item += "<small>" + displayDate + "</small>";
            item += "<img src='" + meteonews.symbolsPath + result.symb +".png' alt>";
            item += "<h4>" + temp_max + temp_max_unit +'/' + temp_min + temp_min_unit + "</h4>";
            item += "<p>" + txt + "</p>";
            item += "</li>";
            $('#mn-forecast-overview').append(item);
            
            // add the button
            button = "<li class='ui-state-default ui-corner-top ui-tabs-active ui-state-active mn-forecast-details-btn' " +
                "role='tab' " +
                "tabindex='0' " +
                "aria-controls='tab-" + (day+1) + "' " +
                "aria-labelledby='ui-id-"+(day+1)+"' " +
                "data-date='" + displayDate + "' " +
                "aria-selected='true'>";
            button += "<a href='#tab-1' " +
                "class='button white ui-tabs-anchor' " +
                "role='presentation' " +
                "tabindex='-1' " +
                "id='ui-id-"+(day+1)+"'>";
            button += "<span class='mobile-hide'>Detailprognose</span> ";
            button += "<span class='desktop-hide'>" + displayDate + "</span></a></li>";
            $('#mn-forecast-button-bar').append(button);

            day++;
        }
 
        $('#mn-forecast-overview').show();
        $('#mn-forecast-details').show();
    },

    showForecastDetails: function(response) {
        var results = response.forecasts.content.timeperiod;
        var fields = ['temp', 'temp_min', 'temp_max', 'gustforce', 'glob_rad', 'hum', 'precip',
            'precip_prob', 'freez_level', 'temp_dew', 'windforce', 'winddir', 'temp_wind', 'pres' ];

        var headerFields = ['temp', 'sun', 'precip', 'precip_prob', 'winddir', 'windforce'];

        // create date row
        var date = this.formatDate(new Date(this.startDate));
        $('#mn-prognose-date').html("Prognose " + date);

        // clear details table
        $('#mn-forecast-details-table tr').remove();

        for (var r in results) {
            var result = results[r];
            var time = this.formatTime(this.getDate(result['@attributes']['end_datetime']));
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
                        "style='-webkit-transform:rotate(" + value + "deg)'>";
                }
                if (field == 'windforce') {
                    headerRow += value + " " + unit + '</td>';
                }
            }
            headerRow += "<td><a href='#' class='trigger active'>Close</a></td></tr>";
            $('#mn-forecast-details-table > tbody:last').append(headerRow);
           
            // create details row
            detailRow = "<tr class='inner'><td colspan='6'><div class='inner-table' style='display: none;'>";
            detailRow += "<table id='mn-forecast-details-inner-table' cellpadding='0' cellspacing='0'>";
            detailRow += "<colgroup><col width='270'><col width></colgroup>";
            detailRow += "<tbody>";

            for (var f in fields) {
                var field = fields[f];
                var value = (result[field]['@text']) ? result[field]['@text'] : 0;
                detailRow += "<tr><td>" + field + '</td><td>' + value;
                detailRow += " " + result[field]['@attributes']['unit'];
                detailRow += "</td></tr>";
            }
            detailRow += "</tbody></table></tr>";
            $('#mn-forecast-details-table > tbody:last').append(detailRow);
        }
 
        $('#mn-forecast-details').show();
    },

    showSearchResults: function(response) {
        var output = '';
        var results = response.search.content.suggest;
        var fields = ['name', 'country', 'state', 'zip' ];
        for (var r in results) {
            var result = results[r];
            output += "<div class='mn-search-result div-table-row' ";
            output += "data-id='" + result.geoname_id + "' ";
            output += "data-zip='" + result.zip + "' ";
            output += "data-name='" + result.name + "'>";
            for (var f in fields) {
                var field = fields[f];
                output += "<div class='mn-search-result-col div-table-col'>" + result[field] + "</div>";
            }
            output += "</div>";

        }
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

        //$('#mn-lokalwetter-searchform').html(output);
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

    showLoading: function() {
        $('.main').prepend("<div id='mn-overlay-black'></div>");
        $('.main').prepend("<div id='mn-overlay-white'></div>");
    },

    hideLoading: function() {
        $('#mn-overlay-white').remove(); 
        $('#mn-overlay-black').remove(); 
    },

    showElement: function(element) {
        $('#'+element).show();
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

    isLoaded: function(total, loaded) {
        return (total == loaded) ? true : false;
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
                    console.log(JSON.stringify(errorMsg));
                }
            });
        }
    },

    getDate: function(dateString) {
        var dateParts = dateString.split(' ');
        var timeParts = dateParts[1].split(':');
        var date = new Date(dateParts[0]);
        date.setHours(timeParts[0]);
        date.setMinutes(timeParts[1]);
        return date;
    },

    formatDate: function(date) {
        dateString = date.getFullYear() + '-' + 
            ('0' + (date.getMonth()+1)).slice(-2) + '-' + 
            ('0' + date.getDate()).slice(-2);
        return dateString;
    },

    formatDateTime: function(date) {
        dateString = date.getFullYear() + '-' + 
            ('0' + (date.getMonth()+1)).slice(-2) + '-' + 
            ('0' + date.getDate()).slice(-2) + 'T' + 
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
        var url = meteonews.domain + '/' + feed

        $.ajax({
            url: meteonews.proxyUrl + "?url=" + encodeURIComponent(url),
            type: 'get',
            success: function(data) {
                var results = data.search.content.suggest;
                var output = [];

                for (var r in results) {
                    var result = results[r];
                    var label = result.name;
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
                response(output);
            }
        });
    },
};

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
    meteonews.hideAllElements();
    meteonews.makeActive('mn-lokalwetter');
    meteonews.setLocation($(this).attr('data-id'), $(this).attr('data-zip'), $(this).attr('data-name'));
    meteonews.getForecastOverview(meteonews.showForecastOverview);
    meteonews.getDailyForecastDetails(new Date());
    meteonews.getImportantRegions();
    meteonews.getImportantWinterRegions();
    $('#mn-search-text').val('');
});

$('.mn-forecast-details-btn').live('click', function() {
    var date = $(this).attr('data-date');
    meteonews.getDailyForecastDetails(date);
    return false;
});

/* main menu items */
$('#mn-lokalwetter').live('click', function() {
    meteonews.hideAllElements();
    meteonews.makeActive('mn-lokalwetter');
    meteonews.showLocalSearch();

    $('#mn-lokalwetter-regions-container').show();
    $('#mn-primary-regions').show();
    $('#mn-secondary-regions').show();

    meteonews.getImportantWinterRegions();
    meteonews.getImportantRegions();
});

$('#mn-prognosen').live('click', function() {
    meteonews.hideAllElements();
    $('#mn-searchform').show();
    meteonews.makeActive('mn-prognosen');
    meteonews.setLocation(meteonews.defaultLocationId, meteonews.defaultLocationZip, meteonews.defaultLocationName);
    meteonews.setLocationTitle('Prognosen Zentralscheiz');
    meteonews.getPrognosenRegions();
    meteonews.getPrognosenText();
});

$('#mn-pistenbericht').live('click', function() {
    meteonews.hideAllElements();
    $('#mn-searchform').show();
    meteonews.setLocationTitle('Pistenbericht');
    meteonews.makeActive('mn-pistenbericht');
    meteonews.getPistenbericht();
    meteonews.getAllPistenbericht();
});

$('.mn-lokalwetter-region-item').live('click', function() {
    var role = $(this).attr('data-role');
    if (role == 'link') {
        meteonews.hideAllElements();
        $('#mn-searchform').show();
        meteonews.setLocation($(this).attr('data-id'), $(this).attr('data-zip'), $(this).attr('data-name'));
        meteonews.getForecastOverview(meteonews.showForecastOverview);
        meteonews.getDailyForecastDetails(new Date());
        meteonews.getImportantRegions();
        meteonews.getImportantWinterRegions();
    } else {
        meteonews.showSubregions($(this).attr('data-code'), $(this).attr('data-role'));
        $(this).addClass('active');
        return false;
    }
});

$('.mn-pistenbericht-link').live('click', function() {
    var id = $(this).attr('data-id');
    var list = $(this).attr('data-list');
    meteonews.hideAllElements();
    meteonews.setLocation($(this).attr('data-id'), '', $(this).attr('data-name'));
    meteonews.showPistenberichtDetails(id, list);
    return false;
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


// testing only
$('#mn-header-location-title').live('click', function() {
    console.log(meteonews.teaserSlopes);
    meteonews.showLoading();
});

// autocompletes
/*
$('#mn-search-text').autocomplete({
    source: function (request, response) {
        meteonews.autoCompleteLookup(request, response);
    },
    select: function(event, ui) {
        meteonews.hideAllElements();
        meteonews.makeActive('mn-lokalwetter');
        meteonews.setLocation(ui.item.id, '', ui.item.label);
        meteonews.getForecastOverview(meteonews.showForecastOverview);
        meteonews.getDailyForecastDetails(new Date());
        meteonews.getImportantRegions();
        meteonews.getImportantWinterRegions();
        $('#mn-searchform').show();
        $('#mn-search-text').val('');
    }
});

$('#mn-lokkalwetter-search-text').autocomplete({
    source: function (request, response) {
        meteonews.autoCompleteLookup(request, response);
    },
    select: function(event, ui) {
        meteonews.hideAllElements();
        meteonews.makeActive('mn-lokalwetter');
        meteonews.setLocation(ui.item.id, '', ui.item.label);
        meteonews.getForecastOverview(meteonews.showForecastOverview);
        meteonews.getDailyForecastDetails(new Date());
        meteonews.getImportantRegions();
        meteonews.getImportantWinterRegions();
        $('#mn-searchform').show();
        $('#mn-search-text').val('');
    }
});

*/
