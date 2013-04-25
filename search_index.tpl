{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}
    
      <div class="content-wrapper top-line">
        
          <div class="content no-bottom-line equal-heights clearfix">
    
                <div class="main left-thumb article-spacing clearfix">

 					<p class="search-info">Suchergebnisse für: {{ $_GET'q' }}{{* $gimme->search_articles_action->search_phrase *}}</p>
            
<h1>SEARCH RESULTS SOLR</h1>
{{ list_search_results_solr fq="type:news" qf="title^5 deck^3 full_text" start=$smarty.get.start }}
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
        <h5 class="author">{{list_article_authors}}
        {{$gimme->author->name}}
        {{/list_article_authors}}</h5>
        <p>{{$gimme->article->deck|strip_tags|truncate:200:"...":false}} </p>
      </div>
    </li>
  {{ if $gimme->current_list->at_end }}
  </ul>
  {{ /if }}
{{ /list_search_results_solr }}
                 {{ if $gimme->prev_list_empty }}
  							<p>Ihre Suche lieferte keine Treffer</p>
					  {{ /if *}}
                
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