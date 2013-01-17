{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}
    
      <div class="content-wrapper top-line events-content">
        
          <div class="content no-bottom-line equal-heights clearfix">
            
              <div class="events-aside info-text clearfix">
                  
                    <div class="hide">
                        <h4>Zeige</h4>
                        <select class="dropdownized">
                            <option value="Alle Themen">Alle Themen</option>
                            <option value="Energiepolitk">Energiepolitk</option>
                            <option value="AKW">AKW</option>
                        </select>
                    </div>
                    
                  <ul class="hide">
                      <li class="active"><a href="#">Alle Themen</a></li>
                      <li><a href="#">Energiepolitk</a></li>
                      <li><a href="#">AKW</a></li>
                    </ul>
                    
                    <!--a href="#themen-verwalten" class="button white wide fancybox">Themen verwalten</a-->
                  
                    <h4>Über «Meine Themen»</h4>
                    <p>Auf dieser Seite sehen Sie alle aktuellen Artikel zu den Themen, die Sie abonniert haben.</p>
                
                </div>
    
                <div class="main left-thumb article-spacing clearfix">
            
                {{ list_articles length="10" ignore_publication="true" ignore_issue="true" ignore_section="true" }}
                    <article>
                        <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                        <figure>
{{ image rendition="artthumb" }} 
                    <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />
{{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <br />
                        </p>
                        <time>Artikel, {{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                    </article>            

{{ if $gimme->current_list->at_end }}                            
                    {{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id()))/10+1 }}
                    <ul class="paging center top-line">
                      {{ if $gimme->current_list->has_previous_elements }}
                      <li><a class="button white prev" href="{{ url options="previous_items" }}">‹</a></li>
                      {{ /if }}
                      <li class="caption">{{ $curpage }} von {{ ceil($gimme->current_list->count / 10) }}</li>
                      {{ if $gimme->current_list->has_next_elements }}
                      <li><a class="button white next" href="{{ url options="next_items" }}">›</a></li>
                      {{ /if }}
                    </ul>                 
 
{{ /if }}      
            
                 {{ /list_articles }}
                
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