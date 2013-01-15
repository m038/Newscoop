{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content bottom-line equal-heights clearfix debatte-detail">
        
          <div class="main">
            
              <article class="aside-overlap featured-top">
                  <figure>
                      {{ image rendition="dossierbig" }}                
                      <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />     
                      {{ /image }}                  
                        <figcaption>
                            <h6>Dossier</h6>
                            <h3>{{ $gimme->article->name }}</h3>
                            <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }}</p>
                        </figcaption>
                    </figure>
                </article><!-- / Top fetured -->

{{ list_related_articles columns="2" length="4" }}
{{ if $gimme->current_list->column == 1 }}                
                <div class="two-columns-wide bottom-line clearfix equal-heights">
{{ /if }}                    
                        <article>
                        	{{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                            <figure>
                            {{ image rendition="arthalf" }}                
                              <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />     
                            {{ /image }}   
                            </figure>
                            <h6><a href="{{ url options="article" }}">Innenansichten</a></h6>
                            <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                            <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                        
                        </article>
{{ if $gimme->current_list->column == 2 || $gimme->current_list->at_end }}                    
                    </div><!-- / 2 columns -->
{{ /if }} 
{{ /list_related_articles }}

{{ list_related_articles }}                   
{{ if $gimme->current_list->index gt 4 }}  
{{ if $gimme->current_list->index == 5 }}                  
                    <h4 class="center-title"><a href="#">Weitere Artikel aus dem Dossier</a></h4>                    
                    <div class="slideshow headline-slider">                 
                        <ul class="slides">
{{ /if }}       
{{ if $gimme->current_list->index % 5 == 0 }}                    
                            <li>
                                <div class="left-thumb article-border-bottom margin-bottom clearfix">
{{ /if }}                                
                                    <article>
                                        <h6><a href="{{ url options="article"}}">{{ $gimme->article->dateline }}</a></h6>
                                        <h3><a href="{{ url options="article"}}">{{ $gimme->article->name }}</a></h3>
                                    </article>
{{ if $gimme->current_list->index % 5 == 4 || $gimme->current_list->at_end }}                                    
                                </div>
                            </li>
{{ /if }}                            

{{ if $gimme->current_list->at_end }}                            
                        </ul>           
                        <ul class="paging center">
                            <li><a href="#" class="button white prev">&lsaquo;</a></li>
                            <li class="caption"></li>
                            <li><a href="#" class="button white next">&rsaquo;</a></li>
                        </ul>                  
                    </div>  
{{ /if }}                    
{{ /if }}
{{ /list_related_articles }}
                              
            </div><!-- / Main -->
            
            <div class="aside aside-top-fix">
                
{{*** recommended links ***}}
{{ set_default_article }}
{{ if !($gimme->article->linklist|strip == "") }}            
                <article class="bottom-line">
                    <h4>Links zum Thema</h4>
                    <ul class="custom-list reply-list">
                    
{{ $links=str_replace("<p>", "", explode("</p>", str_replace("<div>", "", str_replace("</div>", "", $gimme->article->linklist)))) }}
{{ foreach $links as $link }}
{{ $linkAry=explode("- ", $link, 2) }}
{{ if count($linkAry) == 2 }}     
               
                    <li>{{ substr($linkAry[1], 0) }} {{ $linkAry[0] }}</li>

{{ /if }} 
{{ /foreach }}                    

                    </ul>
                </article>
{{ /if }}                
                               
            </div><!-- / Aside -->
        
        </div>
        
        <div class="ad bottom-line">
            <!--small>Werbung</small-->
        </div>

{{ assign var="curArt" value=$gimme->article->number }}
{{ list_articles length="3" constraints="type is dossier number not $curArt" }}
{{ if $gimme->curent_list->at_beginning }}        
        <h2>Weitere Dossiers</h2>
        
        <div class="three-columns clearfix equal-heights text-in-caption-fix">
{{ /if }}                
            <article>
                <figure>
              {{ image rendition="arthalf" }}                
                      <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />     
              {{ /image }}
                    <figcaption>
                        <h6><a href="{{ url options="article" }}">Dossier</a></h6>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                    </figcaption>
                </figure>
            </article>
{{ if $gimme->current_list->at_end }}        
        </div>
{{ /if }}
{{ /list_articles }}
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>