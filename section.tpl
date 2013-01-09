{{* special things, like auxiliary iframes *}}
{{ if ($gimme->publication->identifier == 2) && ($gimme->section->number == 5) && ($smarty.get.iframe_holder) }}
    {{ if $smarty.get.iframe_type == "article-payment" }}
        {{ render file="_article/article-payment-holder.tpl" }}
    {{ /if }}
{{ else }}

{{ if $gimme->publication->identifier == 2 && $gimme->section->number lt 100 }}
	{{ render file="_section/section-standard.tpl" }}
{{ elseif $gimme->publication->identifier == 2 && $gimme->section->number == 210 }}
	{{ render file="editorial-comments.tpl" }}
{{ elseif $gimme->publication->identifier == 4 && $gimme->issue->is_current }}	
	{{ if $gimme->section->number == "100" }}
		{{ render file="_section/section-blog-fundstucke.tpl" }}
	{{ else }}
		{{ render file="_section/section-blog.tpl" }}
	{{ /if }}
{{ /if }}	

{{ /if }}
