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
{{*** Changes introduced according to ticket MOTM-537 - only one blogpost to appear in most read list ***}}
{{ assign var="blogPost" value=0 }}
{{ assign var="postCount" value=0 }}
{{ list_articles length="6" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypopularity desc" constraints="type is news type is blog type not newswire publish_date greater_equal $mydate" }}
{{ if $blogPost == 0 }}
  {{ assign var="postCount" value=$postCount+1 }}
{{ /if }}
{{ if $postCount lt 6 }}
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
{{ if $gimme->article->type_name == "blog" }}
{{ assign var="blogPost" value=1 }}
{{ /if }}
{{/list_articles}}
</channel>
</rss>
