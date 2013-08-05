{{ set_default_section }}

{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">

{{ render file="_ads/section-leaderboard.tpl" }}
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content bottom-line clearfix">
        
          <div class="main">

{{ include file="_tpl/section-top-stories.tpl" }}

{{* include file="_tpl/section-this-month.tpl" *}} 
                
{{ include file="_tpl/section-more-stories.tpl" }}
                
{{ include file="_tpl/section-dossiers.tpl" }}
            
            </div><!-- / Main -->
            
            <div class="aside">

              <div class="box">

{{ assign var="secname" value=$gimme->section->name }}
{{ assign var="condition" value="{{ $secname }} is on" }}

{{ list_articles ignore_issue="true" ignore_section="true" constraints="issue is 10 section is 202 type is editor_message activated is on" }}
               {{ if $gimme->current_list->at_beginning }}
              <div class="box">                   
                  <h4 class="box-title icon-cross"><a href="#">In eigener Sache</a></h4>
                  {{ /if }}         
                    <article>
                      <h3>{{ if $gimme->article->body|strip !== "" }}<a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>{{ else }}{{ $gimme->article->name }}{{ /if }}</h3>
                      <p>{{ $gimme->article->teaser|strip_tags:false }} {{ if $gimme->article->body|strip !== "" }}<a href="{{ url options="article" }}">weiterlesen</a>{{ /if }}</p>
                    </article>
          {{ if $gimme->current_list->at_end }}                    
                </div>   
               {{ /if }}                 
{{ /list_articles }}
                
                </div>

{{ include file="_tpl/sidebar-comment.tpl" }}

{{ if $gimme->section->number lt 60 }}                
{{ include file="_tpl/sidebar-ticker.tpl" }} 
{{ /if }}

{{ include file="_ads/sidebar-partner-buttons.tpl" }}
                
{{ render file="_ads/section-wide-skyscrapper.tpl" }}

{{ include file="_tpl/sidebar-section-blog.tpl" }}

{{ render file="_ads/medium-rectangle.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>
        
{{ render file="_ads/section-billboard.tpl" }} 
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
