                {{ assign var="secname" value=$gimme->section->name }}
                {{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="type is bloginfo $secname is on" }}

                <div class="box blog-list single-line left-thumb bottom-line">
                    <article>
                        <h6><a href="{{ url options="section" }}">{{ $gimme->article->name }}</a></h6>
                        
                        {{ list_articles length="1" constraints="type is blog" }} 
                        
                        <figure>
                			{{ image rendition="artthumb" }}                
                        	<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />     
                			{{ /image }}                        
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ $gimme->article->lede|strip_tags:false }} <time>{{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time><br />
                        <a href="{{ url options="article" }}">weiterlesen</a> &bull; <a href="{{ url options="section" }}">zum Blog</a></p>
                        
					{{ /list_articles }}                        
                        
                    </article>
                </div>
                
                {{ /list_articles }}