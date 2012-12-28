{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

{{ list_articles length="1" constraints="type is bloginfo" }}
		<div class="photo-blog-top clearfix">
        	<h2>{{ $gimme->article->name }}</h2>
            <p><img src="{{ uri static_file="pictures/title-icons/camera.png" }}" alt="" />{{ $gimme->article->motto }}</p>
        	<a href="#" class="button red right">Bild vorschlagen</a>
        </div>
{{ /list_articles }}
        
        <div class="content no-bottom-line equal-heights clearfix">
        
        	<div class="main photo-blog-list">


		{{ list_articles length="5" constraints="type is blog" }}             
                    <article>
                    <header>
                       <time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</time>
                       <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                       <p>von {{ list_article_authors }}{{ $gimme->author->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /list_article_authors }} <span>({{ list_article_images length="1" }}{{ $gimme->current_list->count }}{{ /list_article_images }} Bilder)</span></p>
                    </header>

                    {{ if $gimme->article->fundstucke_two }}
                    <figure>
                     {{ list_article_images length="2" }}
                    	<img src="{{ uri options="image width 347 height 247 crop center" }}" class="{{ if $gimme->current_list->index == 1 }}left{{ else }}right{{ /if }}" alt="{{ $gimme->article->image->description }}" />
                    	{{ /list_article_images }}
                    </figure>                        
                    {{ elseif $gimme->article->fundstucke_big }}
                    <figure>
                     {{ list_article_images length="1" }}
                    	<img src="{{ uri options="image width 722" }}" alt="{{ $gimme->article->image->description }}" />
                    	{{ /list_article_images }}
                    </figure>
                    {{ elseif $gimme->article->fundstucke_left }}
                    <figure class="left">
                     {{ list_article_images length="1" }}
                    	<img src="{{ uri options="image width 347" }}" alt="{{ $gimme->article->image->description }}" />
                    	{{ /list_article_images }}
                    </figure>
                    {{ elseif $gimme->article->fundstucke_right }}
                    <figure class="right">
                     {{ list_article_images length="1" }}
                    	<img src="{{ uri options="image width 347" }}" alt="{{ $gimme->article->image->description }}" />
                    	{{ /list_article_images }}
                    </figure>
                    {{ /if }}
                                        
                        <p>{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">Zur Gallerie</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                    </article>
		{{ /list_articles }}   

                            
                <ul class="paging center top-line">
                        <li><a class="button white prev" href="#">‹‹</a></li>
                        <li><a class="button white prev" href="#">‹</a></li>
                    	<li class="caption">1 von 2</li>
                    	<li><a class="button white next" href="#">›</a></li>
                    	<li><a class="button white next" href="#">››</a></li>
                    </ul>
            
            </div><!-- / Main -->
            
            <div class="aside">
            
            	<div class="box bottom-line">
                    <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Zug,+Switzerland&amp;aq=0&amp;oq=zug&amp;sll=37.0625,-95.677068&amp;sspn=53.080379,39.726562&amp;ie=UTF8&amp;hq=&amp;hnear=Zug,+Canton+of+Zug,+Switzerland&amp;t=m&amp;z=12&amp;ll=47.174589,8.513854&amp;output=embed"></iframe>
                </div>
                
                <div class="ad">
                	<small>Werbung</small>
                    <a href="#"><img src="{{ uri static_file="pictures/ad-2.jpg" }}" alt="" /></a>
                </div>
            
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
