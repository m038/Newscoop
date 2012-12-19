{{ if $gimme->article->type_name == "news" || $gimme->article->type_name == "editor_message" || $gimme->article->type_name == "newswire" }}
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
{{ /if }}
