{{ include file="_tpl/_html-head.tpl" }}

<body>

	<div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

		<div class="content bottom-line clearfix">
            
{{ include file="_tpl/front-top-stories.tpl" }}
                                       
            <div class="aside">
            
            	<div class="box">
 
{{ assign var="condition" value="Front is on" }}

{{ list_articles ignore_issue="true" ignore_section="true" constraints="section is 200 type is editor_message $condition" }}
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

{{ assign var="noshow" value=0 }}
{{ if $gimme->prev_list_empty }}
	{{ include file="_tpl/sidebar-comment.tpl" }}
		{{ assign var="noshow" value=1 }}
{{ /if }}
                
                </div>

{{ include file="_tpl/sidebar-ticker.tpl" }} 
            
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

{{ include file="_tpl/sidebar-newsletter.tpl" }}

{{ include file="_tpl/sidebar-debatte.tpl" }}
            
            </div><!-- / Aside -->
        
        </div>

{{ include file="_tpl/front-blogs.tpl" }}
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
	
{{ include file="_tpl/_html-foot.tpl" }}	

</body>
</html>