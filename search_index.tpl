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
                        <select class="dropdownized">
                            <option value="Alle">Alle</option>
                            <option value="Dossiers">Dossiers</option>
                            <option value="Blogbeitrage">Blogbeitrage</option>
                            <option value="Kommentare">Kommentare</option>
                            <option value="Veranstalungen">Veranstalungen</option>
                        </select>
                    </div>

                    <div class="box desktop-hide">
                        <h4>Time</h4>
                        <select class="dropdownized">
                            <option value="Alle">Alle</option>
                            <option value="Letze 24 Stunden">Letze 24 Stunden</option>
                            <option value="Letze 7 Tage">Letze 7 Tage</option>
                            <option value="Dieses Jahr">Dieses Jahr</option>
                        </select>
                    </div>
                    
                	<ul class="custom-list tag-list filter-list">
                        <h4>Suche eingrenzen</h4>
                    	<li class="active"><a href="#">Alle</a></li>
                        <li><a href="#">Artikel</a></li>
                    	<li><a href="#">Dossiers</a></li>
                        <li><a href="#">Blogbeitrage</a></li>
                    	<li><a href="#">Kommentare</a></li>
                        <li><a href="#">Veranstalungen</a></li>
                    </ul>

                    <ul class="custom-list tag-list filter-list">
                        <li class="active"><a href="#">Alle</a></li>
                        <li><a href="#">Letze 24 Stunden</a></li>
                        <li><a href="#">Letze 7 Tage</a></li>
                        <li><a href="#">Dieses Jahr</a></li>
                    </ul>

                    <form id="date_range" action="#" method="post">
                        <div class="formbody">
                            <input type="hidden" name="FORM_SUBMIT" value="je_filter_26">
                            <input type="hidden" name="REQUEST_TOKEN" value=" ">

                            <div id="datestart">
                              <label for="ctrl_datestart" class="date startdate">Von</label> 
                              <input type="text" name="datestart" id="ctrl_datestart" class="datestart" value="" maxlength="10">
                            </div>

                            <div id="dateend">
                              <label for="ctrl_dateend" class="date enddate">Bis</label> 
                              <input type="text" name="datestart" id="ctrl_dateend" class="datestart" value="" maxlength="10">
                            </div>

                            <input class="button white wide" type="submit" name="submit" value="Suche eingrenzen">
                        </div>
                    </form>
                    <!--
                    <a href="#themen-verwalten" class="button white wide fancybox phone-hide">Themen verwalten</a>
                	-->
                
                </div>
    
                <div class="main left-thumb article-spacing clearfix">

{{ list_search_results_solr qf="title^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" fq=build_solr_fq() rows=10 start=$smarty.get.start }}
            

                   
                    
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
                        <time>{{ if $gimme->article->type_name == "newswire" }}Von Swiss txt{{ else }}Artikel{{ /if }}, {{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                    </article>
                    
{{ if $gimme->current_list->at_end }}                            
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="/search?q={{ $smarty.get.q|escape }}&start={{ $prevstart }}">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="/search?q={{ $smarty.get.q|escape }}&start={{ $nextstart }}">›</a></li>
                      {{ /if }}
                    </ul>                 
{{ /if }} 

{{ /list_search_results_solr }}
                 
                      {{ if $gimme->prev_list_empty }}
  							<p>Ihre Suche lieferte keine Treffer</p>
					  {{ /if }}
                
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                    <div class="ad top-space">
                        <small>Werbung</small>
                        <a href="#"><img alt="" src="pictures/ad-2.jpg"></a>
                    </div>
                
                </div><!-- / Aside -->
            
            </div>
    
        </div><!-- / Content Wrapper -->



{{*       
      <div class="content-wrapper top-line">

          <div class="content no-bottom-line equal-heights clearfix">
    
                <div class="main left-thumb article-spacing clearfix">

 					<p class="search-info">Suchergebnisse für: {{ $smarty.get.q|default:''|escape }}</p>
            
{{ list_search_results_solr qf="title^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" rows=10 start=$smarty.get.start }}

                    <article>
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
                        <time>{{ if $gimme->article->type_name == "newswire" }}Von Swiss txt{{ else }}Artikel{{ /if }}, {{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                    </article>

{{ if $gimme->current_list->at_end }}                            
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="/search?q={{ $smarty.get.q|escape }}&start={{ $prevstart }}">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="/search?q={{ $smarty.get.q|escape }}&start={{ $nextstart }}">›</a></li>
                      {{ /if }}
                    </ul>                 
{{ /if }} 

{{ /list_search_results_solr }}
                 {{ if $gimme->prev_list_empty }}
  							<p>Ihre Suche lieferte keine Treffer</p>
					  {{ /if }}
                
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                    <div class="ad top-space">
                        <!--small>Werbung</small-->
                    </div>
                
                </div><!-- / Aside -->
            
            </div>
    
        </div><!-- / Content Wrapper -->

*}}
    
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>