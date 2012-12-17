{{ if $gimme->publication->identifier == 2 && $gimme->section->number lt 100 }}
	{{ render file="_section/section-standard.tpl" }}
{{ elseif $gimme->publication->identifier == 4 && $gimme->issue->is_current }}	
	{{ if $gimme->section->number == "100" }}
		{{ render file="_section/section-blog-fundstucke.tpl" }}
	{{ else }}
		{{ render file="_section/section-blog.tpl" }}
	{{ /if }}
{{ /if }}	