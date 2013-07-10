<div id="mn-wanderwetter-graph">
                <h3>Bergwetter Zentralschweiz</h3>
                
                <div class="spec-tabs">
                
                	<ul class="button-nav">
                        <li><a href="#main-tab-1">Prognose {{ $smarty.now|date_format:"%d.%m" }}</a></li>
                        <li><a href="#main-tab-2">Prognose {{ "+1 days"|date_format:"%d.%m" }}</a></li>
                        <li><a href="#main-tab-3">Prognose {{ "+2 days"|date_format:"%d.%m" }}</a></li>
                        <li><a href="#main-tab-4">Prognose {{ "+3 days"|date_format:"%d.%m" }}</a></li>
                        <li><a href="#main-tab-5">Prognose {{ "+4 days"|date_format:"%d.%m" }}</a></li>
                    </ul>
                    
                    <div id="main-tab-1" class="spec-tabs inner-tabs">
                    
                    	<ul class="button-nav">
                            <li><a href="#inner-tab-1-1">6:00</a></li>
                            <li><a href="#inner-tab-1-2">9:00</a></li>
                            <li><a href="#inner-tab-1-3">12:00</a></li>
                            <li><a href="#inner-tab-1-4">15:00</a></li>
                            <li><a href="#inner-tab-1-5">18:00</a></li>
                        </ul>
                        
                        <div id="inner-tab-1-1" class="diagram-table">
                        {{ assign var="stat_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
                        {{ assign var="hour" value="6" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                         
                        </div><!-- / Inner tab 1 -->
                        
                        <div id="inner-tab-1-2" class="diagram-table">
                        {{ assign var="stat_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
                        {{ assign var="hour" value="9" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 2 -->
                        
                        <div id="inner-tab-1-3" class="diagram-table">
                        {{ assign var="stat_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
                        {{ assign var="hour" value="12" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        
                        </div><!-- / Inner tab 3 -->
                        
                        <div id="inner-tab-1-4" class="diagram-table">
                        {{ assign var="stat_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
                        {{ assign var="hour" value="15" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        
                        </div><!-- / Inner tab 4 -->
                        
                        <div id="inner-tab-1-5" class="diagram-table">
                        {{ assign var="stat_date" value=$smarty.now|date_format:"%Y-%m-%d" }}
                        {{ assign var="hour" value="18" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        
                        </div><!-- / Inner tab 5 -->
                    
                    </div><!-- / Main tab 1 -->
                    
                    <div id="main-tab-2" class="spec-tabs inner-tabs">
                    
                    	<ul class="button-nav">
                            <li><a href="#inner-tab-2-1">6:00</a></li>
                            <li><a href="#inner-tab-2-2">9:00</a></li>
                            <li><a href="#inner-tab-2-3">12:00</a></li>
                            <li><a href="#inner-tab-2-4">15:00</a></li>
                            <li><a href="#inner-tab-2-5">18:00</a></li>
                        </ul>
                        
                        <div id="inner-tab-2-1" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+1 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="6" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 1 -->
                        
                        <div id="inner-tab-2-2" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+1 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="9" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 2 -->
                        
                        <div id="inner-tab-2-3" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+1 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="12" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 3 -->
                        
                        <div id="inner-tab-2-4" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+1 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="15" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 4 -->
                        
                        <div id="inner-tab-2-5" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+1 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="18" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 5 -->
                    
                    </div><!-- / Main tab 2 -->
                    
                    <div id="main-tab-3" class="spec-tabs inner-tabs">
                    
                    	<ul class="button-nav">
                            <li><a href="#inner-tab-3-1">6:00</a></li>
                            <li><a href="#inner-tab-3-2">9:00</a></li>
                            <li><a href="#inner-tab-3-3">12:00</a></li>
                            <li><a href="#inner-tab-3-4">15:00</a></li>
                            <li><a href="#inner-tab-3-5">18:00</a></li>
                        </ul>
                        
                        <div id="inner-tab-3-1" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+2 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="6" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 1 -->
                        
                        <div id="inner-tab-3-2" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+2 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="9" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 2 -->
                        
                        <div id="inner-tab-3-3" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+2 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="12" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 3 -->
                        
                        <div id="inner-tab-3-4" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+2 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="15" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 4 -->
                        
                        <div id="inner-tab-3-5" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+2 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="18" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 5 -->
                    
                    </div><!-- / Main tab 3 -->
                    
                    <div id="main-tab-4" class="spec-tabs inner-tabs">
                    
                    	<ul class="button-nav">
                            <li><a href="#inner-tab-4-1">6:00</a></li>
                            <li><a href="#inner-tab-4-2">9:00</a></li>
                            <li><a href="#inner-tab-4-3">12:00</a></li>
                            <li><a href="#inner-tab-4-4">15:00</a></li>
                            <li><a href="#inner-tab-4-5">18:00</a></li>
                        </ul>
                        
                        <div id="inner-tab-4-1" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+3 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="6" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 1 -->
                        
                        <div id="inner-tab-4-2" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+3 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="9" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 2 -->
                        
                        <div id="inner-tab-4-3" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+3 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="12" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 3 -->
                        
                        <div id="inner-tab-4-4" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+3 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="15" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 4 -->
                        
                        <div id="inner-tab-4-5" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+3 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="18" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 5 -->
                    
                    </div><!-- / Main tab 4 -->
                    
                    <div id="main-tab-5" class="spec-tabs inner-tabs">
                    
                    	<ul class="button-nav">
                            <li><a href="#inner-tab-5-1">6:00</a></li>
                            <li><a href="#inner-tab-5-2">9:00</a></li>
                            <li><a href="#inner-tab-5-3">12:00</a></li>
                            <li><a href="#inner-tab-5-4">15:00</a></li>
                            <li><a href="#inner-tab-5-5">18:00</a></li>
                        </ul>
                        
                        <div id="inner-tab-5-1" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+4 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="6" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 1 -->
                        
                        <div id="inner-tab-5-2" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+4 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="9" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 2 -->
                        
                        <div id="inner-tab-5-3" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+4 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="12" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 3 -->
                        
                        <div id="inner-tab-5-4" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+4 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="15" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 4 -->
                        
                        <div id="inner-tab-5-5" class="diagram-table">
                        {{ assign var="stat_date" value=strtotime('+4 days') }} 
                        {{ $stat_date=$stat_date|date_format:'%Y-%m-%d' }}
                        {{ assign var="hour" value="18" }}
                        {{ include file="_tpl/weather-bergwetter-table.tpl"}}
                        
                        </div><!-- / Inner tab 5 -->
                    
                    </div><!-- / Main tab 5 -->
                
                </div><!-- / Tabs top level -->

        <h3>Beliebte Ziele</h3>
        <div class="box">
            <table cellpadding="0" cellspacing="0" class="top-line">
              <colgroup>
                <col width="">
                <col width="110">
              </colgroup>
                <tbody>

                {{ list_weather_stats location_list="wanderwetter_regions" }}
                  <tr>
                    
                    <th><p><strong><a href="#" class='mn-lokalwetter-region-item' data-role='link' data-type='geonames' data-id='{{ $gimme->weather_location->location_id }}' data-name='{{ $gimme->weather_location->location_name }}'>{{ $gimme->weather_location->location_name }}</a></strong>
                        <br>{{ $gimme->weather_location->region_name }} ({{ $gimme->weather_location->elevation }}m ü.M.)</p></th>
                    <td>
                    <img src='{{ url static_file="assets/img/meteonews/symb/"}}{{ $gimme->weather_location->symbol }}.png' class='mn-symbol-small'> {{ $gimme->weather_location->temperature_max }}° / {{ $gimme->weather_location->temperature_min }}°
                    </td>
                  </tr>
                {{ /list_weather_stats }}
                </tbody>
            </table>
    </div>
</div>
