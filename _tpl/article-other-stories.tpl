        	<h2><a href="/">Aktuell</a></h2>
                
            <div class="three-columns clearfix equal-heights">
{{ assign var="i" value=0 }}
{{ list_playlist_articles length="4" id="2" }}
{{ if $gimme->article->number !== $gimme->default_article->number }}
{{ assign var="i" value=$i+1 }}
{{ if $i lt 4 }}            
                <article>                
                    <figure>
						  {{ image rendition="arthalf" }} 
                    		<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" />
						  {{ /image }}                    
                    </figure>
                    <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                    <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                    <p>{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a></p>
                </article>
{{ /if }}                
{{ /if }}
{{ /list_playlist_articles }}                

            
            </div><!-- / 3 columns -->