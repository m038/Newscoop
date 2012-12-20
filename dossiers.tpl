{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content bottom-line equal-heights clearfix">
        
          <div class="main">
            
              <div class="box top-line dossier-article-list">

{{ list_articles length="10" constraints="type is dossier" }}
            
                    <article class="{{ if $gimme->current_list->index is odd }}right{{ else }}left{{ /if }}-thumb clearfix highlight-article">
              {{ image rendition="arthalf" }}                
                      <figure>
                      <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
                      </figure>
              {{ /image }} 
              				<h6><a href="{{ url options="article" }}">Dossier</a></h6>                   
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false|truncate:200 }} <a href="{{ url options="article" }}">zum Dossier</a></p>
                        <aside class="related">
                            <h4>Aus diesem Dossier</strong></h4>
                            <p>
                            {{ list_related_articles length="3" }}
                            <a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a> {{ $gimme->article->name }}{{ if !$gimme->current_list->at_end }}<br />{{ /if }}
                            {{ /list_related_articles }}
                            </p>
                        </aside>
                    </article>
{{ if $gimme->current_list->at_beginning }}                    
                    <div class="ad top-line margin-bottom">
                        <small>Werbung</small>
                        <a href="#"><img alt="" src="{{ uri static_file="pictures/ad-1.jpg" }}"></a>
                    </div>
{{ /if }}                    
{{ /list_articles }}
                
                </div>
            
            </div><!-- / Main -->
            
            <div class="aside">
                
{{ include file="_tpl/sidebar-most.tpl" }}
                
                <div class="box highlight-box">
                
                  <h4 class="box-title icon-letter"><a href="#">zentral+ Newsletter</a></h4>
                    <fieldset class="newsletter-form">
                      <label>Folgen Sie uns im Newsletter</label>
                        <input type="text" placeholder="Ihre E-Mail Adresse" />
                    </fieldset>
                    <input type="submit" class="button red center" value="Jetzt abonnieren" />
                
                </div>
                
{{ include file="_tpl/sidebar-debatte.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>
        
        <div class="ad bottom-line">
            <small>Werbung</small>
            <a href="#"><img src="{{ uri static_file="pictures/ad-4.jpg" }}" alt="" /></a>
        </div>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>