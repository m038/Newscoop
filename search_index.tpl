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
                            <option {{ if $smarty.get.fqtype == ""}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.fqpublished }}&published={{ $smarty.get.fqpublished|default:''|escape }}{{ /if }}">Alle</option>
                            <option {{ if $smarty.get.fqtype == "news"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=news{{ if $smarty.get.fqpublished }}&published={{ $smarty.get.fqpublished|default:''|escape }}{{ /if }}">News</option>   
                            <option {{ if $smarty.get.fqtype == "event"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=newswire{{ if $smarty.get.fqpublished }}&published={{ $smarty.get.fqpublished|default:''|escape }}{{ /if }}">Newsticker</option>  
                            <option {{ if $smarty.get.fqtype == "dossier"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=dossier{{ if $smarty.get.fqpublished }}&published={{ $smarty.get.fqpublished|default:''|escape }}{{ /if }}">Dossiers</option>
                            <option {{ if $smarty.get.fqtype == "blog"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=blog{{ if $smarty.get.fqpublished }}&published={{ $smarty.get.fqpublished|default:''|escape }}{{ /if }}">Blogbeiträge</option>
                            <option {{ if $smarty.get.fqtype == "restaurant"}} selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}&type=restaurant{{ if $smarty.get.fqpublished }}&published={{ $smarty.get.fqpublished|default:''|escape }}{{ /if }}">Restaurant</option>
                        </select>

                    </div>

                    <div class="box desktop-hide" onchange="javascript:location.href = this.value;">
                        <h4>Time</h4>
                        <select id="selectboxPublished" class="dropdownized" onchange="javascript:location.href = this.value;">
                            <option {{ if $smarty.get.fqpublished == ""}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}">Alle</option>
                            <option {{ if $smarty.get.fqpublished == "24h"}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.fqtype }}&type={{ $smarty.get.fqtype|default:''|escape }}{{ /if }}&published=24h">Letzte 24 Stunden</option>
                            <option {{ if $smarty.get.fqpublished == "7d"}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.fqtype }}&type={{ $smarty.get.fqtype|default:''|escape }}{{ /if }}&published=7d">Letzte 7 Tage</option>
                            <option {{ if $smarty.get.fqpublished == "1y"}}selected{{ /if }} value="{{ url options="root_level" }}search?q={{ $smarty.get.q|default:''|escape }}{{ if $smarty.get.fqtype }}&type={{ $smarty.get.fqtype|default:''|escape }}{{ /if }}&published=1y">Dieses Jahr</option>
                        </select>
                    </div>

			{{ $types = $smarty.get.type }}
			{{ if !$types }}
				{{ $types = ['news', 'dossier', 'blog'] }} 
			{{ /if }}
			{{ if in_array('x', $types) }}
				{{ $types = ['x', 'news', 'newswire', 'dossier', 'blog', 'restaurant'] }}
			{{ /if }}
					<form id="searchFilters" action="/search" method="get">
                        			<input type="hidden" name="q" value="{{ $smarty.get.q|escape }}" />
 					<ul class="custom-list tag-list filter-list">
    				<h4>Suche eingrenzen</h4>
            			{{ $options = ['x' => 'Alle', 'news' => 'Artikel', 'newswire' => 'Newsticker', 'dossier' => 'Dossiers', 'blog' => 'Blogbeiträge', 'restaurant' => 'Restaurants'] }}
            			{{ foreach $options as $val => $title }}
            			<li class="li_{{ $val }}" id="li_{{ $val }}">
            				<input{{ if in_array($val, $types) }} checked{{ /if}} class="{{ $val }}_check ui-helper-hidden-accessible type-check" name="type[]" value="{{ $val|escape }}" type="checkbox" id="filter_{{ $val }}" {{ if $val == 'x' }}onchange="this.form.submit();"{{ /if }}>
            				<label for="filter_{{ $val }}" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="{{ $val }}" aria-pressed="false">
    <span class="ui-button-text">{{ $title }}</span>
                               </label>
                            </li>
            			{{ /foreach }}
            		</ul>

			<script type="text/javascript">
			$(function() {
				var toggleCheckbox = $('.type-check').first();
				$('.type-check').not(':first').change(function(e) {
					if (!$(this).prop('checked')) {
						$(toggleCheckbox).prop('checked', false).change();
					}
					$(this).closest('form').submit();
				});
			});
			</script>

                    <ul class="custom-list tag-list filter-list">

			{{ $active = $smarty.get.published }}
			{{ $options = ['*' => 'Alle', '24h' => 'Letzte 24 Stunden', '7d' => 'Letzte 7 Tage', '1y' => 'Dieses Jahr'] }}
			{{ foreach $options as $val => $title }}
				
            				<li class="li_pub_{{ $val }}" id="li_pub_{{ $val }}">
            				   <input{{ if $active == $val }} checked{{ /if}} class="pub_{{ $val }}_check ui-helper-hidden-accessible" name="published" value="{{ $val }}" type="radio" id="filter_pub_{{ $val }}" onchange="this.form.submit();">
            				   <label for="filter_pub_{{ $val }}" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="{{ $val }}" aria-pressed="false">
    <span class="ui-button-text">{{ $title }}</span>
                               </label>
                            </li>				
				
			{{ /foreach }}

		     {{ if !$smarty.get.published && $smarty.get.from }}
			<input type="hidden" name="from" value="{{ $smarty.get.from|escape }}" />
		     {{ /if }}
		     {{ if !$smarty.get.published && $smarty.get.to }}
			<input type="hidden" name="to" value="{{ $smarty.get.to|escape }}" />
		     {{ /if }}

                    </ul>

            		</form>

                    <form id="date_range" action="/search" method="get">
                        <div class="formbody">
                            <input type="hidden" name="q" value="{{ $smarty.get.q|escape }}" />
				{{ foreach $types as $type }}
				<input type="hidden" name="type[]" value="{{ $type|escape }}" />
				{{ /foreach }}

                            <div id="datestart">
                              <label for="ctrl_datestart" class="date startdate">Von</label> 
                              <input type="text" name="from" id="ctrl_datestart" class="datestart" {{ if $smarty.get.from }}value="{{ $smarty.get.from }}"{{ else }}placeholder="JJJJ-MM-TT"{{ /if}} maxlength="10" />
                            </div>

                            <div id="dateend">
                              <label for="ctrl_dateend" class="date enddate">Bis</label> 
                              <input type="text" name="to" id="ctrl_dateend" class="datestart" {{ if $smarty.get.to }}value="{{ $smarty.get.to }}"{{ else }}placeholder="JJJJ-MM-TT"{{ /if}} maxlength="10" />
                            </div>

                            <input class="button white wide" type="submit" value="Suche eingrenzen">
                        </div>
                    </form>
                
                </div>
    
                <div class="main left-thumb article-spacing clearfix">

                {{ $fqtype = sprintf('(%s)', implode(' OR ', $types)) }}

{{ list_search_results_solr fq="{{ build_solr_fq fqpublished=$smarty.get.published fqtype=$fqtype fqfrom=$smarty.get.from fqto=$smarty.get.to }}" qf="title^5 authors^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" rows=10 start=$smarty.get.start }}
                    
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
                        <time>{{ if $gimme->article->type_name == "newswire" }}Von Swiss txt{{ elseif $gimme->article->type_name == "blog" }}Blogbeiträge{{ elseif $gimme->article->type_name == "dossier" }}Dossier{{ else }}Artikel{{ /if }}, {{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                    </article>
                    
{{ if $gimme->current_list->at_end }}          
					{{ foreach $types as $type name="tipovi" }}
					{{ if $smarty.foreach.tipovi.first }}
					{{ $types = $smarty.get.type }}        
					{{ $getTypes="&type={{ $type }}" }}
					{{ else }}
					{{ $getTypes="{{ $getTypes }}&type={{ $type }}" }}
					{{ /if }}
				    {{ /foreach }}
					{{ $getPublished=$smarty.get.published }} 
					{{ $getFrom=$smarty.get.from }}
					{{ $getTo=$smarty.get.to }}
					{{ if $getTo || $getFrom }}{{ $getPublished="" }}{{ /if }}    
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="/search?q={{ $smarty.get.q|escape }}{{ $getTypes }}&published={{ $getPublished }}&to={{ $getTo }}&from={{ $getFrom }}&start={{ $prevstart }}">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="/search?q={{ $smarty.get.q|escape }}{{ $getTypes }}&published={{ $getPublished }}&to={{ $getTo }}&from={{ $getFrom }}&start={{ $nextstart }}">›</a></li>
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
