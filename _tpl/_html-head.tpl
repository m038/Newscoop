<!DOCTYPE html>
<html lang="en" dir="ltr" id="modernizrcom" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>{{ strip }}zentral+{{ if !$gimme->article->defined }}&nbsp;|&nbsp;Das unabhängige Online-Magazin der Zentralschweiz{{ /if }}
    {{ if $gimme->article->defined }}&nbsp;|&nbsp;{{ $gimme->article->name|escape:'html'|trim }}
	 {{ elseif $gimme->section->defined }}
    &nbsp;|&nbsp;{{ $gimme->section->name|escape:'html'|trim }}    
    {{ elseif $gimme->template->name == "search.tpl" }}&nbsp;|&nbsp;Suchergebnisse{{ elseif $gimme->template->name == "ticker.tpl" }}&nbsp;|&nbsp;Ticker{{ elseif $gimme->topic->defined }}&nbsp;|&nbsp;Thema: {{ $gimme->topic->name }}{{ elseif $gimme->publication->identifier == "4" }}&nbsp;|&nbsp;Blogs{{ /if }} 
    {{ /strip }}</title>

    {{ include file="_tpl/_meta-description.tpl" }}
    {{ include file="_tpl/_meta-keywords.tpl" }}

    {{ render file="_tpl/_ismobdevice.tpl" }}

    <meta name="author" content="zentral+, MMV online AG, Hirschengraben 43, 6003 Luzern">
    <meta name="copyright" content="zentral+, MMV online AG, Hirschengraben 43, 6003 Luzern">
    <meta name="email" content="info@zentralplus.ch">    

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="{{ url static_file="assets/img/favicon2.ico" }}" rel="SHORTCUT ICON" type="image/x-icon" > 
    <link href="{{ url static_file="assets/img/favicon2.ico" }}" rel="icon" media="all" type="image/x-icon" >
    
    <link rel="apple-touch-icon" href="touch-icon.png">

    <link rel="stylesheet" href="{{ url static_file="assets/css/main.css" }}">
    <link rel="stylesheet" href="{{ url static_file="assets/css/skin.css" }}">
    <link rel="stylesheet" href="{{ url static_file="assets/css/jquery.fancybox.css" }}">
    <!--link rel="stylesheet" href="{{ url static_file="assets/js/libs/helpers/jquery.fancybox-thumbs.css?v=1.0.7" }}" /-->    
    
    {{* Google News Metatag *}}
    {{ if $gimme->article->defined }}
    {{ if $gimme->article->type_name == "news" }}
    {{ if $gimme->article->news_keywords|strip }}
	<meta name="news_keywords" content="{{ $gimme->article->news_keywords }}">
	{{ /if }}
	{{ /if }}
	{{ /if }}    
    
{{*  OPEN GRAPH TAGS FOR FACEBOOK  *}}
{{ if $gimme->article->defined }}
  {{*<meta property="og:locale" content="de_CH" /> *}}
  <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
  <meta property="og:type" content="article" />
  <meta property="og:url" content="http://{{ $gimme->publication->site }}/{{ $gimme->language->code }}/{{ $gimme->issue->url_name }}/{{ $gimme->section->url_name }}/{{ $gimme->article->number }}/" />
  <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
  <meta property="og:description" content="{{ if $gimme->article->type_name == "news" || $gimme->article->type_name == "dossier" || $gimme->article->type_name == "blog" }}{{$gimme->article->lede|strip_tags:false|strip|escape:'html':'utf-8' }}{{ elseif $gimme->article->type_name == "newswire" }}{{$gimme->article->DataLead|strip_tags:false|strip|escape:'html':'utf-8' }}{{ elseif $gimme->article->type_name == "static_page" }}{{$gimme->article->body|strip_tags:false|strip|escape:'html':'utf-8'|truncate:200 }}{{ elseif $gimme->article->type_name == "debatte" }}{{$gimme->article->teaser|strip_tags:false|strip|escape:'html':'utf-8' }}{{ elseif $gimme->article->type_name == "event" }}{{$gimme->article->description|strip_tags:false|strip|escape:'html':'utf-8' }}{{ /if }}" />
  {{ for $i=0 to 99 }}
  {{ if $gimme->article->has_image($i) }}
  <meta property="og:image" content="{{ $gimme->article->image($i)->imageurl }}" />
  {{ /if }}
  {{ /for }}
{{ /if }}

{{ if $gimme->article->defined }}
    {{ if $gimme->article->type_name == "blog" }}
        <meta itemprop="name" content="{{ $gimme->article->name }}">
        <meta itemprop="description" content="{{ $gimme->article->body|strip_tags|truncate:400 }}">
    {{ /if }}
{{ /if }}    
    

    <script src="{{ url static_file="assets/js/libs/extsrc.js" }}"></script>    
    <script src="{{ url static_file="assets/js/libs/modernizr-2.6.2.js" }}"></script>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script>window.jQuery || document.write("<script src='{{ url static_file="assets/js/libs/jquery.min.js" }}'>\x3C/script>")</script>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>


  <!-- metoenews weeather widget -->
  <script src="{{ url static_file="assets/js/meteonews.js" }}"></script>

{{ include file="_tpl/_head-openx-code.tpl" }}

<script type="text/javascript"> 
  var _gaq = _gaq || []; 
  _gaq.push(['_setAccount', 'UA-36303130-1']); 
  _gaq.push(['_trackPageview']); 

  (function() { 
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; 
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; 
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); 
  })(); 
</script>    

</head>
