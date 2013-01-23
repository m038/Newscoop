{{ include file="_tpl/_html-head.tpl" }}

<body>

	<div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    	<div class="content-wrapper top-line events-content">
        
        	<div class="content no-bottom-line clearfix">
            
            	<div class="events-aside info-text clearfix">
                	
                    <div class="box desktop-hide">
                        <h4>Zeige</h4>
                        <select class="dropdownized">
                            <option value="Alle Themen">Alle Rubriken</option>
                            {{ list_sections constraints="number smaller_equal 70" }}
                            <option value="{{ $gimme->section->name }}">{{ $gimme->section->name }}</option>
                            {{ /list_sections }}
                        </select>
                    </div>
                    
                	<ul class="custom-list tag-list">
                    	<li{{ if !$smarty.get.sec }} class="active"{{ /if }}><a href="{{ url options="root_level" }}?tpl=50">Alle Rubriken</a></li>
                    	{{ list_sections constraints="number smaller_equal 50" }}                    	
                    	<li{{ if $smarty.get.sec == $gimme->section->name }} class="active"{{ /if }}><a href="{{ $gimme->url->reset_parameter(issue) }}{{ $gimme->url->reset_parameter(sec) }}{{ url options="template ticker.tpl" }}&sec={{ $gimme->section->name }}">{{ $gimme->section->name }}</a></li>
                    	{{ /list_sections }}
                    </ul>
                
                </div>
    
                <div class="main">
            
                    <ul class="ticker-accordion">

                      {{ assign var="mydate" value=strtotime('-1 days') }} 
                      {{ $mydate=$mydate|date_format:'%Y-%m-%d' }}
                      {{ assign var="secCond" value="" }}
                      {{ if $smarty.get.sec }}
                      {{ set_section name="{{ $smarty.get.sec }}" }}
                      {{ assign var="secCond" value="section is {{ $gimme->section->number }}" }}
                      {{ set_default_section }}
                      {{ /if }}                      
                      {{ assign var="artCond" value="" }} 
                      {{ if $gimme->default_article->defined }}
                    	<li>
                        	<a href="#" class="head">
                            	<time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                            	<h3>{{ $gimme->article->name }}</h3>
                            	<p>{{ $gimme->section->name }}</p>
                            </a>
                            <div>
                                {{ $gimme->article->DataContent }}
                            </div>
                        </li>  
                      {{ assign var="artCond" value="number not {{ $gimme->article->number }}" }}                     
                      {{ /if }}                    
{{ list_articles length="50" order="bypublishdate desc" ignore_section="true" constraints="type is newswire publish_date greater_equal $mydate $artCond $secCond"  }}                    
                    
                    	<li>
                        	<a href="#" class="head">
                            	<time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                            	<h3>{{ $gimme->article->name }}</h3>
                            	<p>{{ $gimme->section->name }}</p>
                            </a>
                            <div>
                                <p>{{ $gimme->article->DataContent }}</p>
                            </div>
                        </li>

{{ /list_articles }} 
                    
                    </ul>
                
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                    <div class="ad top-space">
                        <!--small>Werbung</small-->
                    </div>
                
                </div><!-- / Aside -->
            
            </div>
    
        </div><!-- / Content Wrapper -->
                    
        <div class="hide">
        
            <div id="themen-verwalten" class="popup-info-box clearfix">
            
                <h4>Themen verwalten</h4>
                <p>Sie haben folgende Themen abonniert:</p>
                <ul class="bottom-line">
                    <li><input type="checkbox" value="1" id="energiepolitk" /><label for="energiepolitk">Energiepolitk</label></li>
                    <li><input type="checkbox" value="2" id="akw" /><label for="akw">AKW</label></li>
                </ul>
                <input type="submit" value="Speichern" class="button red right" />
            
            </div>
        
        </div><!-- / Popup -->
    
    </div>

{{ include file="_tpl/footer.tpl" }}
	
{{ include file="_tpl/_html-foot.tpl" }}	

</body>
</html>
