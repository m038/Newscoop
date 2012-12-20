{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

    <div class="content bottom-line equal-heights clearfix">
        
          <div class="main">
              <article class="bottom-line single blog-single single-title">

		    {{ list_articles length="1" constraints="type is bloginfo" }}            
                    <figure>
		    {{ image rendition="artfull" }}                
              		<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }}" />     
		    {{ /image }}
                        <figcaption>
                            <h3><a href="{{ url options="section" }}">{{ $gimme->article->name }}</a></h3>
                        </figcaption>
                    </figure>
                    {{ /list_articles }}
                    
                    <p class="time-top"><time><a href="#">lokale Spezialitäten, Luzern</a></time></p>
                    <figure class="left">
		    {{ image rendition="arthalf" }}                
              		<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
		    {{ /image }}
                    </figure>
                    <h3>{{ $gimme->article->name }}</h3>
                    <p><time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y, %H:%i" }}</time> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }} <a class="right print-small" href="#">Print</a></p>
                    
                    {{ $gimme->article->body }}
                    {{ include file="_tpl/article-slideshow.tpl" }}
                    
                </article>
                
                <div class="bottom-line social-bar clearfix">
                
                  <ul class="soc-options left">
                      <li class="fb"><a href="#">Facebook</a></li>
                      <li class="tw"><a href="#">Twitter</a></li>
                      <li class="gplus"><a href="#">Google+</a></li>
                        <li class="activate"><a href="#">Social-Media Dienste aktivieren</a></li>
                    </ul>
                    
                    <ul class="article-options right">
                      <li class="email"><a href="#">Email</a></li>
                      <li class="print"><a href="#">Print</a></li>
                    </ul>
                
                </div>
                
                <article class="single">
                  <h4>Weitere Blogbeiträge aus «Was gibt’s wo»</h4>
                    <p>In Sachen Genuss Lokale<br />
                    Ein echtes Erlebnis<br />
                    Alle Jahre wieder</p>
                </article>
            
            </div><!-- / Main -->
            
            <div class="aside top-line">
                
{{ if $gimme->default_section->number == "25" }}
                <div class="left-thumb bottom-line small-type clearfix mobile-hide">
                    <figure><img alt="" src="{{ uri static_file="pictures/title-icons/bag.png" }}"></figure>
                    <p>Lokale Spezialitägen haben noch inverero ipsant que labo. Ro idiande rferion sectus et accum facesti nctiatiis evendae.</p>
                </div>
{{ else }}  
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
{{ /if }}

{{ if $gimme->default_section->number == "25" }}
            	<div class="two-columns clearfix equal-heights phone-hide">
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
                
                <ul class="phone-icon-dropdown top-line">
                	<li class="tag">
                        <select class="dropdownized">
                        	<option value="Rubriken">Rubriken</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </li>
                    <li class="place">
                        <select class="dropdownized">
                        	<option value="Orte">Orte</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </li>
                </ul>                
                
            	<div class="box top-line bottom-line">
                	<iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Zug,+Switzerland&amp;aq=0&amp;oq=zug&amp;sll=37.0625,-95.677068&amp;sspn=53.080379,39.726562&amp;ie=UTF8&amp;hq=&amp;hnear=Zug,+Canton+of+Zug,+Switzerland&amp;t=m&amp;z=12&amp;ll=47.174589,8.513854&amp;output=embed"></iframe>
                </div>               
{{ else }}                
                <div class="box bottom-line">
                	<h4>Rubriken</h4>
                	<ul class="custom-list tag-list">
                        <li><a href="#">lokale Spezialitäten</a> (4)</li>
                        <li><a href="#">Alles Bio</a> (4)</li>
                        <li><a href="#">Märkte</a> (4)</li>
                        <li><a href="#">Handwerk</a> (4)</li>
                        <li><a href="#">Wein und Brand</a> (4)</li>
                    </ul>
                </div>
{{ /if }}
        
                <div class="ad">
                    <small>Werbung</small>
                    <a href="#"><img src="{{ uri static_file="pictures/ad-2.jpg" }}" alt="" /></a>
                </div>
                
            </div><!-- / Aside -->
        
        </div>
    
    </div><!-- / Content Wrapper -->
    
    <div class="wide-wrapper internal-wrapper">
    
      <div class="content-wrapper">
        
          <div class="content clearfix">

{{ include file="_tpl/article-comments.tpl" }} 
                
                <div class="aside">
                
                    <div class="ad">
                        <small>Werbung</small>
                        <a href="#"><img src="{{ uri static_file="pictures/ad-3.jpg" }}" alt="" /></a>
                    </div>
                
                </div>
                
            </div>
        
        </div>
        
    </div>

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
