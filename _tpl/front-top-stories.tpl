<div class="main"> 
          <!-- p>$isMobDevice = {{ $isMobDevice }}</p -->             

{{ $region = $gimme->user['region'] }}
{{ $length = 15 }}
{{ if !$region }}
    {{ $length = 5 }}
{{ /if }}

{{ $articleCount = 0 }}
{{ list_playlist_articles id=2 length=$length }}{{* workaround to filter playlist articles by region *}}
{{ if $articleCount < 5 && (!$region || $gimme->article->$region) }}
    {{ $articleCount = $articleCount + 1 }}{{* can't use ++ *}}

{{ if $articleCount == 1 }}
<article class="bottom-line featured">
                  <figure>
            {{ image rendition="artfull" }}                
                    <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>     
            {{ /image }}
                        <figcaption>
                          {{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                          <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                            <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        </figcaption>
                    </figure>
                    
                    <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                    
                </article>

																		{{* added on Jan 19th *}}
																		{{ list_article_topics }}
                						{{ if $gimme->current_list->at_beginning }}
                						<div class="box bottom-line centered-tag-list">
                  				<p><strong>Aktuelle Themen:</strong>	
                  		{{ /if }}																	
                        {{ $topics[] = $gimme->topic }}
                    <a href="{{ unset_section }}{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>{{ if !$gimme->current_list->at_end }}, {{ /if }}
                    {{ if $gimme->current_list->at_end }}
                       </p>
                     </div>
                    {{ /if }}                    
                    {{ /list_article_topics }}  
                 
                <div class="ad bottom-line">
                  {{ include file="_tpl/weather-mobile-header.tpl" }}
                </div>                
{{ /if }}

{{ if $articleCount == 2 }}
    <div class="two-columns clearfix equal-heights">
{{ elseif $articleCount == 4 }}
    <div class="two-columns-wide aside-overlap left-thumb clearfix equal-heights">
{{ /if }}

{{ if $articleCount == 2 || $articleCount == 3 }}
                  <article>
                      {{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                      <figure>
              {{ image rendition="arthalf" }}                
                      <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>     
              {{ /image }}
                        </figure>
                        <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>   
                    </article>
{{ elseif $articleCount == 4 || $articleCount == 5 }}
                    <article>
                    
                        <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                        {{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                        <figure>
                {{ image rendition="artthumb" }}                
                        <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>     
                {{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                    
                    </article>
{{ /if }}

{{ if $articleCount == 3 || $articleCount == 5 }} 
</div><!-- / 2 columns -->
{{ /if }}

{{ /if }}

{{ if $gimme->current_list->at_end && ($articleCount == 2 || $articleCount == 4) }}
</div>
{{ /if }}

{{ /list_playlist_articles }}
</div><!-- / Main -->                
