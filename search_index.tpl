{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    	<div class="content-wrapper top-line events-content">

            <div class="search_results_wrap">
                    <p>Suchresultate für</p>
                    <fieldset class="search">
{{ form_search_solr class="hidden-phone" }}
  {{ form_text name="q" value=$smarty.get.q placeholder="{{ $smarty.get.q|default:''|escape }}" }}
  {{ form_submit name="" value="Go" }}
{{ /form_search_solr }}                      
                    </fieldset>
            </div>
        
        	<div class="content no-bottom-line equal-heights clearfix">
            
            	<div class="events-aside info-text clearfix">
                	
                    <div class="box desktop-hide">
                        <h4>Type</h4>

                        <select id="selectboxType" class="dropdownized" onchange="javascript:location.href = this.value;">
                            <option {{ if $smarty.get.type == ""}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Alle</option>
                            <option {{ if $smarty.get.type == "news"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=news{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">News</option>                            
                            <option {{ if $smarty.get.type == "dossier"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=dossier{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Dossiers</option>
                            <option {{ if $smarty.get.type == "blog"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=blog{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Blogbeitrage</option>
                            <option {{ if $smarty.get.type == "event"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=event{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Veranstalungen</option>
                            <option {{ if $smarty.get.type == "restaurant"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=restaurant{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Restaurant</option>
                        </select>

                    </div>

                    <div class="box desktop-hide" onchange="javascript:location.href = this.value;">
                        <h4>Time</h4>
                        <select id="selectboxPublished" class="dropdownized" onchange="javascript:location.href = this.value;">
                            <option {{ if $smarty.get.published == ""}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}">Alle</option>
                            <option {{ if $smarty.get.published == "24h"}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.type }}&type={{ $smarty.get.type|default:''|escape }}{{ /if }}&published=24h">Letze 24 Stunden</option>
                            <option {{ if $smarty.get.published == "7d"}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.type }}&type={{ $smarty.get.type|default:''|escape }}{{ /if }}&published=7d">Letze 7 Tage</option>
                            <option {{ if $smarty.get.published == "1y"}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.type }}&type={{ $smarty.get.type|default:''|escape }}{{ /if }}&published=1y">Dieses Jahr</option>
                        </select>
                    </div>
                    
                	<ul class="custom-list tag-list filter-list">
                        <h4>Suche eingrenzen</h4>
                    	<li{{ if $smarty.get.type == ""}} class="active"{{ /if }}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Alle</a></li>
                        <li{{ if $smarty.get.type == "news"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=news{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Artikel</a></li>
                    	<li{{ if $smarty.get.type == "dossier"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=dossier{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Dossiers</a></li>
                        <li{{ if $smarty.get.type == "blog"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=blog{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Blogbeitrage</a></li>
                        <li{{ if $smarty.get.type == "event"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=event{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Veranstalungen</a></li>
                        <li{{ if $smarty.get.type == "restaurant"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=restaurant{{ if $smarty.get.published }}&published={{ $smarty.get.published|default:''|escape }}{{ /if }}">Restaurant</a></li>
                    </ul>

                    <ul class="custom-list tag-list filter-list">
                        <li{{ if $smarty.get.published == ""}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}">Alle</a></li>
                        <li{{ if $smarty.get.published == "24h"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.type }}&type={{ $smarty.get.type|default:''|escape }}{{ /if }}&published=24h">Letze 24 Stunden</a></li>
                        <li{{ if $smarty.get.published == "7d"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.type }}&type={{ $smarty.get.type|default:''|escape }}{{ /if }}&published=7d">Letze 7 Tage</a></li>
                        <li{{ if $smarty.get.published == "1y"}} class="active"{{ /if}}><a href="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.type }}&type={{ $smarty.get.type|default:''|escape }}{{ /if }}&published=1y">Dieses Jahr</a></li>
                    </ul>

{{*
					{{ assign var="solrKeyword" value=$smarty.get.q }}
                    <form id="date_range" action="/search?{{ urlparameters }}&{{ $solrKeyword }}" method="post">
                        <div class="formbody">
                            <!-- input type="hidden" name="FORM_SUBMIT" value="je_filter_26" -->
                            <!-- input type="hidden" name="REQUEST_TOKEN" value=" " -->

                            <div id="datestart">
                              <label for="ctrl_datestart" class="date startdate">Von</label> 
                              <input type="text" name="from" id="ctrl_datestart" class="datestart" value="" maxlength="10">
                            </div>

                            <div id="dateend">
                              <label for="ctrl_dateend" class="date enddate">Bis</label> 
                              <input type="text" name="to" id="ctrl_dateend" class="datestart" value="" maxlength="10">
                            </div>

                            <input class="button white wide" type="submit" name="submit" value="Suche eingrenzen">
                        </div>
                    </form>
*}}                
                </div>
    
                <div class="main left-thumb article-spacing clearfix">

{{ list_search_results_solr fq="{{ build_solr_fq }}" qf="title^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" rows=10 start=$smarty.get.start }}
                    
                    <article class="search-afix">
                        <h6>{{ if $gimme->article->dateline }}<a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a>{{ else }}<a href="{{ url options="section" }}">{{ $gimme->section->name }}</a>{{ /if }}</h6>                     
                        {{ capture name="hasimg" assign="hasimg" }}
                        {{ image rendition="artthumb" }}
                        <figure> 
                    <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>
                        </figure>
{{ /image }}                        
                        {{ /capture }}
                        {{ if trim($hasimg) }}{{ $hasimg }}{{ /if }}                        
                        
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ if $gimme->article->lede|strip_tags:false }}{{ $gimme->article->lede|strip_tags:false }}{{ elseif $gimme->article->body|strip_tags:false }}{{ $gimme->article->body|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->infolong }}{{ $gimme->article->infolong }}{{ elseif $gimme->article->teaser }}{{ $gimme->article->teaser|truncate:200 }}{{ elseif $gimme->article->description }}{{ $gimme->article->description|truncate:200 }}{{ elseif $gimme->article->other }}{{ $gimme->article->other }}{{ /if }} <br />
                        </p>
                        <time>{{ if $gimme->article->type_name == "newswire" }}Von Swiss txt{{ elseif $gimme->article->type_name == "blog" }}Blogbeitrage{{ else }}Artikel{{ /if }}, {{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                    </article>
                    
{{ if $gimme->current_list->at_end }}                   
					{{ $getType=$smarty.get.type }}
					{{ $getPublished=$smarty.get.published }}         
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="/search?q={{ $smarty.get.q|escape }}&type={{ $getType }}&published={{ $getPublished }}&start={{ $prevstart }}">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="/search?q={{ $smarty.get.q|escape }}&type={{ $getType }}&published={{ $getPublished }}&start={{ $nextstart }}">›</a></li>
                      {{ /if }}
                    </ul>                 
{{ /if }} 

{{ /list_search_results_solr }}
                 
                      {{ if $gimme->prev_list_empty }}
  							<p>Ihre Suche lieferte keine Treffer</p>
					  {{ /if }}
                
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                    {{*
                    <div class="ad top-space">
                        <small>Werbung</small>
                        <a href="#"><img alt="" src="pictures/ad-2.jpg"></a>
                    </div>
                    *}}
                </div><!-- / Aside -->
            
            </div>
    
        </div><!-- / Content Wrapper -->

    
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>