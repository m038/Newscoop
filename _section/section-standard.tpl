{{ set_default_section }}
{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
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

{{ include file="_ads/section-sidebar.tpl" }}

              <div class="box">

{{ assign var="secname" value=$gimme->section->name }}
{{ assign var="condition" value="$secname is on" }}

{{ list_articles ignore_issue="true" ignore_section="true" constraints="section is 200 type is editor_message $condition active is on" }}
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
                
                <div class="ad bottom-line">
                  <!--small>Werbung</small-->

                </div>

{{ include file="_tpl/sidebar-section-blog.tpl" }}
                
                <div class="ad bottom-line">

                </div>
            
            </div><!-- / Aside -->
        
        </div>
        
        <div class="ad bottom-line">

        </div>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>