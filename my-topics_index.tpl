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
                        <form method="GET" action="">
                        <select name="topic" class="dropdownized" onchange="this.form.submit();">
                            <option value="">Alle Themen</option>
                            {{ foreach $topics as $topic }}
                            <option value="{{ $topic->value|escape }}" {{ if isset($smarty.get.topic) && $smarty.get.topic == $topic->value }} selected{{ /if }}>{{ $topic->name|escape }}</option>
                            {{ /foreach }}
                        </select>
                        </form>
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
                    {{ $uri = $view->url() }}
                    {{ list_articles order="byPublishDate desc" constraints="type is news type is blog $filter" length=$length }}
                    <article>
                        <h6><a href="{{ uri options="article" }}">{{ $gimme->article->dateline|escape }}</a></h6>
                        {{ image rendition="artthumb" }}
                        <figure>
                            <a href="{{ url options="article" }}"><img alt="" src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" /></a>
                        </figure>
                        {{ /image }}
                        <h3><a href="{{ uri options="article" }}">{{ $gimme->article->title|escape }}</a></h3>
                        <p>{{ $gimme->article->lede|strip_tags:false }}</p>

                        <time>Artikel, {{ include file="_tpl/relative-date.tpl" date=$gimme->article->publish_date }}</time>
                    </article>

                    {{ include file="_tpl/pagination.tpl" }}
                    {{ /list_articles }}
                </div><!-- / Main -->            
                
                <div class="aside">
                    
                </div><!-- / Aside -->
            
            </div>
        {{ /if }}{{* /!empty *}}
</div><!-- / Content Wrapper -->
{{/block}}
