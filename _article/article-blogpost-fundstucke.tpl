{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

{{ list_articles length="1" constraints="type is bloginfo" }}
		<div class="photo-blog-top clearfix">
        	<h2><a href="{{ url options="section" }}">{{ $gimme->article->name }}</a></h2>
            <p><img src="{{ uri static_file="pictures/title-icons/camera.png" }}" alt="" />{{ $gimme->article->infolong }}</p>
            <a href="#" class="button show-feedback-form red right">Bild vorschlagen</a>
        </div>
{{ /list_articles }}

{{ count }}
        
        <div class="content clearfix photo-blog-single">
        
        	<article>
        
                <header>
                    <h3>{{ $gimme->article->name }}</h3>
                    <p><time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y, %H:%i" }}</time> {{ if $gimme->article->comment_count  }}<a href="#comments" class="comm">{{ $gimme->article->comment_count }} Kommentare</a>{{ /if }}</p>
                </header>
                {{ include file="_tpl/_admin-edit.tpl" }}
                {{ $gimme->article->body }}
            </article>
            
{{ include file="_tpl/article-tools.tpl" }}
        
        </div>
    
    </div><!-- / Content Wrapper -->
    
    <div class="wide-wrapper internal-wrapper">
    
    	<div class="content-wrapper">
        
        	<div class="content bottom-line clearfix">
        
{{ include file="_tpl/article-comments.tpl" }}
                
                <div class="aside">
                
                    <div class="ad">
                        <!--small>Werbung</small-->
                    </div>
                
                </div>
                
            </div>
        
        </div>
        
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
