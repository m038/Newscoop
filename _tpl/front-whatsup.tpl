                    <div class="box left-thumb">
                    {{ list_articles length="1" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is bloginfo Featured_Blog_On_Front is on" }}
                    {{ local }}
                    {{ unset_article }}                    
                    {{ assign var="sectionUrl" value="{{ url }}" }}
                    {{ /local }}
                    	<h4 class="box-title">{{ if $gimme->section->number == 25 }}<img src="{{ uri static_file="pictures/title-icons/bag.png" }}" alt="" />{{ /if }}{{ $gimme->section->name }}</h4>
                    	   {{ list_articles length="1" constraints="type is blog" }}
                        <article class="bottom-line">
                        	<figure>
      				         {{ image rendition="artthumb" }}                
		                        <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" /></a>     
                				{{ /image }}                        	
                        	</figure>
                        	<h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        	<p>{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a></p>
                        </article>
                        {{ /list_articles }}
                        
                        <div class="two-columns clearfix equal-heights">
                
                {{ if $gimme->section->number == 25 }}        
            	{{ set_topic name="Was gibts wo Blog:de" }}
            	{{ list_subtopics }}
                    <div class="box">
                        <h4>{{ $gimme->topic->name }}</h4>
                        <ul class="custom-list tag-list">
                        	{{ list_subtopics length="5" }}
                            <li><a href="{{ $sectionUrl }}?tpid={{ $gimme->topic->identifier }}">{{ $gimme->topic->name }}</a> {{ assign var="numpost" value=0 }}{{ list_articles length="1" }}{{ if $gimme->current_list->count }}{{ assign var="numpost" value=$gimme->current_list->count }}{{ /if }}{{ /list_articles }}({{ $numpost }})</li>
                           {{ /list_subtopics }}
                        </ul>
                    </div>
               {{ /list_subtopics }}
					{{ unset_topic }}
				{{ /if }}
                        
                        </div>
                      {{ /list_articles }}  
                    </div>
