{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content top-line clearfix">
        
          <div class="two-columns blog-list featured-blogs equal-heights clearfix">
{{ list_articles length="4" columns="2" ignore_section="true" order="bypublishdate desc" constraints="type is blog" }}
{{ if $gimme->current_list->index == "1" }}            
                <div class="box">
{{ /if }}                
                    <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></h6>         
                        
                        <figure>
                        {{ image rendition="quarter" }}                
                        <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />     
                        {{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time><br />
                        <a href="{{ url options="article" }}">weiterlesen</a> &bull; <a href="{{ url options="section" }}">zum Blog</a></p>
                    </article>
{{ if $gimme->current_list->index == "2" }}                    
                </div>
{{ /if }}                
{{ /list_articles }}
                        
          </div><!-- / 2 columns -->
            
        </div>
    
    </div><!-- / Content Wrapper -->
       
    <div class="wide-wrapper internal-wrapper">
    
      <div class="content-wrapper">
        
          <div class="content bottom-line clearfix">
            
              <h2><a href="#">Alle zentral+ Blogs</a></h2>
    
                <div class="main">
                
{{ list_articles columns="2" ignore_section="true" order="byname asc" constraints="type is bloginfo" }}
{{ if $gimme->current_list->column == "1" }}                
                    <div class="two-columns-wide margin-bottom clearfix equal-heights">
{{ /if }}               
                        <article>
                        
              {{ image rendition="arthalf" }}                
                      <figure>
                      <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />     
                      </figure>
              {{ /image }}                            
                            <h3><a href="{{ url options="section" }}">{{ $gimme->article->name }}</a></h3>
                            <h6>{{ $gimme->article->motto }}</h6>
                            <p>{{ $gimme->article->infolong|strip_tags:false }} <a href="{{ url options="section" }}">weiterlesen</a></p>
                        
                        </article>
{{ if $gimme->current_list->column == "1" && $gimme->current_list->at_end }}  
                        <article>
                            <div class="highlight-box">
                            <h4 class="box-title icon-cross"><a href="#">Ihr Thema fehlt noch?</a></h4>
                              <a href="#" class="button red center">Machen Sie einen Vorschlag!</a>
                            </div>
                    </div><!-- / 2 columns -->                            
                        </article>                      
{{ elseif $gimme->current_list->column == "2" || $gimme->current_list->at_end }}                    
                    </div><!-- / 2 columns -->
{{ /if }}
{{ if $gimme->current_list->column == "2" && $gimme->current_list->at_end }}
                    <div class="two-columns-wide margin-bottom clearfix equal-heights">                    
                        <article>
                            <div class="highlight-box">
                            <h4 class="box-title icon-cross"><a href="#">Ihr Thema fehlt noch?</a></h4>
                              <a href="#" class="button red center">Machen Sie einen Vorschlag!</a>
                            </div>
                        </article>                    
                    </div><!-- / 2 columns -->                    
{{ /if }}                    
{{ /list_articles }}


                       


                    
                
                </div><!-- / Main -->            
                
                <div class="aside">
                
{{ include file="_tpl/sidebar-community.tpl" }}
                    
                    <div class="ad">
                        <!--small>Werbung</small-->
                    </div>
                
                </div><!-- / Aside -->
            
            </div>
    
        </div><!-- / Content Wrapper -->
    
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>