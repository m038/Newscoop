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

                {{*
                {{ $from = $smarty.get.from }}
                {{ if ($from === null) }}
                  {{ $from = $now }}
                {{ /if }}

                {{ $to = $smarty.get.to }}
                {{ if ($to === null) }}
                  {{ $to = $now }}
                {{ /if }}
                
                {{ $type = $smarty.get.type }}
                {{ if ($type === null ) }}
                  {{ $type = "blog and type:debatte and type:news and type:newswire" }}
                {{ /if }}

                {{ $query = $smarty.get.q }}
                {{ if $query === null }}
                  {{ $query = "blog" }}
                {{ /if }}
                *}}

                {{ $search_query = "{{ build_solr_fq type=$type }}" }}
                <p>Raw get: {{ $smarty.get|@print_r }}</p>
                <p>Compiled query: {{ $search_query }}</p>
                <p>Raw from: {{ $smarty.get.from }}</p>
                <p>From: {{ $from }}</p>
                <p>Raw to: {{ $smarty.get.to }}</p>
                <p>To: {{ $to }}</p>
                <p>Start pos: {{ $smarty.get.start }}</p>
                <p>Query term: {{ $query }}</p>

                <div id="comm-1">

                {{ list_search_results_solr rows=10 fq=$search_query start=$smarty.get.start }}
                  {{ if $gimme->current_list->at_beginning }}
                  <ul>
                  {{ /if }}
                    <li class="news_item  {{ cycle values="odd,even" }}">
                      <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <h5 class="author">
                        {{ list_article_authors }}
                          {{$gimme->author->name }}
                        {{ /list_article_authors }}
                        </h5>
                        <p>{{ $gimme->article->deck }}</p>
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
                      <li><a class="button white prev" href="?q={{ $smarty.get.q|escape }}&type={{ $getType }}&published={{ $getPublished }}&start={{ $prevstart }}">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="?q={{ $smarty.get.q|escape }}&type={{ $getType }}&published={{ $getPublished }}&start={{ $nextstart }}">›</a></li>
                      {{ /if }}
                    </ul>                 
                  {{ /if }} 

                {{ /list_search_results_solr }}

                {{*
                {{ list_search_results_solr }}
                  {{ if $gimme->current_list->at_beginning }}
                  <ul>
                  {{ /if }}
                    <li class="news_item  {{ cycle values="odd,even" }}">
                      {{ image rendition="thumb" }}
                      <img src="{{ $image->src }}"  alt="{{ $image->caption }} (photo: {{ $image->photographer }})"  />
                      <span>{{$gimme->section->name}}</span>
                      {{/image}}
                 
                      <div class="content">
                        <h2 class="title"><a href="{{url options="article"}}">{{$gimme->article->title}}</a></h2>
                        <h5 class="author">
                        {{list_article_authors}}
                          {{$gimme->author->name}}
                        {{/list_article_authors}}
                        </h5>
                        <p>{{$gimme->article->deck|strip_tags|truncate:200:"...":false}}</p>
                      </div>
                    </li>
                  {{ if $gimme->current_list->at_end }}
                  </ul>
                  {{ /if }}
                {{ /list_search_results_solr }}
                *}}

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