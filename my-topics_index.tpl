{{extends file="layout.tpl"}}

{{block page_name}}Meine Themen{{/block}}

{{block content_wrapper}}
<div class="content-wrapper top-line events-content">
    {{ $topics = array() }}
    {{ list_user_topics }}
        {{ $topics[$topic->value] = $topic }}
    {{ /list_user_topics }}
        	
    {{ if empty($topics) }}
        {{ include file="_tpl/my-topics-empty.tpl" }}
    {{ else }}
           	<div class="content no-bottom-line equal-heights clearfix">     	
            	<div class="events-aside info-text clearfix">
                	
                    <div class="box desktop-hide">
                        <h4>Zeige</h4>
                        <select name="topic" class="dropdownized">
                            <option value="Alle Themen">Alle Themen</option>
                            {{ foreach $topics as $topic }}
                            <option value="{{ $topic->value }}">{{ $topic->name|escape }}</option>
                            {{ /foreach }}
                        </select>
                    </div>
                    
                	<ul class="custom-list tag-list">
                    	<li class="active"><a href="{{ $view->url() }}">Alle Themen</a></li>
                        {{ foreach $topics as $topic }}
                    	<li><a href="{{ $view->url() }}?topic={{ $topic->value|urlencode }}">{{ $topic->name|escape }}</a></li>
                        {{ /foreach }}
                    </ul>

                    <a href="#themen-verwalten" class="button white wide fancybox phone-hide">Themen verwalten</a>
                    {{ include file="_tpl/my-topics-update.tpl" topics=$topics userTopics=$topics }}
                	
                    <h4>Über «Meine Themen»</h4>
                    <p>Auf dieser Seite sehen Sie alle aktuellen Artikel zu den Themen, die Sie abonniert haben.</p>
                
                </div>
    
                <div class="main left-thumb article-spacing clearfix">
                    {{ if !empty($smarty.get.topic) && array_key_exists($smarty.get.topic, $topics) }}
                        {{ $filter = sprintf("topic is %s", str_replace(' ', '\ ', $smarty.get.topic)) }}
                    {{ else }}
                        {{ $filter = "" }}
                        {{ foreach $topics as $topic }}
                            {{ $filter = sprintf("%s topic is %s", $filter, str_replace(' ', '\ ', $topic->value)) }}
                        {{ /foreach }}
                    {{ /if }}

                    {{ $length = 5 }}
                    {{ list_articles order="byPublishDate desc" constraints="type is news type is blog $filter" length=$length }}
                    <article>
                        <h6><a href="{{ uri options="article" }}">{{ $gimme->article->dateline|escape }}</a></h6>
                        {{ image rendition="artthumb" }}
                        <figure>
                            <img alt="" src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" />
                        </figure>
                        {{ /image }}
                        <h3><a href="{{ uri options="article" }}">{{ $gimme->article->title|escape }}</a></h3>
                        <p>{{ $gimme->article->lede|strip_tags:false }}</p>
                        <time>Artikel, vor 1 Tag</time>
                    </article>

                    {{ if $gimme->current_list->at_end }}
                        {{ $pages = ceil($gimme->current_list->count * 1.0 / $length) }}
                        {{ $page = ceil(($gimme->current_list->start + 1.0) / $length) }}
                    <ul class="paging center top-line">
                        <li>
                            {{ if $gimme->current_list->has_previous_elements }}
                            <a class="button white prev" href="{{ $view->url() }}?{{ urlparameters options="previous_items" }}">&lt;</a>
                            {{ else }}
                            <span class="button white prev">&lt;</a>
                            {{ /if }}
                        </li>

                    	<li class="caption">{{ $page }} von {{ $pages }}</li>

                    	<li>
                            {{ if $gimme->current_list->has_next_elements }}
                            <a class="button white next" href="{{ $view->url() }}?{{ urlparameters options="next_items" }}">&gt;</a></li>
                            {{ else }}
                            <span class="button white prev">&gt;</a>
                            {{ /if }}
                        </li>
                    </ul>
                    {{ /if }}
                    {{ /list_articles }}
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                    <div class="ad top-space">
                        <small>Werbung</small>
                        <a href="#"><img alt="" src="pictures/ad-2.jpg"></a>
                    </div>
                
                </div><!-- / Aside -->
            
            </div>
        {{ /if }}{{* /!empty *}}
</div><!-- / Content Wrapper -->
{{/block}}
