{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}
    
    	<div class="content-wrapper top-line static-info-page events-content">
        
        	<h2>Statische Seite</h2>
        
        	<div class="content no-bottom-line clearfix">
            
            	<div class="events-aside mobile-hide info-text">
                
                	<ul class="custom-list no-bullet">
                		{{ list_articles }}
                    	<li{{ if $gimme->article == $gimme->default_article }} class="active"{{ /if }}><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
                    	{{ /list_articles }}
                    </ul>
                
                </div>
    
                <div class="main clearfix">
            
                    <article class="clearfix">
                    
                        {{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->body }}
                    
                    </article>
                
                </div><!-- / Main -->
            
            </div>
    
        </div><!-- / Content Wrapper -->
    
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
