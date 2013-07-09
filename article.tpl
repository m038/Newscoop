{{ if $gimme->article->type_name == "news" || $gimme->article->type_name == "editor_message" }}
  {{ render file="_article/article-news.tpl" }}
{{ elseif $gimme->article->type_name == "blog" }}
	{{ if $gimme->section->number == "100" }}
   	{{ render file="_article/article-blogpost-fundstucke.tpl" }}	
	{{ else }}
  		{{ render file="_article/article-blogpost.tpl" }}
  	{{ /if }}
{{ elseif $gimme->article->type_name == "dossier" }}
  {{ render file="_article/article-dossier.tpl" }}  
{{ elseif $gimme->article->type_name == "debatte" }}
  {{ render file="_article/article-debatte.tpl" }}   
{{ elseif $gimme->article->type_name == "restaurant" }}
  {{ render file="_article/article_restaurant.tpl" }}  
{{ elseif $gimme->article->type_name == "newswire" }}
  {{ render file="ticker.tpl" }}
{{* elseif $gimme->article->type_name == "weather_page" *}}
  {{* render file="_article/article-weather.tpl" *}}
{{ elseif $gimme->article->type_name == "static_page" }}
  {{ render file="_article/article-static.tpl" }}   
{{ /if }}
