{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">

{{ render file="_ads/section-leaderboard.tpl" }}
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content bottom-line equal-heights clearfix">
        
          <div class="main">
            
              <div class="box top-line dossier-article-list">

{{ list_articles length="10" constraints="type is dossier" }}
            
                    <article class="{{ if $gimme->current_list->index is odd }}right{{ else }}left{{ /if }}-thumb clearfix highlight-article">
              {{ image rendition="arthalf" }}                
                      <figure>
                      <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>     
                      </figure>
              {{ /image }} 
              				<h6><a href="{{ url options="article" }}">Dossier</a></h6>                   
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false|truncate:200 }} <a href="{{ url options="article" }}">zum Dossier</a></p>
                        <aside class="related">
                            <h4>Aus diesem Dossier</strong></h4>
                            <p>
                            {{ list_related_articles length="3" }}
                            <span>{{ $gimme->article->dateline }}</span> <a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>{{ if !$gimme->current_list->at_end }}<br />{{ /if }}
                            {{ /list_related_articles }}
                            </p>
                        </aside>
                    </article>
{{* if $gimme->current_list->at_beginning }}                    
                    <div class="ad top-line margin-bottom">
                        <!--small>Werbung</small-->
                    </div>
{{ /if *}}                    
{{ /list_articles }}
                
                </div>
            
            </div><!-- / Main -->
            
            <div class="aside">
                
{{ include file="_tpl/sidebar-most.tpl" }} 

{{ render file="_ads/medium-rectangle.tpl" }} 
             
{{ include file="_tpl/sidebar-newsletter.tpl" }}
                
{{ include file="_tpl/sidebar-debatte.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>
        
        <div class="ad bottom-line">
            <!--small>Werbung</small-->
        </div>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>