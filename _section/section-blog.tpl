{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

		<div class="content bottom-line equal-heights clearfix">
        
        	<div class="main">

		{{ list_articles length="1" constraints="type is bloginfo" }}            
            	<article class="bottom-line single-title">
                	<figure>
		        {{ image rendition="artfull" }}                
              		    <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }}" />     
		        {{ /image }}
                        <figcaption>
                            <h3><a href="{{ url options="section" }}">{{ $gimme->article->name }}</a></h3>
                        </figcaption>
                    </figure>
                    <p>{{ $gimme->article->infolong|strip_tags:false }}</p>
                </article><!-- / Top fetured -->
                {{ /list_articles }}

                <div class="left-thumb bottom-line article-spacing clearfix">

		{{ list_articles constraints="type is blog" }}             
                    <article>
                    	<p class="time-top"><time>{{ if !($gimme->article->dateline == "") }}<a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a> · {{ /if }}{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</time></p>
                        <figure>
		        {{ image rendition="quarter" }}                
              		    <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }}" />     
		        {{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a></p>
                    </article>
		{{ /list_articles }}                      
                </div>
            
            </div><!-- / Main -->
            
            <div class="aside top-line">

{{ if $gimme->default_section->number == "25" }}
                <div class="left-thumb bottom-line small-type clearfix mobile-hide">
                    <figure><img alt="" src="{{ uri static_file="pictures/title-icons/bag.png" }}"></figure>
                    <p>Lokale Spezialitägen haben noch inverero ipsant que labo. Ro idiande rferion sectus et accum facesti nctiatiis evendae.</p>
                </div>
{{ else }}
{{ list_articles length="1" constraints="type is bloginfo" }}  
{{ list_article_authors columns="2" }}               
                <div class="box{{ if $gimme->current_list->index == "2" }} margin-bottom{{ /if }} left-thumb{{ if $gimme->current_list->index == "2" }} bottom-line{{ /if }} mobile-half">
                  {{ if $gimme->author->user->defined || $gimme->author->picture->imageurl }}
                  {{ include file="_tpl/author-image.tpl" author=$gimme->author width=120 height=120 }}
                  {{ /if }}
                  <p><strong>Autor</strong>: <a href="#">{{ $gimme->author->name }}</a><br />
                    hat noch inverero ipsant que labo. Ro idiande rferion sectus et accum.</p>
                    <p class="author-contact"><a href="#" class="icon-email">Autor im Newsletter folgen</a><br />
                    <a href="#" class="icon-twitter">@u_meier folgen</a></p>
                </div>
{{ /list_article_authors }}
{{ /list_articles }}
{{ /if }}

{{ if $gimme->default_section->number == "25" }}
            	<div class="two-columns clearfix equal-heights">
            	{{ set_topic name="Was gibts wo Blog:de" }}
            	{{ list_subtopics }}
                    <div class="box">
                        <h4>{{ $gimme->topic->name }}</h4>
                        <ul class="custom-list tag-list">
                        	{{ list_subtopics }}
                            <li><a href="#">{{ $gimme->topic->name }}</a> {{ assign var="numpost" value=0 }}{{ list_articles length="1" }}{{ if $gimme->current_list->count }}{{ assign var="numpost" value=$gimme->current_list->count }}{{ /if }}{{ /list_articles }}({{ $numpost }})</li>
                           {{ /list_subtopics }}
                        </ul>
                    </div>
               {{ /list_subtopics }}
					{{ unset_topic }}              
                </div>
                
            	<div class="box top-line bottom-line">
                	<iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Zug,+Switzerland&amp;aq=0&amp;oq=zug&amp;sll=37.0625,-95.677068&amp;sspn=53.080379,39.726562&amp;ie=UTF8&amp;hq=&amp;hnear=Zug,+Canton+of+Zug,+Switzerland&amp;t=m&amp;z=12&amp;ll=47.174589,8.513854&amp;output=embed"></iframe>
                </div>               
{{ /if }}
        
                <div class="ad">
                    <small>Werbung</small>
                    <a href="#"><img src="{{ uri static_file="pictures/ad-2.jpg" }}" alt="" /></a>
                </div>
                
            </div><!-- / Aside -->
        
        </div>
        
        <h2>Neueste Einträge</h2>
        
        <div class="four-columns left-thumb small-type equal-heights clearfix">

{{ list_articles length="4" columns="2" ignore_section="true" order="bypublishdate desc" constraints="type is blog" }}                
            <article>
                <figure>
                {{ image rendition="artthumb" }}                
              	 	<img src="{{ $image->src }}" width="95" height="53" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
					 {{ /image }}
                </figure>
                <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                <p>{{ $gimme->article->lede|strip_tags:false }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }} in {{ $gimme->section->name }}</time><br />
                <a href="{{ url options="article" }}">weiterlesen</a> · <a href="{{ url options="section" }}">zum Blog</a></p>
            
            </article>
            
{{ /list_articles }}
        
        </div>
        
        <a class="button white center" href="#">Zu den Blogs</a>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
