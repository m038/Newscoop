{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

{{ list_articles length="1" constraints="type is bloginfo" }}
		<div class="photo-blog-top clearfix">
        	<h2>{{ $gimme->article->name }}</h2>
            <p><img src="{{ uri static_file="pictures/title-icons/camera.png" }}" alt="" />{{ $gimme->article->infolong }}</p>
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
                                        
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">Zur Gallerie</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                    </article>
                    
{{ if $gimme->current_list->at_end }}            

{{* PAGINATION *}}
{{ $pages=ceil($gimme->current_list->count/5) }}
{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
{{ if $pages gt 1 }}
<ul class="paging center top-line">
    {{ if $gimme->current_list->has_previous_elements }}<li class="button white prev"><a href="{{ unset_article }}{{ url options="previous_items" }}">‹</a></li>{{ /if }}

<li class="caption">{{ ceil($curpage/5)+1 }} von {{ $pages }}</li>

    {{ if $gimme->current_list->has_next_elements }}<li class="button white next"><a href="{{ unset_article }}{{ url options="next_items" }}">›</a></li>{{ /if }}
</ul>
{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
{{ /if }}

{{ /if }}                     
                    
		{{ /list_articles }}   
            
            </div><!-- / Main -->
            
            <div class="aside">
                
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
