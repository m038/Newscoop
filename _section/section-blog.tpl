{{ set_default_section }}
{{ include file="_tpl/_html-head.tpl" }}

<body>

  <div class="content-wrapper">
    
{{ include file="_tpl/header-nav.tpl" }}
        
{{ include file="_tpl/header.tpl" }}

		<div class="content bottom-line equal-heights clearfix">
        
        	<div class="main">

      {{ local }}
      {{ unset_topic }}
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
       {{ /local }}

					 {{ if $gimme->topic->defined }}
                <article class="bottom-line">
                	<p>{{ list_articles length="1" constraints="type is blog" }}{{ $gimme->current_list->count }}{{ /list_articles }} Blogartikel in der Rubrik «{{ $gimme->topic->name }}»</p>
                </article>
                {{ /if }}

                <div class="left-thumb bottom-line article-spacing clearfix">

		{{ list_articles length="5" constraints="type is blog" }}             
                    <article>
                      <h6>{{ if !($gimme->article->dateline == "") }}<a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a> · {{ /if }}<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</time></h6>

                    		{{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                        <figure>
		        {{ image rendition="quarter" }}                
              		    <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }}" /></a>     
		        {{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                    </article>
                    
{{ if $gimme->current_list->at_end }}            

{{* PAGINATION *}}
{{ $pages=ceil($gimme->current_list->count/5) }}
{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
{{ if $pages gt 1 }}
<ul class="paging center top-line">
    {{ if $gimme->current_list->has_previous_elements }}<li><a class="button white prev" href="{{ unset_article }}{{ url options="previous_items" }}">‹</a></li>{{ /if }}

<li class="caption">{{ ceil($curpage/5)+1 }} von {{ $pages }}</li>

    {{ if $gimme->current_list->has_next_elements }}<li><a class="button white next" href="{{ unset_article }}{{ url options="next_items" }}">›</a></li>{{ /if }}
</ul>
{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
{{ /if }}

{{ /if }}                       
                    
		{{ /list_articles }}                      
                </div>
            
            </div><!-- / Main -->
            
            <div class="aside top-line">

{{ if $gimme->default_section->number == "25" }}
                <div class="left-thumb bottom-line small-type clearfix mobile-hide">
                    <figure><img alt="" src="{{ uri static_file="pictures/title-icons/bag.png" }}"></figure>
                    <p>Wir schauen über den Tellerrand: «Was gibt's wo» stellt regionale Besonderheiten, angesagte Geschäfte, ausgesuchte Produkte oder empfehlenswerte Aktivitäten vor.<br /> 
Und wie immer gilt: Die Zentralschweiz steht dabei voll und ganz im Mittelpunkt. </p>
                </div>
{{ else }}
{{ list_articles length="1" constraints="type is bloginfo" }}  
{{ include file="_tpl/article-aside-authors.tpl" }}
{{ /list_articles }}
{{ /if }}

{{ if $gimme->default_section->number == "25" }}
            	{{ local }}
            	<div class="two-columns clearfix equal-heights phone-hide">
            	{{ unset_article }}
            	{{ set_topic name="Was gibts wo Blog:de" }}
            	{{ list_subtopics }}
                    <div class="box">
                        <h4>{{ $gimme->topic->name }}</h4>
                        <ul class="custom-list tag-list">
                        	{{ list_subtopics }}
                            <li><a href="{{ url }}">{{ $gimme->topic->name }}</a> {{ assign var="numpost" value=0 }}{{ list_articles length="1" }}{{ if $gimme->current_list->count }}{{ assign var="numpost" value=$gimme->current_list->count }}{{ /if }}{{ /list_articles }}({{ $numpost }})</li>
                           {{ /list_subtopics }}
                        </ul>
                    </div>
               {{ /list_subtopics }}
					{{ unset_topic }}                
                </div>
                
                <ul class="phone-icon-dropdown top-line">
                  {{ set_topic name="Was gibts wo Blog:de" }}
                  {{ list_subtopics }}
                	<li class="{{ if $gimme->topic->name == "Rubriken" }}tag{{ else }}place{{ /if }}">
                        <select class="dropdownized">
                        	<option value="{{ $gimme->topic->name }}">{{ $gimme->topic->name }}</option>
                        	{{ list_subtopics }}
                            <option value="{{ $gimme->topic->name }}">{{ $gimme->topic->name }}</option>
									{{ /list_subtopics }}
                        </select>
                    </li>
                    {{ /list_subtopics }}
                </ul>               
                {{ /local }} 
                
            	<div class="box top-line bottom-line">
                	<iframe width="350" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.de/maps/ms?msa=0&amp;msid=218370746519352749238.0004d368be2d403db700b&amp;hl=en&amp;ie=UTF8&amp;t=m&amp;ll=47.109392,8.330383&amp;spn=0.654265,0.961304&amp;z=9&amp;output=embed"></iframe><br /><small>View <a href="https://maps.google.de/maps/ms?msa=0&amp;msid=218370746519352749238.0004d368be2d403db700b&amp;hl=en&amp;ie=UTF8&amp;t=m&amp;ll=47.109392,8.330383&amp;spn=0.654265,0.961304&amp;z=9&amp;source=embed" style="color:#0000FF;text-align:left">Was gibt's wo</a> in a larger map</small>
                </div>               
{{ /if }}
        
                <div class="ad">
                    <!--small>Werbung</small-->
                </div>
                
            </div><!-- / Aside -->
        
        </div>
        
        <h2>Neueste Einträge</h2>
        
        <div class="four-columns left-thumb small-type equal-heights clearfix">

{{ local }} 
{{ unset_topic }}
{{ list_articles length="4" columns="2" ignore_section="true" order="bypublishdate desc" constraints="type is blog" }}                
            <article>
                <figure>
                {{ image rendition="artthumb" }}                
              	 	<img src="{{ $image->src }}" width="95" height="53" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />     
					 {{ /image }}
                </figure>
                <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                <p>{{ $gimme->article->lede|strip_tags:false }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }} in {{ $gimme->section->name }}</time><br />
                <a href="{{ url options="article" }}">weiterlesen</a> · <a href="{{ url options="section" }}">zum Blog</a></p>
            
            </article>
            
{{ /list_articles }}
{{ /local }}
        
        </div>
        
        <a class="button white center" href="{{ url options="issue" }}">Zu den Blogs</a>
    
    </div><!-- / Content Wrapper -->

{{ include file="_tpl/footer.tpl" }}
  
{{ include file="_tpl/_html-foot.tpl" }}  

</body>
</html>
