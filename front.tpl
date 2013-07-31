{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">

{{ render file="_ads/front-leaderboard.tpl" }}
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content bottom-line clearfix">
            
{{ include file="_tpl/front-top-stories.tpl" }}
                                       
            <div class="aside">
            
              <div class="box">
 
{{ assign var="condition" value="Front is on" }}

{{ list_articles length="1" ignore_issue="true" ignore_section="true" constraints="section is 202 type is editor_message $condition active is on" }}
               {{ if $gimme->current_list->at_beginning }}
              <div class="box">                   
                  <h4 class="box-title icon-cross">In eigener Sache</h4>
                  {{ /if }}         
                    <article>
                      <h3>{{ if $gimme->article->body|strip !== "" }}<a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>{{ else }}{{ $gimme->article->name }}{{ /if }}</h3>
                      <p>{{ $gimme->article->teaser|strip_tags:false }} {{ if $gimme->article->body|strip !== "" }}<a href="{{ url options="article" }}">weiterlesen</a>{{ /if }}</p>
                    </article>
          {{ if $gimme->current_list->at_end }}                    
                </div>   
               {{ /if }}                 
{{ /list_articles }}

{{ assign var="noshow" value=0 scope="global" }}
{{ if $gimme->prev_list_empty }}
  {{ include file="_tpl/sidebar-comment.tpl" }}
    {{ assign var="noshow" value=1 scope="global" }}
{{ /if }}
                
                </div>

{{ include file="_tpl/sidebar-ticker.tpl" }} 

{{ include file="_ads/section-wide-skyscrapper.tpl" }} 
            
            </div><!-- / Aside -->
        
        </div>
        
        <div class="content equal-heights bottom-line clearfix">
        
          <div class="main">

{{ include file="_tpl/front-most.tpl" }} 

{{ include file="_tpl/front-gallery.tpl" }} 
                
                <div class="two-columns margin-bottom bottom-line clearfix equal-heights">

{{ include file="_tpl/front-poll.tpl" }}
                    
{{ include file="_tpl/front-whatsup.tpl" }}
                
                </div>

{{ include file="_tpl/front-dossiers.tpl" }}
            
            </div><!-- / Main -->
            
            <div class="aside">

{{ include file="_tpl/sidebar-community.tpl" }}

{{ if !($noshow) }}                
{{ include file="_tpl/sidebar-comment.tpl" }}
{{ /if }}

{{ render file="_tpl/sidebar-newsletter.tpl" }}

{{ include file="_tpl/sidebar-debatte.tpl" }}

{{ include file="_ads/medium-rectangle.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>

{{ render file="_ads/front-billboard.tpl" }}

{{ include file="_tpl/front-blogs.tpl" }}
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
<!-- sitemap: {{ url options="template _sitemaps/sitemap.tpl" }} -->
<!-- sitemap-blog: {{ url options="template _sitemaps/sitemap-blog.tpl" }} -->