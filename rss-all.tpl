<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/">
<channel>
{{ if $smarty.get.topic }}
    {{ set_topic name=sprintf("%s:de", $smarty.get.topic) }}
{{ /if }}
<title>{{ if $gimme->topic->defined }}{{ $gimme->topic->name|escape }} {{ /if }}{{ $gimme->publication->name|escape }}</title>
<link>{{ url options="root_level" }}</link>
<description>{{ $siteinfo.description|escape }}</description>
<language>{{ $gimme->language->code }}</language>
<copyright>Copyright {{$smarty.now|date_format:"%Y"}}, {{ $gimme->publication->name|escape }}</copyright>
<lastBuildDate>{{$smarty.now|date_format:"%a, %d %b %Y %H:%M:%S"}} +0000</lastBuildDate>
<ttl>60</ttl>
<generator>Newscoop</generator>
<image>
<url>{{ url static_file="assets/img/logo-rss.png" }}</url>
<title>{{ $gimme->publication->name|escape }}</title>
<link>{{ url options="root_level" }}</link>
<width>144</width>
<height>30</height>
</image>
<atom:link href="{{ url options="root_level" }}de/pages/rss_all" rel="self" type="application/rss+xml" />
{{ list_articles length="20" ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is news type is blog" }}
<item>
<title>{{ $gimme->article->name|escape }}</title>
<link>{{ url options="article" }}</link>
<description>
{{ image rendition="artfull" }}&lt;img src="{{ $gimme->url->scheme }}://{{ $gimme->url->host }}{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="{{ $image->caption }}" hspace="5" /&gt;{{ /image }}
    {{ $gimme->article->body|escape }}
&lt;br clear="all"&gt;
</description>
<category domain="{{ url options="section" }}">{{$gimme->section->name}}</category>
{{if $gimme->article->author->name}}
<atom:author><atom:name>{{ list_article_authors }}{{$gimme->author->name}}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /list_article_authors }}</atom:name></atom:author>
{{/if}}
<pubDate>{{$gimme->article->publish_date|date_format:"%a, %d %b %Y %H:%M:%S"}} +0000</pubDate>
<guid isPermaLink="true">{{ url options="article" }}</guid>
</item>
{{/list_articles}}
</channel>
</rss>
