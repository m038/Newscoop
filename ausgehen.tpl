{{* include file="_ausgehen/libs.tpl" *}}

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

  {{ if $gimme->section->number == 80 }}
    {{ render file="_section/section_agenda.tpl" params=$params }}
  {{ elseif $gimme->section->number == 71 }}
    {{ render file="_section/section_events.tpl" params=$params }}
  {{ elseif $gimme->section->number == 72 }}
    {{ render file="_section/section_movies.tpl" params=$params }}
  {{ elseif $gimme->section->number == 73 }}
    {{ render file="_section/section_rests.tpl" params=$params }}
  {{ /if }}

