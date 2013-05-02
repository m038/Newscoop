<div id="mn-wanderwetter-graph">
                <h3>Bergwetter Zentralschweiz</h3>
                
                <div class="spec-tabs">
                
                	<ul class="button-nav">
                        <li><a href="#main-tab-1">Prognose 15.10</a></li>
                        <li><a href="#main-tab-2">Prognose 16.10</a></li>
                        <li><a href="#main-tab-3">Prognose 17.10</a></li>
                        <li><a href="#main-tab-4">Prognose 18.10</a></li>
                        <li><a href="#main-tab-5">Prognose 19.10</a></li>
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
                <col width="100">
              </colgroup>
                <tbody>

                  <tr>
                    <th><p>Ort/Region<strong><br><a href="#">Klewenalp – Stockhütte</a></strong></p></th>
                    <td><img src="pictures/weather/icon-sun-40.jpg" alt=""> 3°/-2</td>
                  </tr>

                </tbody>
            </table>
    </div>
</div>
