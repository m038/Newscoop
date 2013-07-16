<div class="content-wrapper top-line events-content daterange-archive">
  <div class="content no-bottom-line equal-heights clearfix">
    <aside class="archive-aside info-text clearfix">
    <!-- HIDDEN FILTERS
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

      <a href="#themen-verwalten" class="button white wide fancybox phone-hide">Themen verwalten</a>
      -->

      <div class="archive_list_wrap">
        <div class="year-list">
          <span>
            <h4>Archiv</h4>
            <ol class="custom-list archive_list">
            {{* this is the year of publication launch *}}
            {{ $launch = 2012}}
            {{ $year = $launch }}
            {{ $now = $smarty.now|camp_date_format:"%Y" }}
            {{ $now = $now + 1 }}
            {{ while $year < $now }}
              <li{{ if $year === ($now - 1) }} class="active"{{ /if }}><a href="#">{{ $year }}</a></li>
              {{ $year = $year + 1 }}
            {{ /while }}
          </span>
          </ol>
        </div>

        <div class="date_picker_wrap">
          {{ $then = "2012-01-01" }}
          {{ $now = $smarty.now|camp_date_format:"%Y-%m-%d" }}
          {{* date_filter rangestart="$then" rangeend="$now" rangeformatmonth="F" rangeformatday="d" *}}
          
          {{ daterange_calendar_html rangestart="$then" rangeend="$now" rangeformatmonth="MMMM" rangeformatday="dd" locale="de-CH" }}
        </div>

      </aside>

          <div class="main archive left-thumb article-spacing clearfix tabs margin-bottom comment-box ui-tabs ui-widget ui-widget-content ui-corner-all">

            <ul class="tab-nav clearfix ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
              <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="comm-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="#comm-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1"><strong>Alles</strong> </a></li>
              <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="comm-2" aria-labelledby="ui-id-2" aria-selected="false"><a href="#comm-2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2"><strong>Artikel</strong></a></li>
              <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="comm-3" aria-labelledby="ui-id-3" aria-selected="true"><a href="#comm-3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3"><strong>Blogposts</strong> </a></li>
              <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="comm-4" aria-labelledby="ui-id-4" aria-selected="false"><a href="#comm-4" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-4"><strong>Dossiers</strong></a></li>
            </ul>

              <div class="tab-content">

                
                {{ $from = $smarty.get.fqfrom }}
                {{ if ($from === null) }}
                  {{ $from = $now }}
                {{ /if }}

                {{ $to = $smarty.get.fqto }}
                {{ if ($to === null) }}
                  {{ $to = $now }}
                {{ /if }}
                
                {{ $type = $smarty.get.type }}
                {{ if ($type === null ) }}
                  {{ $type = "blog and type:debatte and type:news and type:newswire" }}
                {{ /if }}

                {{ $query = $smarty.get.q }}
                {{ if $query === null }}
                  {{ $query = "*" }}
                {{ /if }}
                {{ $query = $query|escape }}

                <dt>
                  <dt>GET:</dt>
                   <dd>{{ $smarty.get|@print_r }}</dd>
                  <dt>GET from:</dt>
                    <dd>{{ $smarty.get.fqfrom }}</dd>
                  <dt>From:</dt>
                    <dd>{{ $from }}</dd>
                  <dt>GET to:</dt>
                    <dd>{{ $smarty.get.fqto }}</dd>
                  <dt>To:</dt>
                    <dd>{{ $to }}</dd>
                  <dt>Start pos:</dt>
                    <dd>{{ $smarty.get.start }}</dd>
                  <dt>Query term:</dt>
                    <dd>{{ $query }}</dd>
                  <dt>Type:</dt>
                    <dd>{{ $type }}</dd>
                  {{ $search_query = "{{ build_solr_fq type=$type }}" }}
                  <dt>Compiled fq query:</dt>
                    <dd>{{ $search_query }}</p>
                </dt>

                <div id="comm-1">

                {{ list_search_results_solr rows=10 q=$query fq={{ $search_query }} qf="title^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" start=$smarty.get.start }}
                  {{ if $gimme->current_list->at_beginning }}
                  <ul>
                  {{ /if }}
                    <li class="news_item  {{ cycle values="odd,even" }}">
                      <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                        {{ capture name="hasimg" assign="hasimg" }}
                        {{ image rendition="artthumb" }}
                        <figure> 
                          <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>
                        </figure>
                        {{ /image }}                        
                        {{ /capture }}
                        {{ if trim($hasimg) }}{{ $hasimg }}{{ /if }}
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <h5 class="author">
                        {{ list_article_authors }}
                          {{$gimme->author->name }}
                        {{ /list_article_authors }}
                        </h5>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ if $gimme->article->lede|strip_tags:false }}{{ $gimme->article->lede|strip_tags:false }}{{ elseif $gimme->article->body|strip_tags:false }}{{ $gimme->article->body|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->infolong }}{{ $gimme->article->infolong }}{{ elseif $gimme->article->teaser }}{{ $gimme->article->teaser|truncate:200 }}{{ elseif $gimme->article->description }}{{ $gimme->article->description|truncate:200 }}{{ elseif $gimme->article->other }}{{ $gimme->article->other }}{{ /if }}</p>
                      </article>
                    </li>
                  {{ if $gimme->current_list->at_end }}
                  </ul>
                  {{ /if }}

                  {{ if $gimme->current_list->at_end }}                   
                    {{ $getType=$smarty.get.type }}
                    {{ $getPublished=$smarty.get.published }}         
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="?q={{ $query }}&type={{ $getType }}&published={{ $getPublished }}&start={{ $prevstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-1">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="?q={{ $query }}&type={{ $getType }}&published={{ $getPublished }}&start={{ $nextstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-1">›</a></li>
                      {{ /if }}
                    </ul>                 
                  {{ /if }} 

                {{ /list_search_results_solr }}

                </div>

                <div id="comm-2">
                {{ list_search_results_solr rows=10 q=$query fq="type:news and type:newswire" qf="title^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" start=$smarty.get.start }}
                  {{ if $gimme->current_list->at_beginning }}
                  <ul>
                  {{ /if }}
                    <li class="news_item  {{ cycle values="odd,even" }}">
                      <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                        {{ capture name="hasimg" assign="hasimg" }}
                        {{ image rendition="artthumb" }}
                        <figure> 
                          <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>
                        </figure>
                        {{ /image }}                        
                        {{ /capture }}
                        {{ if trim($hasimg) }}{{ $hasimg }}{{ /if }}
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <h5 class="author">
                        {{ list_article_authors }}
                          {{$gimme->author->name }}
                        {{ /list_article_authors }}
                        </h5>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ if $gimme->article->lede|strip_tags:false }}{{ $gimme->article->lede|strip_tags:false }}{{ elseif $gimme->article->body|strip_tags:false }}{{ $gimme->article->body|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->infolong }}{{ $gimme->article->infolong }}{{ elseif $gimme->article->teaser }}{{ $gimme->article->teaser|truncate:200 }}{{ elseif $gimme->article->description }}{{ $gimme->article->description|truncate:200 }}{{ elseif $gimme->article->other }}{{ $gimme->article->other }}{{ /if }}</p>
                      </article>
                    </li>
                  {{ if $gimme->current_list->at_end }}
                  </ul>
                  {{ /if }}

                  {{ if $gimme->current_list->at_end }}                   
                    {{ $getType=$smarty.get.type }}
                    {{ $getPublished=$smarty.get.published }}         
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="?q={{ $query }}&type=news+and+newswire&published={{ $getPublished }}&start={{ $prevstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-2">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="?q={{ $query }}&type=news+and+newswire&published={{ $getPublished }}&start={{ $nextstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-2">›</a></li>
                      +and+
                      {{ /if }}
                    </ul>                 
                  {{ /if }} 

                {{ /list_search_results_solr }}
                </div>

                <div id="comm-3">
                {{ list_search_results_solr rows=10 q=$query fq="type:blog" qf="title^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" start=$smarty.get.start }}
                  {{ if $gimme->current_list->at_beginning }}
                  <ul>
                  {{ /if }}
                    <li class="news_item  {{ cycle values="odd,even" }}">
                      <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                        {{ capture name="hasimg" assign="hasimg" }}
                        {{ image rendition="artthumb" }}
                        <figure> 
                          <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>
                        </figure>
                        {{ /image }}                        
                        {{ /capture }}
                        {{ if trim($hasimg) }}{{ $hasimg }}{{ /if }}
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <h5 class="author">
                        {{ list_article_authors }}
                          {{$gimme->author->name }}
                        {{ /list_article_authors }}
                        </h5>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ if $gimme->article->lede|strip_tags:false }}{{ $gimme->article->lede|strip_tags:false }}{{ elseif $gimme->article->body|strip_tags:false }}{{ $gimme->article->body|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->infolong }}{{ $gimme->article->infolong }}{{ elseif $gimme->article->teaser }}{{ $gimme->article->teaser|truncate:200 }}{{ elseif $gimme->article->description }}{{ $gimme->article->description|truncate:200 }}{{ elseif $gimme->article->other }}{{ $gimme->article->other }}{{ /if }}</p>
                      </article>
                    </li>
                  {{ if $gimme->current_list->at_end }}
                  </ul>
                  {{ /if }}

                  {{ if $gimme->current_list->at_end }}                   
                    {{ $getType=$smarty.get.type }}
                    {{ $getPublished=$smarty.get.published }}         
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="?q={{ $query }}&type=blog&published={{ $getPublished }}&start={{ $prevstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-3">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="?q={{ $query }}&type=blog&published={{ $getPublished }}&start={{ $nextstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-3">›</a></li>
                      {{ /if }}
                    </ul>                 
                  {{ /if }} 

                {{ /list_search_results_solr }}
                </div>

                <div id="comm-4">
                {{ list_search_results_solr rows=10 q=$query fq="type:blog" qf="title^5 greybox_title^4 motto^4 infolong^3 teaser^3 pro_title^3 contra_title^3 lede^3 greybox^2 description date_time_text other body pro_text contra_text" start=$smarty.get.start }}
                  {{ if $gimme->current_list->at_beginning }}
                  <ul>
                  {{ /if }}
                    <li class="news_item  {{ cycle values="odd,even" }}">
                      <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                        {{ capture name="hasimg" assign="hasimg" }}
                        {{ image rendition="artthumb" }}
                        <figure> 
                          <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>
                        </figure>
                        {{ /image }}                        
                        {{ /capture }}
                        {{ if trim($hasimg) }}{{ $hasimg }}{{ /if }}
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <h5 class="author">
                        {{ list_article_authors }}
                          {{$gimme->author->name }}
                        {{ /list_article_authors }}
                        </h5>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ if $gimme->article->lede|strip_tags:false }}{{ $gimme->article->lede|strip_tags:false }}{{ elseif $gimme->article->body|strip_tags:false }}{{ $gimme->article->body|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ $gimme->article->dataContent|strip_tags:false|truncate:200 }}{{ elseif $gimme->article->infolong }}{{ $gimme->article->infolong }}{{ elseif $gimme->article->teaser }}{{ $gimme->article->teaser|truncate:200 }}{{ elseif $gimme->article->description }}{{ $gimme->article->description|truncate:200 }}{{ elseif $gimme->article->other }}{{ $gimme->article->other }}{{ /if }}</p>
                      </article>
                    </li>
                  {{ if $gimme->current_list->at_end }}
                  </ul>
                  {{ /if }}

                  {{ if $gimme->current_list->at_end }}                   
                    {{ $getType=$smarty.get.type }}
                    {{ $getPublished=$smarty.get.published }}         
                    {{ $curpage=$smarty.get.start/10+1 }}
                    {{ $nextstart=$curpage*10 }}
                    {{ $prevstart=($curpage-2)*10 }}
                    <ul class="paging center top-line">
                      {{ if $curpage gt 1 }}
                      <li><a class="button white prev" href="?q={{ $query }}&type=dossier&published={{ $getPublished }}&start={{ $prevstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-4">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="?q={{ $query }}&type=dossier&published={{ $getPublished }}&start={{ $nextstart }}&fqfrom={{ $from }}&fqto={{ $to }}#comm-4">›</a></li>
                      {{ /if }}
                    </ul>                 
                  {{ /if }} 

                {{ /list_search_results_solr }}
                </div>

              </div><!-- /.comment-content -->
            
            </div><!-- / Main -->            
            
            <aside class="aside">
                
                <div class="ad top-space">
                    <small>Werbung</small>
                    <a href="#"><img alt="" src="pictures/ad-2.jpg"></a>
                </div>
            
            </aside><!-- / Aside -->
        
        </div>

    </div><!-- / Content Wrapper -->
                
    <div class="hide">
    
        <div id="themen-verwalten" class="popup-info-box clearfix">
        
            <h4>Themen verwalten</h4>
            <p>Sie haben folgende Themen abonniert:</p>
            <ul class="bottom-line">
                <li><input type="checkbox" value="1" id="energiepolitik" /><label for="energiepolitik">Energiepolitk</label></li>
                <li><input type="checkbox" value="2" id="akw" /><label for="akw">AKW</label></li>
            </ul>
            <input type="submit" value="Speichern" class="button red right" />
        
        </div>
    
    </div><!-- / Popup -->

</div>

</body>
</html>