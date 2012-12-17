{{ assign var="params" implode(',',
     array(
         $smarty.get.region,
         $smarty.get.date,
         $smarty.get.period,
         $smarty.get.key,
         $smarty.get.suisa,
         $smarty.get.vimeo,
         $smarty.get.load,
         $smarty.get.type,
         $smarty.get.page,
         $smarty.get.ls-art0,
         $smarty.get.ls-art1,
         $smarty.get.ls-art2,
         $smarty.get.ls-art3,
         $smarty.get.ls-art4,
         $smarty.get.ls-art5
    ))
}}

{{ if $gimme->publication->identifier == 5 }} 
	{{ if $gimme->issue->number == 3 }}
		{{ render file="_section/section-blog.tpl" }}
	{{ /if }}
{{ elseif $gimme->issue->number == 1 }}
  {{ if $gimme->section->number == 5 }}
    {{ render file="_section/section-dossier.tpl" params=$params }}
  {{ /if }}  
{{ else }}
  {{ if $gimme->section->number lte 60 }}
    {{ render file="_section/section-standard.tpl" }}    
  {{ elseif $gimme->section->number == 70 }}
    {{ render file="_section/section_agenda.tpl" params=$params }}
  {{ elseif $gimme->section->number == 71 }}
    {{ render file="_section/section_events.tpl" params=$params }}
  {{ elseif $gimme->section->number == 72 }}
    {{ render file="_section/section_movies.tpl" params=$params }}
  {{ elseif $gimme->section->number == 73 }}
    {{ render file="_section/section_rests.tpl" params=$params }}
  {{ elseif $gimme->section->number == 80 }}
    {{ render file="_section/section-dialog.tpl" params=$params }}
  {{ elseif $gimme->section->number == 81 }}
    {{ render file="_section/section-debatte.tpl" params=$params }}    
  {{ /if }}
{{ /if }}
