{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content no-bottom-line clearfix">
        
          <div class="main">
            
              <div class="box debatte-single debatte-detail">
                
                  <p class="headline highlight">Hier wird diskutiert. Diskutieren Sie mit!</p>
                    
                    <div class="two-columns no-inner-margin clearfix">
                    
                      <div class="box">
                            <header>
                            <h6><a href="#">Pro & Contra</a></h6>
                              <h3>{{ $gimme->article->name }}</h3>
                            </header>
                        </div>
                
                        <div class="left-thumb box debatte-list clearfix">

{{ include file="_tpl/debatte-voting.tpl" }}

                        </div>
                    </div>
                        
                    <article>
                  {{ $gimme->article->teaser }}
                    </article>
                    
                    <article class="clearfix single top-line margin-top">
                    
                    {{ list_article_authors }}
                    {{ if $gimme->current_list->index == "1" }}
                        <div class="inner-highlight right">                        
                            <figure>
                          {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
                          {{ include file="_tpl/author-image.tpl" author=$gimme->author width=97 height=97 }}
                          {{ /if }}
                            </figure>
                            <h3>Ja</h3>
                            <p>sagt {{ $gimme->author->name }}, {{ $gimme->article->pro_position }}</p>
                        </div>
                     {{ /if }}
                     {{ /list_article_authors }}
                      <h3>{{ $gimme->article->pro_title }}</h3>
                     {{ $gimme->article->pro_text }}

                    {{ list_article_authors }}
                    {{ if $gimme->current_list->index == "2" }}                        
                        <div class="inner-highlight left">
                            <figure>
                          {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
                          {{ include file="_tpl/author-image.tpl" author=$gimme->author width=97 height=97 }}
                          {{ /if }}                            
                            </figure>
                            <h3>Nein</h3>
                            <p>meint {{ $gimme->author->name }}, {{ $gimme->article->contra_position }}</p>
                        </div>
                     {{ /if }}
                     {{ /list_article_authors }}
                      <h3>{{ $gimme->article->contra_title }}</h3>
                     {{ $gimme->article->contra_text }}                        
                    </article>
                
                </div>
                
{{ include file="_tpl/article-tools.tpl" }}
            
            </div><!-- / Main -->
            
            <div class="aside">
            
{{ include file="_tpl/sidebar-community.tpl" }}
                
                {{ list_articles length="6" constraints="type is debatte" }}
                {{ if $gimme->current_list->index gt 1 }}
                {{ if $gimme->current_list->index == 2 }}
                <h4 class="center-title">Abgeschlossene Debatten</h4>
                <div class="clearfix">                
                {{ /if }}
                    <article class="mobile-half{{ if $gimme->current_list->index == 6 }} last{{ /if }}">
                        <figure>
              				{{ image rendition="arthalf" }}                
                      		<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />     
              				{{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                    </article>
                {{ /if }}
                {{ if $gimme->current_list->index == 6 || $gimme->current_list->at_end }}
                </div>
                {{ /if }}
                {{ /list_articles }}
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->
    
    <div class="wide-wrapper internal-wrapper">
    
      <div class="content-wrapper">

          <div class="content bottom-line clearfix">
        
{{ include file="_tpl/article-comments.tpl" }}
                
                <div class="aside">
                
                    <div class="ad">
                        <!--small>Werbung</small-->
                    </div><!-- /.ad -->
                
                </div><!-- /.aside -->
                
            </div><!-- /.content -->
        
        </div>
        
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>