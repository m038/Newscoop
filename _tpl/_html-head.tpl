<!DOCTYPE html>
<html lang="en" dir="ltr" id="modernizrcom" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>{{ strip }}
    {{ if $gimme->article->defined }}{{ $gimme->article->name|escape:'html'|trim }}&nbsp;|&nbsp;
	 {{ elseif $gimme->section->defined }}
    {{ $gimme->section->name|escape:'html'|trim }}&nbsp;|&nbsp;    
    {{ elseif $gimme->template->name == "search.tpl" }}Suchergebnisse&nbsp;|&nbsp;{{ elseif $gimme->template->name == "ticker.tpl" }}Ticker&nbsp;|&nbsp;{{ elseif $gimme->topic->defined }}Thema: {{ $gimme->topic->name }}&nbsp;|&nbsp;{{ elseif $gimme->publication->identifier == "4" }}Blogs&nbsp;|&nbsp;{{ /if }} 
    Zentral+
    {{ /strip }}</title>
    
    
   
    
    
    {{ include file="_tpl/_meta-description.tpl" }}
    {{ include file="_tpl/_meta-keywords.tpl" }}
    <meta name="author" content="zentral+, MMV online AG, Hirschengraben 43, 6003 Luzern">
    <meta name="copyright" content="zentral+, MMV online AG, Hirschengraben 43, 6003 Luzern">
    <meta name="email" content="info@zentralplus.ch">    

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="{{ uri static_file="assets/img/favicon.ico" }}">
    <link rel="apple-touch-icon" href="touch-icon.png">

    <link rel="stylesheet" href="{{ uri static_file="assets/css/main.css" }}">
    <link rel="stylesheet" href="{{ uri static_file="assets/css/skin.css" }}">
    <link rel="stylesheet" href="{{ uri static_file="assets/css/jquery.fancybox.css" }}">
    <!--link rel="stylesheet" href="{{ uri static_file="assets/js/libs/helpers/jquery.fancybox-thumbs.css?v=1.0.7" }}" /-->    
    
    {{ include file="_tpl/_head-openx-code.tpl" }}   
    
    <script src="{{ uri static_file="assets/js/libs/modernizr-2.6.2.js" }}"></script>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script>window.jQuery || document.write("<script src='{{ uri static_file="assets/js/libs/jquery.min.js" }}'>\x3C/script>")</script>
    
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