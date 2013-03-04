<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/">
<channel>
<title>Meistgelesen | {{ $gimme->publication->name|escape }}</title>
<link>{{ capture name="link" }}{{ url options="root_level" }}{{ /capture }}{{ $smarty.capture.link|escape }}</link>
<description>{{ $siteinfo.description|escape }}</description>
<language>{{ $gimme->language->code|escape }}</language>
<copyright>Copyright {{$smarty.now|date_format:"%Y"}}, {{ $gimme->publication->name|escape }}</copyright>
<lastBuildDate>{{$smarty.now|date_format:"%a, %d %b %Y %H:%M:%S %z"}}</lastBuildDate>
<ttl>60</ttl>
<generator>Newscoop</generator>
<image>
<url>{{ capture name="url" }}{{ url static_file="assets/img/logo-rss.png" }}{{ /capture }}{{ $smarty.capture.url|escape }}</url>
<title>{{ $gimme->publication->name|escape }}</title>
<link>{{ capture name="link" }}{{ url options="root_level" }}{{ /capture }}{{ $smarty.capture.link|escape }}</link>
<width>144</width>
<height>30</height>
</image>
<atom:link href="{{ url options="root_level" }}de/static/rss_most_popular" rel="self" type="application/rss+xml" />
{{ assign var="mydate" value=strtotime('-7 days') }} 
{{ $mydate=$mydate|date_format:'%Y-%m-%d' }}
{{*** Changes introduced according to ticket MOTM-549 - only one blogpost per blog to appear in most read list ***}}
  {{ $mostReadArticles = array() }}
  {{ assign var="i" value=0 }}
  {{ list_articles length="20" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypopularity desc" constraints="type not bloginfo type not dossier type not event type not poll type not restaurant type not screening type not static_page type not editor_message publish_date greater_equal $mydate" }}
    {{ assign var="arrayCheck" value=$gimme->publication->identifier*100+$gimme->section->number }}
    {{ if not $mostReadArticles[$arrayCheck] }}
      {{ $mostReadArticles[$arrayCheck]=true }}
      {{ assign var="i" value=$i+1 }}
      {{ if $i < 7 }}
<item>
    <title>{{ $gimme->article->name|escape }}</title>
    <link>{{ capture name="link" }}{{ url options="article" }}{{ /capture }}{{ $smarty.capture.link|escape }}</link>
    <description>
        {{ capture name="description" }}
                {{ image rendition="artthumb" }}
                <img src="{{ $view->serverUrl($image->src) }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="{{ $image->caption }}" hspace="5" />
                {{ /image }}
                <div class="lead">{{ $gimme->article->lede }}</div>
                <br clear="all" />
        {{ /capture }}
        {{ $smarty.capture.description|escape }}
    </description>
    <category domain="{{ capture name="url" }}{{ url options="section" }}{{ /capture }}{{ $smarty.capture.url|escape }}">{{ $gimme->section->name|escape }}</category>
    {{ if $gimme->article->author->name }}
    <atom:author><atom:name>{{ list_article_authors }}{{ $gimme->author->name|escape }}{{ if !$gimme->current_list->at_end }}, {{ /if }}{{ /list_article_authors }}</atom:name></atom:author>
    {{ /if }}
    <pubDate>{{ $gimme->article->publish_date|date_format:"%a, %d %b %Y %H:%M:%S %z" }}</pubDate>
    <guid isPermaLink="true">{{ capture name="permalink" }}{{ url options="article" }}{{ /capture }}{{ $smarty.capture.permalink|escape }}</guid>
    <summary>{{ $gimme->article->dateline|escape }}</summary>
</item>
      {{ /if }}
    {{ /if }}
  {{ /list_articles }}
</channel>
</rss>
