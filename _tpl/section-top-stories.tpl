{{ list_articles length="5" constraints="type not newswire" }}
{{ if $gimme->current_list->at_beginning }}
              <article class="bottom-line featured">
                 
                  <figure>
{{ image rendition="artfull" }} 
                    <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />
{{ /image }}                    
                        <figcaption>
                          {{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                          <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                            <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        </figcaption>
                    </figure>
                    
                    <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                    
                </article>
                
                {{ list_article_topics }}
                {{ if $gimme->current_list->at_beginning }}
                <div class="box bottom-line centered-tag-list">
                  <p><strong>Aktuelle Themen:</strong>
                  {{ /if }} 
                  <a href="#">{{ $gimme->topic->name }}</a>{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}
                  {{ if $gimme->current_list->at_end }}
                  </p>
                </div>
                {{ /if }} 
                {{ /list_article_topics }}
{{ else }}
    {{ if $gimme->current_list->index == "2" }}                
                <div class="left-thumb bottom-line article-spacing clearfix phone-list-title-only">
    {{ /if }}            
                    <article>
                        <h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>
                        {{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                        <figure>
{{ image rendition="artthumb" }} 
                    <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(bild: {{ $image->photographer }}){{ /if }}" />
{{ /image }}
                        </figure>
                        <h3><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h3>
                        <p>{{ include file="_tpl/_admin-edit.tpl" }}{{ $gimme->article->lede|strip_tags:false }} <a href="{{ url options="article" }}">weiterlesen</a> {{ if $gimme->article->comment_count }}<span class="comm">{{ $gimme->article->comment_count }}</span>{{ /if }}</p>
                    </article>
{{ /if }}  
    {{ if $gimme->current_list->at_end && $gimme->current_list->index gt 1 }}
                </div><!-- / 1 column --> 
    {{ /if }}                                 
{{ /list_articles }}
