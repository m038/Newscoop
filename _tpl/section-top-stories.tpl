{{ $region = $gimme->user['region'] }}
{{ $condition = "$region is on" }}
{{ if !$region }}
    {{ $condition = "" }}
{{ /if }}

{{ list_articles length="5" constraints="type not newswire `$condition`" }}
{{ if $gimme->current_list->at_beginning }}
    <article class="bottom-line featured">
        <figure>
        {{ image rendition="artfull" }}
            <a href="{{ url options="article" }}"><img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if !($image->photographer == "") }}(Bild: {{ $image->photographer }}){{ /if }}" /></a>
        {{ /image }}
            <figcaption>
                {{ if $gimme->article->comment_count }}<span class="phone-comm">{{ $gimme->article->comment_count }}</span>{{ /if }}
                {{ if $gimme->article->dateline }}<h6><a href="{{ url options="article" }}">{{ $gimme->article->dateline }}</a></h6>{{ /if }}
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
            {{ $topics[] = $gimme->topic }}
            <a href="{{ unset_section }}{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>{{ if !$gimme->current_list->at_end }}, {{ /if }}
        {{ if $gimme->current_list->at_end }}
            </p>
        </div>
        {{ /if }}
    {{ /list_article_topics }}

    {{ set_default_section }}                    
    {{ render file="_ads/section-fullbanner.tpl" }}
    {{ render file="_ads/mobile-section-216x36.tpl" }}
                
{{ else }}

    {{ if $gimme->current_list->index == "2" }}
        <div class="left-thumb bottom-line article-spacing clearfix phone-list-title-only">
    {{ /if }}
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
    {{ if $gimme->current_list->at_end && $gimme->current_list->index gt 1 }}
        </div><!-- / 1 column -->
    {{ /if }}

{{ /list_articles }}
